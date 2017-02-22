#!/bin/bash

IFS=$'\n' GLOBIGNORE='*' command eval 'inurllines=( $(cat inurl.txt) )'
IFS=$'\n' GLOBIGNORE='*' command eval 'lfilines=( $(cat lfi.txt) )'
IFS=$'\n' GLOBIGNORE='*' command eval 'sensitivelines=( $(cat sensitive.txt) )'


for line in "${inurllines[@]}"; do
  echo "$line"
  sleep $(( ( RANDOM % 300 )  + 15 ))
  googler --np -C "$line" >> inurl_results.txt
done

for line in "${lfilines[@]}"; do
  echo "$line"
  sleep $(( ( RANDOM % 300 )  + 15 ))
  googler --np -C "$line" >> lfi_results.txt
done

for line in "${sensitivelines[@]}"; do
  echo "$line"
  sleep $(( ( RANDOM % 300 )  + 15 ))
  googler --np -C "$line" >> sensitive_results.txt
done
