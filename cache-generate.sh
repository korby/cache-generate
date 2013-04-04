#!/bin/bash
# (c) André Cianfarani <acianfa@gmail.com>
# Crawl websites for generating their caches.
# 
if test -z "$1"
    then
         echo "first argument missing (domains to check file path)";
         exit 1;
fi

sites=`cat $1 | grep  -E -v '^(#|$)'`

tmp="/tmp/.cache-generate-tmpdownloads"
log="/tmp/cache-generate-"

# Remove the tmp directory's
rm -rf $tmp
# Crawl all domains found in the file
for site in $sites
do
    echo "Crawling $site... "
    logExt=$site'.log';
    # Crawl the site
    time wget \
            --recursive \
            --domains=$site \
            --level=inf \
            --directory-prefix=$tmp \
            --force-directories \
            --delete-after \
            --output-file=$log$logExt \
            --no-verbose \
            http://$site/
    echo "Logs are available here : $log$logExt"
done

# Remove the tmp directory's
rm -rf $tmp
