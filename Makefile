all:
	mkdir -p bin
	gcc lib/raport.c -o bin/raport

clean:
	rm -rf bin/raport

test:
	rspec spec

run:
	bin/raport
