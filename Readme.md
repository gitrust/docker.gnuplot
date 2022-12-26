# Description

This is an Alpine based gnuplot (v5.4.5) docker image.

# Quick Reference

- https://github.com/gitrust/docker.gnuplot
- http://www.gnuplot.info

# How to use this image

```
docker run --rm -v $(pwd):/home/docker:rw gitrust/docker.gnuplot
```

An example with a script
```
docker run --rm -v $(pwd):/home/docker:rw gitrust/docker.gnuplot -e "set terminal png; set output 'out.png'; plot sin(x); replot"
```

# Build Configuration

Options compiled into gnuplot binary

```
$ docker run --rm -v $(pwd):/home/docker:rw docker.gnuplot -e "show version long"

        G N U P L O T
        Version 5.4 patchlevel 5    last modified 2022-09-28

        Copyright (C) 1986-1993, 1998, 2004, 2007-2022
        Thomas Williams, Colin Kelley and many others

        gnuplot home:     http://www.gnuplot.info
        faq, bugs, etc:   type "help FAQ"
        immediate help:   type "help"  (plot window: hit 'h')

Compile options:
    -READLINE  +LIBREADLINE  +HISTORY
    +OBJECTS  +STATS +EXTERNAL_FUNCTIONS
    +LIBCERF  +GD_PNG  +GD_JPEG  +GD_TTF  +GD_GIF  +ANIMATION
    -USE_CWDRC  +X11  +USE_MOUSE  +HIDDEN3D_QUADTREE
    64-bit integer arithmetic

GNUPLOT_DRIVER_DIR = "/usr/local/libexec/gnuplot/5.4"
GNUPLOT_PS_DIR     = "/usr/local/share/gnuplot/5.4/PostScript"
HELPFILE           = "/usr/local/share/gnuplot/5.4/gnuplot.gih"
```