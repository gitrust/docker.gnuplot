

build:
	docker build  -t gitrust/gnuplot .

run:
	docker run --rm -v %cd%:/home/docker:rw -it gitrust/gnuplot