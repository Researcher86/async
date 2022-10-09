build:
	docker-compose build

up: build-go
	docker-compose up -d

down:
	docker-compose down -v

swoole-go:
	docker-compose run --rm swoole bash

rr-go:
	docker-compose run --rm rr bash

# make build-go
build-go:
	cd go && go build main.go

# make bench-swoole
bench-swoole:
    # https://github-wiki-see.page/m/giltene/wrk2/wiki/Installing-wrk2-on-Linux#:~:text=Installing%20wrk2%20on,wrk%20and%20build.
	wrk -c1000 -t100 -R5000 http://localhost:9501

# make bench-workerman
bench-workerman:
	wrk -c1000 -t100 -R5000 http://localhost:9503

# make bench-rr
bench-rr:
	wrk -c1000 -t100 -R5000 http://localhost:9502

# make bench-node
bench-node:
	wrk -c2000 -t200 -R5000 http://localhost:9504

# make bench-go
bench-go:
	wrk -c1000 -t100 -R5000 http://localhost:9505

# make bench-react
bench-react:
	wrk -c1000 -t100 -R5000 http://localhost:9506


