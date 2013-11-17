
.PHONY: clean build test all 

mocha := ./node_modules/.bin/mocha
lsc := ./node_modules/.bin/lsc

all: build

clean:
	rm -rf build

build: 
	lsc -co build src 
	
test:	clean build
	mocha --recursive ./build/test

