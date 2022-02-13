#!/bin/bash
File= "/home/runner/work/akamai-cli/akamai-cli/domain/domainlist.txt"
 while IFS= read -r line
 do
   cat ./scripts/sample.yml | sed 's/foo.com/'$line'/g' > ./crt/$line.yml
   echo "domain: $line"
   cd /home/runner/work/akamai-cli/akamai-cli/crt
   git add $line.yml
   git commit -m "new subdomain added"   
 done < "$File"
