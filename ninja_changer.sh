#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' 

clear
echo -e "${RED}"
echo "  _   _ _             _         ____ _                                 "
echo " | \ | (_)_ __       (_) __ _  / ___| |__   __ _ _ __   __ _  ___ _ __ "
echo " |  \| | | '_ \ _____| |/ _' || |   | '_ \ / _' | '_ \ / _' |/ _ \ '__|"
echo " | |\  | | | | |_____| | (_| || |___| | | | (_| | | | | (_| |  __/ |   "
echo " |_| \_|_|_| |_|    _/ |\__,_| \____|_| |_|\__,_|_| |_|\__, |\___|_|   "
echo "                   |__/                                |___/           "
echo -e "${YELLOW}           [+] Welcome to Fsociety. Control is an Illusion. [+]${NC}"
echo ""

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] Wewe n00b nini? Tumia sudo!${NC}"
   exit 1
fi

INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n1)
[ -z "$INTERFACE" ] && INTERFACE="eth0"

show_menu() {
    echo -e "${CYAN}--------------------------------------------------${NC}"
    echo -e "${YELLOW} NINJA CHANGER - The Matrix is Yours...${NC}"
    echo -e "${CYAN}--------------------------------------------------${NC}"
    echo -e "${GREEN}1)${NC} Ghost Mode (MAC Address)"
    echo -e "${GREEN}2)${NC} Spoof IP (Manual IP)"
    echo -e "${GREEN}3)${NC} DNS Hijack (Anonymity)"
    echo -e "${GREEN}4)${NC} Identity Theft (Hostname)"
    echo -e "${GREEN}5)${NC} Change Password (Root/User)"
    echo -e "${GREEN}6)${NC} Rename Ninja (Username)"
    echo -e "${GREEN}7)${NC} Network Status"
    echo -e "${GREEN}8)${NC} Panic Button (Reset)"
    echo -e "${GREEN}9)${NC} Visit Ninja (Website)"
    echo -e "${GREEN}10)${NC} Leave the Matrix (Exit)"
    echo -ne "${BLUE}Ninja-Changer > ${NC}"
}

while true; do
    show_menu
    read opt
    case $opt in
        1)
            ip link set dev $INTERFACE down
            macchanger -r $INTERFACE
            ip link set dev $INTERFACE up
            echo -e "${GREEN}[+] Fingerprints erased!${NC}"
            ;;
        2)
            echo -ne "${BLUE}[?] Weka IP: ${NC}"
            read new_ip
            ip addr flush dev $INTERFACE
            ip addr add $new_ip/24 dev $INTERFACE
            echo -e "${GREEN}[+] IP Modified: $new_ip${NC}"
            ;;
        3)
            echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf
            echo -e "${GREEN}[+] DNS Hijacked successfully.${NC}"
            ;;
        4)
            echo -ne "${BLUE}[?] New Hostname: ${NC}"
            read new_host
            hostnamectl set-hostname $new_host
            echo -e "${GREEN}[+] Identity Swapped: $new_host${NC}"
            ;;
        5)
            echo -ne "${BLUE}[?] Unataka kubadili pass ya nani? (User): ${NC}"
            read target_user
            passwd $target_user
            ;;
        6)
            echo -ne "${BLUE}[?] Jina la zamani: ${NC}"
            read old_u
            echo -ne "${BLUE}[?] Jina jipya: ${NC}"
            read new_u
            usermod -l $new_u $old_u
            groupmod -n $new_u $old_u
            usermod -d /home/$new_u -m $new_u
            echo -e "${GREEN}[+] Username changed to $new_u. Old ghost is gone!${NC}"
            ;;
        7)
            ip addr show $INTERFACE | grep -E 'inet |link/ether'
            ;;
        8)
            systemctl restart NetworkManager
            echo -e "${GREEN}[+] Traces cleared, back to normal.${NC}"
            ;;
        9)
            echo -e "${YELLOW}[*] Entering Ninja Sanctuary...${NC}"
            xdg-open https://cyberninja255.vercel.app > /dev/null 2>&1 || sensible-browser https://cyberninja255.vercel.app
            ;;
        10)
            echo -e "${RED}Goodbye, Friend.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Acha bangi! Chagua namba.${NC}"
            ;;
    esac
    echo ""
done