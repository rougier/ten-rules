#!/bin/bash


for file in figure*.pdf
do
    file=`basename $file`
    extension="${file##*.}"
    file="${file%.*}"

    pdffile=$file.pdf
    epsfile=$file.eps
    tiffile=$file.tiff

    echo "Cropping $pdffile"
    pdfcrop $pdffile $pdffile

    echo "Converting $pdffile -> $epsfile"
    pdf2ps  $pdffile $epsfile

    echo "Converting $pdffile -> $tiffile"
    convert -density 300x300 -compress lzw $pdffile $tiffile
done
