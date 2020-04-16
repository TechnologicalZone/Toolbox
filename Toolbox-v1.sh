#!/bin/bash
#All right reserved by: the writer of this program: t.me/Anonymous_Lpz

#banner
while :
do
clear
echo -e "\e[1;32m"
figlet -small Toolbox
#Version
echo -e "\e[1;33m   V=1.0"

#Coming soon
#echo -e "Translate to
#\e[1;31m[\e[1;33m99\e[1;31m] \e[1;36mSpanish          \e[1;31m[\e[1;33m98\e[1;31m] \e[1;36mEnglish"

#copyright
echo ""
echo -e "\e[1;36mit is necessary to have an internet connection to use this tool, it is also important to change the IP from time to time so that it does not cause any problem with the tool"
echo ""
echo -e "\e[1;31mCODED BY:\e[1;32mt.me/Anonymous_Lpz"
echo ""
#Tools menu
echo -e "\e[1;36m+----------------------------------------------------+"
echo -e "\e[1;31m[\e[1;33m01\e[1;31m] \e[1;36mHost Finder (Subdomain)"
echo -e "\e[1;31m[\e[1;33m02\e[1;31m] \e[1;36mTPC Port Scan"
echo -e "\e[1;31m[\e[1;33m03\e[1;31m] \e[1;36mProxys Finder"
echo -e "\e[1;31m[\e[1;33m04\e[1;31m] \e[1;36mGeo-IP Lookup"
echo -e "\e[1;31m[\e[1;33m05\e[1;31m] \e[1;36mHTTP Headers"
echo -e "\e[1;31m[\e[1;33m06\e[1;31m] \e[1;36mReverse IP Lookup"
echo -e "\e[1;31m[\e[1;33m07\e[1;31m] \e[1;36mWhois Lookup"
echo -e "\e[1;31m[\e[1;33m08\e[1;31m] \e[1;36mLocator By IP"
echo -e "\e[1;31m[\e[1;33m09\e[1;31m] \e[1;36mCheck for new Toolbox updates"
echo -e "\e[1;31m[\e[1;33m00\e[1;31m] \e[1;36mExit"
echo -e "\e[1;36m+----------------------------------------------------+"
echo -e "\e[1;32m"
echo -n "Digite La Opcion: "
read opc
#Tools
case $opc in
01) clear
echo -e "\e[1;31m"
figlet -small Host Finder
echo ""
echo -n -e "\e[1;36mEnter a domain: "
read domain
echo ""
echo -e "\e[1;36m[#] Looking for Host (Subdomain)"
sleep 1
echo -e "\e[1;32m"
curl https://api.hackertarget.com/hostsearch/?q=$domain
echo ""
echo -e "\e[1;33m[#] Scanning Complete, press enter to continue"
read enter
;;
02) clear
echo -e "\e[1;36m"
figlet -small TCP Port Scan
echo ""
echo -n -e "\e[1;36mEnter your domain to scan: "
read domain
echo ""
echo -e "\e[1;36m[#] Scanning $domain"
echo ""
curl https://api.hackertarget.com/nmap/?q=127.x.x.1$domain
echo ""
echo -e "\e[1;33m[#] Scanning Complete, press enter to continue"
read enter
;;
03) clear

merah="\e[91m"
ijo="\e[92m"
kuning="\e[93m"
putih="\e[97m"
cyan="\e[96m"
bold="\e[1m"
header(){
echo -e "\e[1;36m"
figlet -small Proxy checker
echo ""
echo -e "\e[1;32m"
printf "the functional proxys are saved in a file called proxylive.txt, in the current directory"
echo ""
printf "\e[97m(in case it doesn't show any proxy, try later)"
echo ""
echo ""
printf "\e[91mchange ip from time to time"
echo ""
}
header
printf "${bold}"

printf "\n${cyan}Scanning pages${putih}... \n\n"

printf "${putih}[${ijo}!${putih}] ${cyan}free-proxy-list.net... "
curl -s "https://free-proxy-list.net/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '[[:alnum:]+\.]{1,15}:[0-9]{2,9}' >> proxy.tmp
printf "${ijo}DONE\n"

printf "${putih}[${ijo}!${putih}] ${cyan}www.us-proxy.org... "
curl -s "https://www.us-proxy.org/" | grep -Eo '<td>([0-9]{1,3}\.){3}[0-9]{1,3}<(.?*)>[0-9]{2,9}</td>' | sed 's/<td>//g' | sed 's/<\/td>/:/g' | grep -Eo '[[:alnum:]+\.]{1,15}:[0-9]{2,9}' >> proxy.tmp
printf "${ijo}DONE\n"

