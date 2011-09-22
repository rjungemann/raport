all:
	mkdir -p bin
	gcc lib/ransock.c -o bin/ransock

clean:
	rm -rf bin/ransock

test:
	rspec spec

run:
	bin/ransock
