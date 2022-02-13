#!/bin/bash
File= "/home/runner/work/akamai-cli/akamai-cli/domain/domainlist.txt"
 while IFS= read -r line
 do
   cat /home/runner/work/akamai-cli/akamai-cli/scripts/sample.yml | sed 's/foo.com/'$line'/g' > /home/runner/work/akamai-cli/akamai-cli/crt/$line.yml
   echo "domain: $line"
   git add /home/runner/work/akamai-cli/akamai-cli/crt/$line.yml
   git commit -m "new subdomain added"   
 done < "$File"
