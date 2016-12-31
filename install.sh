#!/bin/bash                  

###time is 2016.12.26 first design #12.27#12.29
#this script is for my own system, for apt and dpkg
#this script must running under internet and root
#if can't connet to internet ,must change sources and install wine
###############################################
#for kepade
###############################################
#running at gnome-terminal or in tty3 as root##
###############################################
su

cd /etc/apt         //this script must running as root#
ls
rm -rf sources.list
cd
cp -rf sources.list /etc/apt/      //change rolling sources
cd
echo '#源

#deb cdrom:[Debian GNU/Linux 2016.1 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20160830-11:29]/ kali-rolling contrib main non-free
#deb cdrom:[Debian GNU/Linux 2016.1 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20160830-11:29]/ kali-rolling contrib main non-free
deb http://mirrors.neusoft.edu.cn/kali kali-rolling main contrib non-free

deb http://http.kali.org/kali kali-rolling main non-free contrib
#阿里云kali源
deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb http://mirrors.aliyun.com/kali-security kali-rolling/updates main contrib non-free
deb-src http://mirrors.aliyun.com/kali-security kali-rolling/updates main contrib non-free

#中科大kali源
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
#deb http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free
#deb-src http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free'
apt-get update  
clear
apt-get -y install wine wine32 
clear
apt-get clean 
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y         //update my system and will take same_times
apt autoremove -y
clear
apt-get -y install fcitx fcitx-googlepinyin

apt-get -y install alsa-base       //fix sound problem 
cp -rf pulseaudio /etc/default/
systemct1 --user enable pulseaudio

apt-get -y  install zhcon cmus elinks neofetch owasp-mantra-ff w3m-img nginx vsftpd torchat htop smplayer virtualbox etherape lolcat ninvaders moon-buggy bastet greed weechat brasero uget vail-evasion bettercap 
apt-get -y install ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy
clear

chmod 755 xx.sh cn.sh clean.sh up.sh start.sh stop.sh

cd gnome
chmod 755 gnomeinstall.sh
./gnomeinstall.sh
echo 'use "dash to dock" to change icon local'

dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb  google-chrome-stable_current_amd64.deb wps-office_10.1.0.5672-a21_amd64.deb google-talkplugin_current_amd64.deb
apt-get -f install -y


echo '接下来需要手动啦,dpkg 安装谷歌浏览器，然后在图标文件夹下修改--no-sandbox --user-data-dir  在dpkg 安装wps和它的依赖，cp host和xx-net到/下载 然后解压，还有gnome和相应脚本赋予权限并运行 ,到优化工具里改，shell主题也是 缩放是0.88。'
echo ' cp goldeneye.py 到/ root下，还有配置xx-net(kepade-149711和ringed-hallway-149711) ,设置代理为相应的链接 kepade12@gmail.com'
echo '配置github(kepade12@gmail.com)  ftp的用户和读写权限 '
echo ' ssh的配置可以参见sshd_config '


#end
