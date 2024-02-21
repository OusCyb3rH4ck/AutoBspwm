#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo -e "\e[1;31m\nEste script no debe ser ejecutado como root. Por favor, ejecútalo como un usuario normal.\n\e[0m"
    exit 1
fi

current_directory=$(pwd)
expected_directory="/opt/AutoBspwm"

if [ "$current_directory" != "$expected_directory" ]; then
    echo -e "\e[1;31m\nEste script debe ejecutarse desde el directorio $expected_directory. Por favor, navega al directorio correcto antes de ejecutar el script.\n\e[0m"
    echo -e "\e[1;97m\nRevisa las pautas de úso en el repositorio de GitHub:\e[0m"
    echo -e "\e[1;36mhttps://github.com/OusCyb3rH4ck/AutoBspwm \n\e[0m"
    exit 1
fi

install_package() {
    package_name=$1
    if ! command -v "$package_name" &> /dev/null; then
        echo -e "\e[1;35m\nInstalando $package_name...\e[0m"
        sudo apt-get update && sudo apt-get install -y "$package_name"
        if [ $? -ne 0 ]; then
            echo -e "\e[1;31m\n\n[!] Hubo un error al instalar $package_name...\n\e[0m"
            exit 1
        fi
    fi
}

install_package "figlet"
install_package "lolcat"

clear && figlet AutoBspwm | lolcat
echo -e "\e[1;32m\nMade by OusCyb3rH4ck\n\e[0m"

read -rp $'\e[1;33m\n[¡IMPORTANTE!] ¿Desea instalar la última versión de Firefox? (y/n)\e[0m ' install_firefox

if [[ "$install_firefox" =~ ^[Yy]$ ]]; then
    sudo apt-get update && sudo apt install -y locate && sudo apt-get purge --auto-remove -y firefox-esr && sudo apt-get update && sudo apt autoclean && sudo apt update && sudo updatedb
    locate firefox | grep -vE "/opt|ca-certificates" | while read line; do sudo rm -rf $line; done
    locate mozilla | grep -vE "/opt|ca-certificates" | while read line; do sudo rm -rf $line; done
    sudo updatedb
    wget -L 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=es-ES' -O firefox.tar.bz2 && tar -xf firefox.tar.bz2 -C /opt/ && chmod +x /opt/firefox/firefox; rm -rf firefox.tar.bz2
    echo -e "\e[1;32m\n[+] Firefox instalado correctamente! (/opt/firefox)\e[0m"
else
    echo -e "\e[33m\nContinuando sin instalar Firefox...\e[0m"
fi

sleep 1
echo -e "\e[1;35m\n\nActualizando sistema antes de comenzar...\n\e[0m"
sleep 1
sudo cp -f config/kali-upgrade /usr/bin/kali-upgrade && sudo chown -R ouscyb3rh4ck:ouscyb3rh4ck /usr/bin/kali-upgrade && sudo chmod +x /usr/bin/kali-upgrade
/usr/bin/kali-upgrade

echo -e "\e[1;35m\nInstalando paquetes necesarios...\n\e[0m"
sleep 2
sudo apt-get update && sudo apt install -y python3-pip python2 net-tools lsd bat feh rofi meson ninja-build libuv1-dev polybar sxhkd bspwm cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev build-essential git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev picom sqlmap nmap metasploit-framework set setools wireshark wireshark-common tshark tcpdump dnstwist wfuzz seclists i3lock i3lock-fancy imagemagick gobuster netdiscover impacket-scripts python3-impacket openssl sslscan sslyze arp-scan bettercap bettercap-caplets libimage-exiftool-perl steghide cmake make golang-go whatweb wpscan exploitdb exploitdb-papers hashid hash-identifier crackmapexec smbmap smbclient kitty-terminfo xclip html2text jq 2to3 padbuster flameshot moreutils wafw00f google-android-platform-tools-installer bundler npm nodejs yarnpkg locate openjdk-22-jdk openjdk-22-jre recordmydesktop sendmail sendemail hashcat john apktool alsamixergui ghidra hydra radare2 gdb rainbowcrack bloodhound neo4j && sudo apt update
if [ $? -eq 0 ]; then
    echo -e "\e[1;32m\n[+] ¡Paquetes instalados correctamente!\n\e[0m"
