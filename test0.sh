cat << "EOF" > /root/test0.sh
#!/bin/bash
#!/bin/sh
yum -y install wget > /dev/null
ping -c 2 raw.githubusercontent.com|grep "127.0.0.1" > /dev/null
if [ $? -eq 0 ];then
    echo `curl https://ipaddress.com/website/raw.githubusercontent.com`|grep -Po "[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]"|awk '{print $0" raw.githubusercontent.com"}' >> /etc/hosts
    /etc/init.d/network restart  > /dev/null
    wget --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/test1.sh > /dev/null && cd ~ && sh test1.sh
    echo "ping no ok"
else
    wget --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/test1.sh > /dev/null && cd ~ && sh test1.sh
    echo "ping is ok"
fi
exit 0
EOF
cd ~ && sh test0.sh
