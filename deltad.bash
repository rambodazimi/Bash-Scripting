#!/bin/bash

# Name: Rambod Azimi
# Department: Software Enginerring
# Student id: 260911967
# Email id: rambod.azimi@mail.mcgill.ca

# The main purpose of this script is to compare files in different directories and prints whether some files are missing or differs in content

# Check to make sure 2 parameters are invoked
if [[ $# -eq 2 ]]; then
	first_directory=$1
	second_directory=$2	
else
	echo "Error: Expected two input parameters."
	echo "Usage: ./deltad.bash <originaldirectory> <comparisondirectory>"
	exit 1
fi

# Check to make sure both parameters are directories
if [[ -d $first_directory ]]
then
	if [[ -d $second_directory ]]
	then
		first_directory=$1
		second_directory=$2
	else
		echo "Error: Input parameter #2 '$second_directory' is not a directory."
		echo "Usage: ./deltad.bash <originaldirectory> <comparisondirectory>"
		exit 2
	fi
else
	echo "Error: Input parameter #1 '$first_directory' is not a directory."
	echo "Usage: ./deltad.bash <originaldirectory> <comparisondirectory>"
	exit 2
fi

# Check to make sure directories are different from each other
list1=$(ls $first_directory)
list2=$(ls $second_directory)
if [[ $list1 = $list2 ]]
then
	# Name of both directories must be also the same
	name1=$(basename $first_directory)
	name2=$(basename $second_directory)
	if [[ $name1 = $name2 ]]
		then
		echo "Error: The original and comparison directories refer to the same directory."
		echo "Usage: ./deltad.bash <originaldirectory> <comparisondirectory>"
		exit 2
	fi
fi

x=0
# Compare all the files in the both directories
for i in $(ls $first_directory)
do
	if [[ -f $second_directory/$i ]]
	then

		# Check the same files in case of any difference in content
		result=$(diff $first_directory/$i $second_directory/$i)
		if [[ $result = "" ]]
		then
			echo -n
		else
			x=3
			echo "$first_directory/$i differs."
		fi
	else
		# File is missing
		if [[ -f $first_directory/$i ]]
			then
			echo "$first_directory/$i is missing"
		fi
	fi
done	

for j in $(ls $second_directory)
do
	if [[ -f $first_directory/$j ]]
	then
		echo -n
	else
		# File is missing
		if [[ -f $second_directory/$j ]]
		then
			echo "$second_directory/$j is missing"
		fi
	fi
done
if [[ $x -eq 3 ]]
then
	exit 3
fi
