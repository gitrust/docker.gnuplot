FROM alpine:3.17.0 AS builder

# Fonts      
RUN apk add --no-cache fontconfig \
        msttcorefonts-installer && \
        update-ms-fonts && \
        fc-cache -f

# Install tools to build gnuplot
RUN apk add --no-cache \
        autoconf \
        automake \
        cairo \
        coreutils \
        curl \
        g++ \
        gcc \
        gd-dev \
        git \
        libgd \
        libjpeg-turbo \
        libjpeg \
        libpng \
        libtool \
        libwebp \
        lua \
        make \
        pango \
        readline \
        zlib

# Dev Libs
RUN apk add --no-cache \
        cairo-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libwebp-dev \
        lua-dev \
        pango-dev \
        readline-dev \
        zlib-dev

# Source directory
RUN mkdir -p /src
WORKDIR /src

# libcerf
RUN apk add --no-cache cmake
RUN git clone https://jugit.fz-juelich.de/mlz/libcerf.git libcerf
RUN cd libcerf && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make && \
        make install

# gnuplot
RUN curl -L https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.5/gnuplot-5.4.5.tar.gz/download > gnuplot-5.4.5.tar.gz
RUN tar -xvf gnuplot-5.4.5.tar.gz
RUN cd gnuplot-5.4.5 \
        && ./configure \
                --disable-raise-console \
                --without-lua \
                --with-qt=no \
        && make \
        && make install

# Second Stage
FROM alpine:3.17.0
RUN apk --no-cache add \
        libgcc \
        cairo \
        libgd \
        libjpeg \
        libjpeg-turbo \
        libpng \
        libwebp \
        pango \
        readline

# Copy resources to second stage
COPY --from=builder /usr/share/fonts/truetype/msttcorefonts /usr/share/fonts/truetype/msttcorefonts
COPY --from=builder /usr/local/bin/gnuplot /usr/local/bin/gnuplot
COPY --from=builder /usr/local/lib/libcerf.* /usr/local/lib/
COPY --from=builder /usr/local/share/doc /usr/local/share/doc
COPY --from=builder /usr/local/share/gnuplot /usr/local/share/gnuplot
COPY --from=builder /usr/local/share/man /usr/local/share/man
COPY --from=builder /usr/local/libexec/gnuplot /usr/local/libexec/gnuplot

ENV GDFONTPATH=/usr/share/fonts/truetype/msttcorefonts/

# Add user
RUN adduser -D docker
USER docker

WORKDIR /home/docker

ENTRYPOINT ["/usr/local/bin/gnuplot"]
CMD ["--help"]
