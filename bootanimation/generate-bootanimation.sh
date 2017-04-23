#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"

ORIGINAL_WIDTH="1440"
ORIGINAL_HEIGHT="1440"

PARTS="0 1"
FPS="60"

OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

#Set IMAGEWIDTH as the longer of the measurements
if [ "$HEIGHT" -lt "$WIDTH" ]
then
    IMAGEWIDTH="$HEIGHT"
else
    IMAGEWIDTH="$WIDTH"
fi

#Set ORIGINAL_IMAGEWIDTH as the longer of the measurements
if [ "$ORIGINAL_HEIGHT" -lt "$ORIGINAL_WIDTH" ]
then
    ORIGINAL_IMAGEWIDTH="$ORIGINAL_HEIGHT"
    ORIGINAL_IMAGEHEIGHT="$ORIGINAL_WIDTH"
else
    ORIGINAL_IMAGEWIDTH="$ORIGINAL_WIDTH"
    ORIGINAL_IMAGEHEIGHT="$ORIGINAL_HEIGHT"
fi

#Calculate aspect ratio of original image
ASPECTRATIO=$(("$ORIGINAL_IMAGEWIDTH" / "$ORIGINAL_IMAGEHEIGHT"))

#Check if HALF_RES
if [ "$HALF_RES" = "true" ]
then
    IMAGEWIDTH=$(("$IMAGEWIDTH" / 2))
fi

#Set IMAGEHEIGHT
IMAGEHEIGHT=$(("$IMAGEWIDTH" / "$ASPECTRATIO"))

#Set image size
RESOLUTION="${IMAGEWIDTH}x$IMAGEHEIGHT"

#Create a folder for each part
PARTS=$(echo "$PARTS" | tr " " "\n")

for PART in $PARTS
do
    mkdir -p "$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$PART"
done

#Decompress bootanimation.zip
unzip "vendor/aoscp/bootanimation/bootanimation.zip" -d "$OUT/bootanimation/"

#Resize all images
convert -resize "$RESOLUTION" -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$IMAGEWIDTH $IMAGEHEIGHT" "$FPS" > "$OUT/bootanimation/desc.txt"
cat "vendor/aoscp/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"
zip -0 "$OUT/bootanimation.zip" .

