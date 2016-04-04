clear
FILES=0*.jpg
for f in $FILES
do
    echo "$f"
    convert $f "$f.png"
done
