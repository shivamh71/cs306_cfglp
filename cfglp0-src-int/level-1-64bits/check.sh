# !/bin/bash

rm -rf tmpUs tmpSir
mkdir tmpUs tmpSir

if [ $1 -eq 1 ]
then
	echo "\nGenerating cfg files"
	echo "-------------------------\n"

	for file in "test_files"/*.c
	do
		file=`echo $file | cut -d '/' -f2`
		make -f Makefile.cfg FILE=$file
	done
fi

if [ $1 -eq 2 ]
then
	echo "\nProcessing correct files"
	echo "-------------------------\n"

	for file in "test_files"/*.cs306.cfg
	do
		echo $file
		f=`echo $file | cut -d '/' -f2`
		f=`echo $f | cut -d '.' -f1`
		./cfglp64 $file -eval -d > tmpUs/$f.cfg
		./run $file -eval -d > tmpSir/$f.cfg
		# diff -b -B tmpUs/$f.cfg tmpSir/$f.cfg
	done
fi

if [ $1 -eq 3 ]
then
	echo "\n\nProcessing error files"
	echo "-----------------------\n"

	for file in "test_files"/*.e*
	do
		echo $file
		f=`echo $file | cut -d '/' -f2`
		f=`echo $f | cut -d '.' -f1`
		./cfglp64 $file -ast -tokens -d > tmpUs/$f.ecfg
		./run $file -ast -tokens -d > tmpSir/$f.ecfg
		echo "-------------------------------------------"
	done
fi