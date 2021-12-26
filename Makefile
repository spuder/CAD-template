# Usage
# make clean 	# deletes generated README.md file
# make preview 	# uses openscad to generate a PNG preview of an STL file
# make compress # converts HEIC files to JPEG for easier uploading to thingiverse

# Note: Makefiles require that you use 'tabs' not 'spaces'
all: clean stl jpeg template
clean:
	./lib/clean.sh
stl:
	./lib/stl2png.sh
jpeg:
	./lib/heic2jpeg.sh
template:
	./lib/yaml2md.rb