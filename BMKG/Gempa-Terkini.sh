#!/bin/bash
# Coded By Andrea Ferdyanzah
# DVanCyber.ID


HIJAU='\033[0;32m'
MERAH='\033[01;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'

main(){
	url="http://data.bmkg.go.id/autogempa.xml";
	getData=$(curl -s "${url}" >> result.xml);
	if [[ -z $(cat result.xml) ]]; then
		echo "Error: Cannot create object";
	else
		echo " Tanggal    :" $(cat result.xml  | grep -Po '(?<=<Tanggal>).*?(?=<)')
		echo " Jam        :" $(cat result.xml  | grep -Po '(?<=<Jam>).*?(?=<)')
		echo ""
		printf "${CYAN}"
		echo " Lintang    :" $(cat result.xml  | grep -Po '(?<=<Lintang>).*?(?=<)')
		echo " Bujur      :" $(cat result.xml  | grep -Po '(?<=<Bujur>).*?(?=<)')
		echo " Magnitude  :" $(cat result.xml  | grep -Po '(?<=<Magnitude>).*?(?=<)')
		echo " Kedalaman  :" $(cat result.xml  | grep -Po '(?<=<Kedalaman>).*?(?=<)')
		printf "${HIJAU}"
		echo ""
		echo " Wilayah    :" $(cat result.xml  | grep -Po '(?<=<Wilayah1>).*?(?=<)')
		echo " Potensi    :" $(cat result.xml  | grep -Po '(?<=<Potensi>).*?(?=<)')
		echo ""
		printf "${NORMAL}"
	fi
}
clear;
printf "${MERAH}"
cat << "banner"
===================================
   ____                            
  / ___| ___ _ __ ___  _ __   __ _ 
 | |  _ / _ \ '_ ` _ \| '_ \ / _` |
 | |_| |  __/ | | | | | |_) | (_| |
  \____|\___|_| |_| |_| .__/ \__,_|
                      |_|   TERKINI
===================================

banner
printf "${NORMAL}"
main $1
rm result.xml