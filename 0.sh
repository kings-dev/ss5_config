cat << "EOF" > /root/0.sh
#!/bin/bash
#!/bin/sh
clear
ping -c 2 raw.githubusercontent.com > /dev/null
if [ $? -eq 0 ];then
    wget -q --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/1.sh -O /root/1.sh > /dev/null
    cd ~
    sh 1.sh
else
    echo `curl https://ipaddress.com/website/raw.githubusercontent.com`|grep -Po "[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]"|awk '{print $0" raw.githubusercontent.com"}' >> /etc/hosts
    wget -q --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/1.sh -O /root/1.sh > /dev/null
    cd ~
    sh 1.sh
fi
exit 0
EOF
sh 0.sh

