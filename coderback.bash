#!/bin/bash

# Name: Rambod Azimi
# Student id: 260911967
# Department: Software Engineering
# Email id: rambod.azimi@mail.mcgill.ca

# This script will take 2 inputs from the user and make a backup tar file with a and save it in the mentioned path

# Check to make sure 2 parameters are invoked
if [[ $# -eq 2 ]]; then
	destination_path=$1
	file=$2
else
	echo "Error: Expected two input parameters."
	echo "Usage: ./coderback.bash <backupdirectory> <fileordirtobackup>"
	exit 1
fi

# Check to make sure the directory for the backup file exists
if [[ -d $destination_path ]]
then
	echo -n	
else
	echo "Error: The directory '$destination_path' does not exist."
	exit 2
fi

# Check the type of the second argument (file or directory)
if [[ -f $file ]]
then
	# It is a file
	file_path="$(pwd $file)/$file"
else
	if [[ -d $file ]]
	then
		file_path=$file
	else
		echo "Error: The directory/file '$file' does not exist."
		exit 2
	fi
fi

# Check to make sure both arguments are not in the same directory
list1=$(ls $destination_path)
list2=$(ls $file)
if [[ $list1 = $list2 ]]
then
	# Make sure about their names as well
	name1=$(basename $destination_path)
	name2=$(basename $file)
	if [[ $name1 = $name2 ]]
		then
		echo "Error: Both source and destination are the same."
		exit 2
	fi
fi

# Storing the current date with YYYYMMDD format into a variable
current_date="$(date +'%d%m%Y')"
name=$(basename $file)
# Creating the proper name for the tar file
file_name="${name}.${current_date}.tar"
# Check to make sure there is not any tar file with the same name
cd $destination_path
if [[ -f $file_name ]]
then
	# Ask for overwrite
	echo "Backup file '$file_name' already exists. Overwrite? (y/n)"
	read answer
	if [[ $answer = "y" ]]
	then
		echo -n
	else
		exit 3
	fi
else
	echo -n
fi

destination_path_with_name="${destination_path}/$file_name"
# Baking up from the file
tar -cf $destination_path_with_name -P $file

