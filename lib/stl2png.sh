find ~+ -type f -name "*.stl" -print0 | while read -d '' -r file; do 
	echo "Reading $file"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD /dev/null -D "import(\"$file\");" -o "$file.png" --imgsize=600,600 --colorscheme "Tomorrow Night"
done