#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"

ORIGINAL_WIDTH="1440"
ORIGINAL_HEIGHT="1440"

PARTS="0 1"
FPS="60"

OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

if [ "${HALF_RES}" == "true" ]; then
    WIDTH=$(($WIDTH / 2))
    HEIGHT=$(($HEIGHT / 2))
fi

#Set image size
RESOLUTION="${WIDTH}^x${HEIGHT}^>"

#Create a folder for each part
PARTS=$(echo "$PARTS" | tr " " "\n")

rm -rf "$OUT/bootanimation/"

for PART in $PARTS
do
    mkdir -p "$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$PART"
done

# Decompress bootanimation.zip
unzip "vendor/aoscp/bootanimation/bootanimation.zip" -d "$OUT/bootanimation/"

# Resize all images
find $OUT/bootanimation/ -type f -name '*.png' -exec convert -resize "$RESOLUTION" -colors 250 {}

# Create desc.txt
echo "$IMAGEWIDTH $IMAGEHEIGHT" "$FPS" > "$OUT/bootanimation/desc.txt"
cat "vendor/aoscp/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "${OUT}/bootanimation"
find -type f | sort | zip -@ -0 "${OUT}/bootanimation.zip"
