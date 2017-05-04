#!/bin/sh

HALF_RES_RESOLUTIONS="480 540 720 768 1080 1440"

for i in $HALF_RES_RESOLUTIONS; do
    rm -f $i.zip
    mkdir $i
    cd $i
    if [ -f ../../$(($i/2)).zip ]; then
	# use the existing scaled images
	echo "Using existing half-scale images instead of scaling from $i px"
	unzip ../../$(($i/2)).zip
	rm -f desc.txt
	unzip ../../$i.zip desc.txt
    else
	unzip ../../$i.zip
	for j in */*.[pP][nN][gG]; do
	    convert $j -resize 50% tmp.png
            pngnq -f -e.png tmp.png
	    mv tmp.png $j
	done
    fi
    find -type f | sort | zip -@ -0 ../$i.zip .
    cd ..
    rm -rf $i
done
