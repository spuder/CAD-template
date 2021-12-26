# Usage
# make clean 	# deletes generated README.md file
# make all # Run specified tasks


# Note: Makefiles require that you use 'tabs' not 'spaces'
all: clean stl jpeg gif template
clean:
	./lib/clean.sh
stl:
	./lib/stl2png.sh
jpeg:
	./lib/heic2jpeg.sh
gif:
	./lib/stl2gif.sh
template:
	./lib/yaml2md.rb