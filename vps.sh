#! /bin/sh
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root "
    exit 1
fi
apt-get update&& apt-get dist-upgrade
ifconfig
read -p "input your IP : " IP
read -p "install shadowsocks ? (n or enter " TMP
if [ $TMP=="" ]
then apt install python python-pip
pip install setuptools 
pip install shadowsocks
read -p "input your passworld : " PASSWD
echo "{
	    \"server\":\"$IP\",
	    \"server_port\":8388,
	    \"local_address\": \"127.0.0.1\",
	    \"local_port\":1080,
	    \"password\":\"$PASSWD\",
	    \"timeout\":300,
	    \"method\":\"aes-256-cfb\"
	}
	" > /etc/ss-config.json
ssserver -c /etc/ss-config.json -d start
echo "your ss config is : "
cat /etc/ss-config.json
fi
read -p "enter to continue "

read -p "install shadowsocksr ? (n or enter " TMP
if [ $TMP=="" ]
then echo "install ssr"
apt-get install git
cd &&git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
cd ~/shadowsocksr &&bash initcfg.sh
cd && cd ~/shadowsocksr/shadowsocks
read -p "input your passworld : " PASSWD
python server.py -p 443 -k $PASSWD -m aes-256-cfb -O auth_sha1_v4 -o http_simple -d start
echo "honey,your SSR has been created.you want to stop or restart it run '--python server.py -d stop/restart'  "
fi
read -p "enter to continue "

apt-get install nginx&& service nginx start


