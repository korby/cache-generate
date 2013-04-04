cache-generate
==============

Crawl a web site's for generating his cache

# Installation
Make the shell script executable
```bash
$ chmod +x cache-generate.sh
```
# Usage
Create a file and add a line containing all your websites' domains you want to be check, separated by space.
For example : 
```bash
www.mysite1.com en.mysite1.com www.mysite2.de
```
You can't write some comments, just put a # at the begin of the comment's line.

Execute the script with the path to this file as argument.
For example :
```bash
$ ./cache-generate.sh /tmp/mydomainsfile
```
