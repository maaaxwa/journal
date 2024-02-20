#!/bin/bash

magick *.jpg -set filename:f "%[t]_sq" -background white -gravity center -extent %[fx:max\(w,h\)*1.02]x%[fx:max\(w,h\)*1.02] -quality 50 "%[filename:f].jpg"

DIR="$(pwd)/*_sq.jpg"
ENTRY_NAME=$(basename "$PWD")
ENTRY_FILE=../../_posts/$ENTRY_NAME.md
touch $ENTRY_FILE

files=(*)

echo "---" >> $ENTRY_FILE
echo "layout: post" >> $ENTRY_FILE
echo "title:  " >> $ENTRY_FILE
echo "date:   ${ENTRY_NAME:0:10}" >> $ENTRY_FILE
echo "image:  '/images/$ENTRY_NAME/${files[0]}'" >> $ENTRY_FILE
echo "tags:   []" >> $ENTRY_FILE
echo "---" >> $ENTRY_FILE
echo "" >> $ENTRY_FILE
echo "<div class=\"gallery-box\">" >> $ENTRY_FILE
echo "  <div class=\"gallery\">" >> $ENTRY_FILE

for f in $DIR
do
    echo "    <img src=\"/journal/images/$ENTRY_NAME/$(basename "$f")\" />" >> $ENTRY_FILE
done

echo "  </div>" >> $ENTRY_FILE
echo "</div>" >> $ENTRY_FILE
