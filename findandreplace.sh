#!/bin/sh

# to run this: findandreplace.sh findlist.txt replacelist.txt filetochange.txt out.txt
# the words in the find and replace list must be in the same order

#sed -r 's/(\(|,|:|\)|(_\d+))/ \1 /g' $3 > temp.txt


awk '
    FILENAME == ARGV[1] { listA[$1] = FNR; next }
    FILENAME == ARGV[2] { listB[FNR] = $1; next }
    {
        for (i = 1; i <= NF; i++) {
            if ($i in listA) {
                $i = listB[listA[$i]]
            }
        }
        print
    }
' $1 $2 $3 > temp.new.txt 
#sed -r 's/\s*(\(|,|:|\)|(_\d+))\s*/\1/g' temp.new.txt > $4

