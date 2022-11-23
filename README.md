# Bash-Scripting

<h2>Part 1: A custom archive script</h2>
Description:

Make sure that your script starts with a sha-bang to execute it using bash and is followed by a small comment section that includes your name, department and email id (format of this comment section is up to you). The script should also have additional comments for the important part of the code.

Your first task is to create a script which we will call coderback.bash. This script will take an individual file or directory, and back it up into a tar file to save your assignment and lab works frequently. Specifically, this script will take two inputs:

1. the directory where the tar file should be saved;

2. an individual file or directory to backup.

Furthermore, the name of the tar file created will need to contain the name of the directory or file and the
date the backup was created in YYYYMMDD format. Finally, the script will need to terminate with error code 0 upon success and the appropriate error code otherwise (see below).
For example, let’s imagine that the following is executed on January 30, 2022:

$ ./coderback.bash $HOME/mystash asgn1

where mystash and asgn1 are directories. This would produce a file called asgn1.20220130.tar in ∼/mystash
containing directory asgn1 and all files therein.

Your script should be able to deal with both absolute and relative paths.

If the script is not invoked with 2 arguments, it should print an error message, display the usage, and exit with error code 1.

$ ./coderback.bash

Error: Expected two input parameters.

Usage: ./coderback.bash <backupdirectory> <fileordirtobackup>

If the directory to store the tar file does not exist, the file or directory to back up do not exist, or if both arguments are the same directory, your script should print an appropriate error message indicating so, and exit with error code 2.

If a tar file with the same name already exists, your script should ask the user whether they want to overwrite the file. If the user enters ‘y’ (lowercase letter Y), the tar file should be created, and the script should exit with error code 0 (no error). Otherwise (for any other response), the tar file should not be overwritten, and the script should exit with error code 3.

<h2>Part 2: Find the difference between directories</h2>
Description:

We will now work on a script that compares the text files between two directories, for example the source files in a directory to files with the same name in a backup directory.

Makesurethatyourscriptstartswithasha-bangtoexecuteitusingbashandisfollowedbyasmallcomment section that includes your name, department and email id (format of this comment section is up to you). The script should also have additional comments for the important part of the code.

Create a script called deltad.bash. This script will take two directories as input parameters, iterate over the lists of files, and report files which are either present in one directory but missing in the other, or present in both directories but differ in content.

The actual ordering of files in the above output is not important. Your script MUST NOT consider subdi- rectories or files therein. The script should work with both relative and absolute paths. This also means the the output format displayed must contain a relative or absolute path depending on what the original argument was.

If the script does not receive 2 input parameters, it should print an error message, display the usage, and exit with error code 1.

The script should verify that both input parameters are directories, and that they are different directories. Otherwise, it should print an error message, display the usage, and exit with error code 2.

The script should function even if one or both of the input directories are empty.

If no differences are found between the directories, the script should exit with error code 0.
Otherwise (including missing files), it should exit with error code 3.
