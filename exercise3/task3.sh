#!/etc/bash
cd $HOME


dir="tarball"

if [ -d "$dir" ]; then
# if directory exists, remove it
rm -r $dir  
fi

# otherwise make directory 'tarball'
mkdir $dir

# Iterate through all files by using Fin command
# Find command to search hierarchy of files
# -not -path used to disclude hidden files by giving pattern next to it
# -mtime flag used to get files updated in user specified time (-1 indicates last 24hrs)
# -type f means look for files
for i in `find -not -path '*/\.*' -mtime -1 -type f -print`
do
echo $i
# copy recursively to tarball directory
cp -r $i tarball
done

# get copied files count in new directory
# Print newline, word, and byte counts for each FILE, and a total line
# if more than one FILE is specified.  A word is a non-zero-length
# sequence of characters delimited by white space.
# wc (short for word count) counts newlines, words and bytes on its input
# -l to count just newlines
file_count=`find $dir -type f | wc -l`

echo "$file_count files has been copied and zipped"

# check if zip file exists. if it does, remove it
if [ -f tarball.tgz ]; then
    rm -r tarball.tgz
fi

#Zip the file
#flags : -c to create . -v verbose get extented file information .
# -z write permissions . -f file . and give filepath to be zipped
tar -cvzf tarball.tgz --absolute-names tarball



# References
# https://askubuntu.com/questions/266179/how-to-exclude-ignore-hidden-files-and-directories-in-a-wildcard-embedded-find
