cat << "EOF" > /root/test0.sh
#!/bin/bash
#!/bin/sh
clear
ping -c 2 raw.githubusercontent.com > /dev/null
if [ $? -eq 0 ];then
    wget -q --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/test1.sh
    cd ~
    sh test1.sh
else
    echo `curl https://ipaddress.com/website/raw.githubusercontent.com`|grep -Po "[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]"|awk '{print $0" raw.githubusercontent.com"}' >> /etc/hosts
    wget -q --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/test1.sh
    cd ~
    sh test1.sh
fi
exit 0
EOF
cd ~
sh test0.sh
