#!/bin/bash
# (c) André Cianfarani <acianfa@gmail.com>
# Crawl a web site's for generating his cache
# 
if test -z "$1"
    then
         echo "first argument missing (domains to check file path)";
         exit 1;
fi

sites=`cat $1 | grep  -E -v '^(#|$)'`

tmp="./.cache-generate-tmpdownloads"
log="cache-generate-log.txt"

# Remove the tmp directory's
rm -rf $tmp
# Crawl all domains found in the file
for site in $sites
do
    echo "Crawling $site... "
    # Crawl the site
    time wget \
            --recursive \
            --domains=$site \
            --level=inf \
            --directory-prefix=$tmp \
            --force-directories \
            --delete-after \
            --output-file=$log \
            --no-verbose \
            http://$site/
done
# Remove the tmp directory's
rm -rf $tmp
