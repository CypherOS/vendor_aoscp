#!/bin/sh

HALF_RES_RESOLUTIONS="480 540 720 768 1080 1440"

for i in $HALF_RES_RESOLUTIONS; do
    rm -f $i.zip;
    mkdir $i;
    cd $i;
    half=$(($i/2));
    if [ -f ../../$half.zip ]; then
	# use the existing scaled images
	echo "Using existing half-scale images instead of scaling from $i px";
	unzip -q ../../$(($i/2)).zip;
	rm -f desc.txt;
	unzip -q ../../$i.zip desc.txt;
        Trims=`find -type f -name 'trim.txt' | sort`
        if [ Trims ]; then
            for Trim in $Trims; do
                rm $Trim;
                unzip -q ../../$i.zip ${Trim:2};
            done;
        fi;
    else
        # generate scaled images
	echo "Scaling from $i px";
	unzip -q ../../$i.zip;
	for j in */*.[pP][nN][gG]; do
	    convert $j -resize 50% tmp.png;
            pngnq -f -e.png tmp.png;
	    mv tmp.png $j;
	done
    fi
    Trims=`find -type f -name 'trim.txt' | sort`
    if [ Trims ]; then
        for Trim in $Trims; do
            while read -r line; do
                Dim=`expr match "$line" '[0-9]*x[0-9]*'`;
                X=`expr index "$line" 'x'`;
                W=$((${line:0:$(($X-1))}/2));
                H=$((${line:$X:$(($Dim-$X))}/2));
                Off=${line:$(($Dim+1))}
                Mid=`expr index "$Off" '\+'`;
                OffX=${Off:0:$(($Mid-1))};
                OffY=${Off:$Mid:$((${#Off}-$Mid-1))}; # Trim the carriage return off the string
                HW=$(($W/2));
                HH=$(($H/2));
                L=$(($OffX + $HW));
                T=$(($OffY + $HH));
                echo "${W}x${H}+${L}+${T}" >> $Trim.new;
            done < $Trim
            mv $Trim.new $Trim
        done
    fi
    find -type f | sort | zip -q -@ -0 ../$i.zip .
    cd ..
    rm -rf $i
done
