#!/bin/bash

url=$1

if [ ! -d "$url" ];then
	mkdir $url
fi

if [ ! -d "$url/subs" ];then
	mkdir $url/recon
fi


echo "[+] Scanning for sub-domains..."
subfinder --subs-only $url >> $url/recon/target.txt
cat $url/recon/target.txt | grep $1 >> $url/recon/final.txt
echo "[+] Scanning for alive subs..."
cat $url/recon/final.txt | httprobe >> $url/recon/alive-subs.txt
rm $url/recon/target.txt