else
    echo -e "\e[1;31m\n\n[!] Hubo un error con la instalación de paquetes...\n\n[-] Saliendo...\n\e[0m"
    exit 1
fi

echo -e "\e[1;95m\n\nCopiando las configuraciones...\n\e[0m"
sleep 2
sudo mv /usr/bin/python2 /usr/bin/python
sudo mkdir /usr/share/zsh-sudo && sudo chown -R ouscyb3rh4ck:ouscyb3rh4ck /usr/share/zsh-sudo && wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -o /usr/share/zsh-sudo/sudo.plugin.zsh && chmod +x /usr/share/zsh-sudo/sudo.plugin.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/ouscyb3rh4ck/powerlevel10k && sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
cp -rf config/bin config/bspwm config/kitty config/picom config/polybar config/sxhkd /home/ouscyb3rh4ck/.config/
mkdir -p /home/ouscyb3rh4ck/.config/rofi/themes && cp -rf config/nord.rasi /home/ouscyb3rh4ck/.config/rofi/themes/nord.rasi
mkdir -p /home/ouscyb3rh4ck/Escritorio/ouscyb3rh4ck/images
cp -f config/fondo.jpg /home/ouscyb3rh4ck/Escritorio/ouscyb3rh4ck/images/
cp -f config/zshrc /home/ouscyb3rh4ck/.zshrc && cp -f config/p10k.zsh /home/ouscyb3rh4ck/.p10k.zsh
sudo ln -sf /home/ouscyb3rh4ck/.zshrc /root/.zshrc
sudo cp -f config/p10k.zsh_root /root/.p10k.zsh && sudo chown root:root /root/.p10k.zsh
chmod +x /home/ouscyb3rh4ck/.config/polybar/launch.sh /home/ouscyb3rh4ck/.config/bspwm/bspwmrc /home/ouscyb3rh4ck/.config/bspwm/scripts/bspwm_resize /home/ouscyb3rh4ck/.config/bin/ethernet_status.sh /home/ouscyb3rh4ck/.config/bin/hackthebox_status.sh /home/ouscyb3rh4ck/.config/bin/target_to_hack.sh /home/ouscyb3rh4ck/.config/bin/resources.sh
sudo cp -rf /home/ouscyb3rh4ck/.config/polybar/fonts/* /usr/share/fonts/truetype/ && fc-cache -v
sudo cp -f config/Hack.zip /usr/local/share/fonts/Hack.zip && cd /usr/local/share/fonts && sudo unzip Hack.zip && sudo rm -rf *.zip *.md; cd /opt/AutoBspwm
git clone --depth 1 https://github.com/junegunn/fzf.git /home/ouscyb3rh4ck/.fzf
/home/ouscyb3rh4ck/.fzf/install
kitty_file=$(curl -s https://api.github.com/repos/kovidgoyal/kitty/releases/latest | jq -r '.assets[] | select(.name | endswith("x86_64.txz")) | .browser_download_url')
wget $kitty_file && mkdir /opt/kitty && mv kitty*.txz /opt/kitty && tar -xf /opt/kitty/kitty*.txz -C /opt/kitty/ && chmod +x /opt/kitty/bin/*; rm -rf /opt/kitty/kitty*.txz
curl -s -X GET 'https://portswigger-cdn.net/burp/releases/download?product=community&type=Linux' > burp.sh && sudo bash burp.sh; rm -rf burp.sh
wget -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O vscode.deb && sudo dpkg -i vscode.deb && sudo apt-get update && sudo apt install -y code && sudo apt update; rm -rf vscode.deb

echo -e "\e[1;32m\n\n¡Listo!\e[0m \n\n\e[1;36mReinicie el equipo y en el inicio de sesión seleccione el entorno \e[1;33mBspwm\e[1;36m para acceder al nuevo entorno.\n\e[0m"
exit 0
