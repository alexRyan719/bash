#!/bin/bash

echo "Antivirus checking your home directory..."
echo ""

args=("$@")

cd ~
sudo find -type f -exec md5sum "{}" + > /home/kali/labs/blue_team/project/hashes.txt
grep "${args[0]}" /home/kali/labs/blue_team/project/hashes.txt > /home/kali/labs/blue_team/project/scripts/output.txt

bad_list=$(cat /home/kali/labs/blue_team/project/scripts/output.txt | cut -d "." -f 2,3)

for item in $bad_list
do
        echo "Malicious file found at:"
        echo $item
        echo ""
        chmod 600 .$item
        mv .$item /home/kali/labs/blue_team/project/quarantine
done

echo ""
echo "Please check your Quarantine directory for possible malicious files found!"
