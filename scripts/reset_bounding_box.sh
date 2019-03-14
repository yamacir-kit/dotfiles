#!/bin/bash

for f in *eps
do
    file=${f%.eps}
    echo "$file.eps"
    ps2pdf -dEPSCrop -dPDFSETTINGS=/prepress $file.eps $file.pdf
    pdf2ps $file.pdf $file.eps
    rm $file.pdf
done