printf "${putih}[${ijo}!${putih}] ${cyan}clarketm github... "
curl -s "https://raw.githubusercontent.com/clarketm/proxy-list/master/proxy-list.txt" | sed '1,2d; $d; s/\s.*//; /^$/d' | sed 's/IP//g' >> proxy.tmp
printf "${ijo}DONE\n"

printf "${putih}[${ijo}!${putih}] ${cyan}duplichecker.com... "
curl -s "https://www.duplichecker.com/free-proxy-list.php" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{2,9}' >> proxy.tmp
printf "${ijo}DONE\n"

printf "${putih}[${ijo}!${putih}] ${cyan}proxyrack.com... "
page=0; 
for off in {0..2000..100}; do 
	((page++));
	curl -s "https://www.proxyrack.com/proxyfinder/proxies.json?page=${page}&perPage=100&offset=${off}" | grep -Eo '"([0-9]{1,3}\.){3}[0-9]{1,3}","port":"[0-9]{2,9}"' | sed 's/","port":"/:/g' | sed 's/"//g' >> proxy.tmp
done
printf "${ijo}DONE\n\n"

printf "${putih}[${ijo}!${putih}] ${cyan}Removing Duplicate... "
sortir=$(cat proxy.tmp | sort | uniq >> proxy.txt)
rm proxy.tmp
printf "${ijo}DONE\n"
printf "${putih}[${ijo}+${putih}] ${cyan}Found ${kuning}$(cat proxy.txt | wc -l) ${cyan}Proxies\n\n"

printf "${putih}[${ijo}!${putih}] ${cyan}Checking Live ...\n\n"

ngirim=20
tidur=5
itung=0
nominal=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'proxi=($(cat proxy.txt))'
for (( i = 0; i <"${#proxi[@]}"; i++ )); do
	((nominal++));
	ngesend=$(expr $itung % $ngirim)
	if [[ $ngesend == 0 && $itung > 0 ]]; then
		sleep $tidur
	fi

	proxynya="${proxi[$i]}"
	ceklivenya=$(curl -s --connect-timeout 4 -x "${proxynya}" "https://pastebin.com/raw/dUK9ME2J" -L)
	if [[ $ceklivenya =~ "BULBUL" ]]; then
		echo "${proxynya}" >> proxylive.txt
		printf "${putih}[${ijo}+${putih}] $proxynya [${ijo}LIVE${putih}] (${ijo}$(cat proxylive.txt | wc -l)${putih})\n"
	else
		printf "${putih}[${merah}-${putih}] $proxynya [${merah}DIE${putih}]\n"
	fi

	((itung++));

done
rm proxy.txt

;;
04) clear
echo -e "\e[1;33m"
figlet -small Geo-IP Lookup
echo ""
echo -n -e "\e[1;36mEnter your Host or IP: "
read host
echo -e "\e[1;32m"
curl https://api.hackertarget.com/geoip/?q=$host
echo ""
echo -e "\e[1;33m[#] Enter enter to continue"
read enter
;;
05) clear
echo -e "\e[1;32m"
figlet -small HTTP Headers
echo ""
echo -n -e "\e[1;36mEnter your Host: "
read host
echo ""
echo -e "\e[1;32m"
curl -v $host
echo ""
echo -e "\e[1;33mPress enter to continue"
read enter
;;
06) clear
echo -e "\e[1;34m"
figlet -small Reverse IP Lookup
echo ""
echo -n -e "\e[1;36mEnter your Host or IP: "
read host
echo -e "\e[1;32m"
curl https://api.hackertarget.com/reverseiplookup/?q=$host
echo ""
echo -e "\e[1;33m[#] Press enter to continue"
read enter
;;
07) clear
echo -e "\e[1;32m"
figlet -small Whois Lookup
echo ""
echo -n -e "\e[1;36mEnter your IP or domain: "
read ip
echo -e "\e[1;32m"
curl https://api.hackertarget.com/whois/?q=$ip
echo ""
echo -e "\e[1;33mScanning complete, press enter to continue"
read enter
;;
08) clear
echo -e "\e[1;36m"
figlet -small IP Locator
echo ""
echo -n -e "\e[1;36mEnter the IP to locate or just enter enter to locate your IP: "
read ip
echo -e "\e[1;32m"
curl ipinfo.io/$ip
echo ""
echo -e "\e[1;33mIp localized, enter to continue"
read enter
;;
09) clear
cd /data/data/com.termux/files/home
rm -rf Toolbox
echo -e "\e[1;31m"
figlet -f small updating Toolbox . .
sleep .5
git clone https://github.com/Anonymous-Lpz/Toolbox
cd Toolbox
chmod +x *
ls
bash verificador.sh
;;
00)
exit
;;
*) echo ""
echo -e "\e[1;31mComando Inválido"
sleep 1.8
esac
done
