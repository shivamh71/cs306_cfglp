# !/bin/bash

rm -rf tmp
mkdir tmp

for file in "test_files"/*.c 
do
	file=`echo $file | cut -d '/' -f2`
	make -f Makefile.cfg FILE=$file
done

# echo "\nProcessing correct files"
# echo "-------------------------\n"

# for file in "test_files"/*.cs306.cfg 
# do
# 	echo $file
# 	f=`echo $file | cut -d '/' -f2`
# 	f=`echo $f | cut -d '.' -f1`
# 	./cfglp $file -tokens -ast -eval -d > out1
# 	./run $file -tokens -ast -eval -d > out2
# 	diff out1 out2 > tmp/$f
# done

# echo "\n\nProcessing error files"
# echo "-----------------------\n"

# for file in "test_files"/*.e* 
# do
# 	echo $file
# 	f=`echo $file | cut -d '/' -f2`
# 	f=`echo $f | cut -d '.' -f1`
# 	./cfglp $file -tokens -d > out1
# 	./run $file -tokens -d > out2
# 	diff out1 out2 > tmp/$f
# 	echo "-------------------------------------------"
# done