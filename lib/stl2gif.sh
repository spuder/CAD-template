find ~+ -type f -name "*.stl" -print0 | while read -d '' -r file; do 
	echo "Reading $file"
    MYTMPDIR="$(mktemp -d)"
    trap 'rm -rf -- "$MYTMPDIR"' EXIT

    echo "Creating temp directory ${MYTMPDIR}"

    #TODO: ensure openscad is in path
    /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD /dev/null -D '$vpd = 200;' -D '$vpr = [60, 0, 360 * $t];' -o "${MYTMPDIR}/foo.png"  -D "import(\"$file\");" --imgsize=250,250 --animate 60 --colorscheme "Tomorrow Night" --viewall

    #TODO: ensure ffmpeg is in path
    yes | ffmpeg \
        -framerate 12 \
        -pattern_type glob \
        -i "$MYTMPDIR/*.png" \
        -r 24 \
        -vf scale=512:-1 \
        "${file}.gif" \
        ;
    rm -rf -- "$MYTMPDIR"
done


# import("/Users/spencerowen/Code/github/spuder/ender2pro-led-bracket/CAD/M3 LED Bracket.stl");
# $vpr = [60, 0, 360 * $t];

# openscad /dev/null -D '$vpd = 200;' -D '$vpr = [60, 0, 360 * $t];' -o foo.png  -D 'import("/Users/spencerowen/Code/github/spuder/ender2pro-led-bracket/CAD/M3 LED Bracket.stl");' --imgsize=250,250 --animate 60 --colorscheme "Tomorrow Night" --viewall
# yes | ffmpeg \
#   -framerate 12 \
#   -pattern_type glob \
#   -i 'foo*.png' \
#   -r 24 \
#   -vf scale=512:-1 \
#   out.gif \
# ;