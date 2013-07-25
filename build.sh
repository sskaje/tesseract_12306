#!/bin/sh
####################################################
#
# Tesseract training script for 12306 captcha
#  Author: sskaje (http://sskaje.me/)
#
####################################################
DIR_TESSERACT=/opt/local/bin
BIN_TESSERACT=$DIR_TESSERACT/tesseract
BIN_UNICHARSET_EXTRACTOR=$DIR_TESSERACT/unicharset_extractor
BIN_MFTRAINING=$DIR_TESSERACT/mftraining
BIN_CNTRAINING=$DIR_TESSERACT/cntraining
BIN_COMBINE_TESSDATA=$DIR_TESSERACT/combine_tessdata

# tesseract 12306.24RS.jpg 12306.24RS nobatch box.train.stderr
for i in `ls *.jpg`; 
do 
	n=`echo $i | sed '~s/.jpg//'`; 
	echo Processing $i;
	$BIN_TESSERACT $i $n nobatch box.train; 
done;

# unicharset_extractor *.box
#ls *.box | xargs $BIN_UNICHARSET_EXTRACTOR 
$BIN_UNICHARSET_EXTRACTOR `ls *.box` >> unicharset_extractor.log

# create font properties
echo unknownitalic 1 0 0 1 0 > font_properties
# combine tr file
cat 12306.*.tr > unknownitalic.tr
# MF training
$BIN_MFTRAINING -F font_properties -U unicharset -O 12306.unicharset unknownitalic.tr
# CN training
$BIN_CNTRAINING unknownitalic.tr 2>&1
# process file name
mv inttemp 12306.inttemp
mv normproto 12306.normproto
mv pffmtable 12306.pffmtable
mv Microfeat 12306.Microfeat
# combine tess data
$BIN_COMBINE_TESSDATA 12306.
# copy to target folder
cp 12306.traineddata tessdata/
