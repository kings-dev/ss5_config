cat << "EOF" > /root/0.sh
#!/bin/bash
#!/bin/sh
yum -y install wget libssl-dev openssl > /dev/null
x=`curl https://ipaddress.com/website/raw.githubusercontent.com|grep -Po '[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]'|sed -n 2,5p`
x1=`echo "$x"|awk 'NR==1{print}'`
x2=`echo "$x"|awk 'NR==2{print}'`
x3=`echo "$x"|awk 'NR==3{print}'`
x4=`echo "$x"|awk 'NR==4{print}'`
fip=`echo "firewall-cmd --permanent --add-source="`
ping -c 2 raw.githubusercontent.com;ping -c 2 raw.githubusercontent.com|grep -V "127.0.0.1" > /dev/null
if [ $? -eq 0 ];then
    curl https://ipaddress.com/website/raw.githubusercontent.com|grep -Po '[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]'|sed -n 2,5p|awk '{ print $0 " raw.githubusercontent.com" }' >> /etc/hosts
    /etc/init.d/network restart
    echo "`$fip$x1`"
    echo "`$fip$x2`"
    echo "`$fip$x3`"
    echo "`$fip$x4`"
    firewall-cmd --reload
    service firewalld restart
    wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/1.sh -O /root/1.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/1.sh
    cd ~;bash 1.sh
else
    wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/1.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/1.sh
    cd ~;bash 1.sh
fi
exit 0
EOF
cd ~ && sh 0.sh

