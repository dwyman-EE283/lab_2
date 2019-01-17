# File processing in Python

1. How do you ask if a file exists?
```
import os.path
os.path.exists(file_path)
```
2. How to you ask if a file is a directory?
```
import os.path
os.path.isdir(file_path)
```
3. How do you remove (delete) a file?
```
import os
os.system("rm filepath")
```
4. How do you get the size of a file?
```
import os
os.path.getsize(file_path)
```
5. How do you get all the file names matching a pattern?
```
import glob
# Get all files with .sam extension
glob.glob('/my/path/*.sam')
```
6. How do you get all the file names matching a pattern recursively?
```
import fnmatch
import os

matches = []
for root, dirnames, filenames in os.walk('src'):
    for filename in fnmatch.filter(filenames, '*.sam'):
        matches.append(os.path.join(root, filename))
```
7. How do you get an iterator to all files matching a pattern, as opposed to returning a potentially huge list?
```
import glob
glob.iglob(pathname)
```
8. How do you open gzip-compressed files for reading and for writing
```
import gzip
with gzip.open('file.txt.gz', 'rb') as f:
    file_content = f.read()

content = "Lots of content here"
with gzip.open('file.txt.gz', 'wb') as f:
    f.write(content)
```
# File processing in R

1. How do you ask if a file exists?
```
file.exists(destfile)
```
2. How to you ask if a file is a directory
```
file.exists(f) && !dir.exists(f)
```
3. How do you remove (delete) a file?
```
file.remove(fn)
```
4. How do you get the size of a file?
```
file.info(filename)
```
5. How do you get all the file names matching a pattern?
```
# Get all files with .sam extension
files <- list.files(pattern = "\\.sam$")
```
6. How do you get all the file names matching a pattern recursively?
```
files <- list.files(pattern = "\\.sam$", recursive=T)
```
7. How do you get an iterator to all files matching a pattern, as opposed to returning a potentially huge list?
```
library(iterators)
i <- iter(list.files(pattern = "\\.sam$"))
nextElem(i)
```
8. How do you open gzip-compressed files for reading and for writing?
```
write.table(tst.df,gzfile("test.dat.gz")) # write a compressed file 
read.table(gzfile("test.dat.gz"),row.names=1)# read it back in
```
