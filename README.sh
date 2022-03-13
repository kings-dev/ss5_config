运行环境: 华为云服务器( ECS: Centos 7 ) 网络 ( EIP : IPv4 & IPv6 );
Centos 7 系统操作bash shell：复制0.sh里面代码到 bash shell 窗口回车即可(下一步根据指令提示安装等操作回车);
命令 sh huawei_install.sh (再次运行脚本安装等).

Download: huawei_install.sh
1.code:

wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh;bash huawei_install.sh

###########################################################################################################################
2.code:

cat << "EOF" > /root/huawei_copy_bash.sh
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
    #wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    #wget -q --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    #wget -q --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    cd ~;bash huawei_install.sh
else
    #wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    #wget -q --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    wget -q --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh -O /root/huawei_install.sh
    cd ~;bash huawei_install.sh
fi
exit 0
EOF
cd ~ && sh huawei_copy_bash.sh

##############################
Other test bash ECS or Centos 7:
3.code:

wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;bash test_install.sh
-----------------------------------------------------------------------------------------------------------------------
wget -q -N --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/test_install.sh;bash test_install.sh

#######################################################################################################################
-----------------------------------------------------------------------------------------------------------------------


