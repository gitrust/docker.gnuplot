

build:
	docker build  -t docker.gnuplot .

run:
	docker run --rm -v %cd%:/home/docker:rw -it docker.gnuplot