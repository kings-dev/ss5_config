# Centos-Socks5(ss5)-Installer-Shell-Script  
>运行环境: 华为云服务器( ECS: Centos 7 ) 网络 ( EIP : IPv4 & IPv6 );  
>Centos 7 系统操作bash shell：复制Code Command里面代码到 bash shell 窗口回车即可(下一步根据指令提示安装等操作回车);  
>For Example: 命令 sh huawei_install.sh (再次运行脚本安装等).  

### Download: huawei_install.sh  
### For Example:  
## huawei_install.sh
[root@localhost ~]#```wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh;bash huawei_install.sh```  
>#下载脚本安装  
### Copy the code below:  
```Bash 
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh;bash huawei_install.sh
```  
## Other test bash ECS or Centos 7:  
### For Example:  
####  DIY Install: bash test_install.sh  
[root@localhost ~]#```wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;bash test_install.sh```
>#下载脚本安装  
### Copy the code below:  
```Bash
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;bash test_install.sh
```  
#### Installed by default: echo -e 'y\n'|bash test_install.sh
[root@localhost ~]#```wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'y\n'|bash test_install.sh```
>#下载脚本安装  
### Copy the code below:  
```Bash  
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'y\n'|bash test_install.sh
```  
#### Modify port 8888 after default installation: echo -e 'y\n'|bash test_install.sh;echo -e 'n\ny\n8888\n'|bash test_install.sh
[root@localhost ~]#```wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'y\n'|bash test_install.sh;echo -e 'n\ny\n8888\n'|bash test_install.sh```
>#下载脚本安装  
### Copy the code below:  
```Bash 
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'y\n'|bash test_install.sh;echo -e 'n\ny\n8888\n'|bash test_install.sh
```  
#### Modify only port 8888: echo -e 'n\ny\n8888'|bash test_install.sh
[root@localhost ~]#```wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'n\ny\n8888'|bash test_install.sh```
>#下载脚本安装  
### Copy the code below:  
```Bash  
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh;echo -e 'n\ny\n8888'|bash test_install.sh
```  
---  
## Check DNS Deconfiguration: huawei_copy_bash.sh
### Copy the code below:  
```Bash
cat << "EOF" > ./huawei_copy_bash.sh
#!/bin/bash
#!/bin/sh
yum -y install curl wget libssl-dev openssl > /dev/null
x_0=`curl https://ipaddress.com/website/githubusercontent.com|grep -Eo 'ipv4/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\">'|sed -e 's/ipv4\///g' -e's/">//g'`

a=0
row1=`echo "$x_0"|wc -l`

until [ ! $a -lt $row1 ]
do
    echo $b
    b=`expr $a + 1`
    x$b=`echo "$x_0"|awk 'NR==1{print}'`
done
#x1=`echo "$x_0"|awk 'NR==1{print}'`
#x2=`echo "$x_0"|awk 'NR==2{print}'`
#x3=`echo "$x_0"|awk 'NR==3{print}'`
#x4=`echo "$x_0"|awk 'NR==4{print}'`
x_1=`curl https://ipaddress.com/website/raw.fastgit.org|grep -Eo 'ipv4/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\">'|sed -e 's/ipv4\///g' -e's/">//g'`
row2=`echo "$x_1"|wc -l`
x1_1=`echo "$x_1"|awk 'NR==1{print}'`
x2_1=`echo "$x_1"|awk 'NR==2{print}'`
fip=`echo "firewall-cmd --permanent --add-source="`
ping -c 2 raw.githubusercontent.com;ping -c 2 raw.githubusercontent.com|grep -V "127.0.0.1" > /dev/null
if [ $? -eq 0 ];then
    curl https://ipaddress.com/website/githubusercontent.com|grep -Eo 'ipv4/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\">'|sed -e 's/ipv4\///g' -e's/">//g'|awk '{ print $0 " raw.githubusercontent.com" }' >> /etc/hosts
    curl https://ipaddress.com/website/raw.fastgit.org|grep -Eo 'ipv4/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\">'|sed -e 's/ipv4\///g' -e's/">//g'|awk '{ print $0 " raw.fastgit.org" }' >> /etc/hosts
/etc/init.d/network restart
    echo "`$fip$x$b`"
    #echo "`$fip$x2`"
    #echo "`$fip$x3`"
    #echo "`$fip$x4`"
    echo "`$fip$x1_1`"
    echo "`$fip$x2_1`"
    firewall-cmd --reload
    service firewalld restart
    wget -q --no-check-certificate https://raw.githubusercontent.com/kings-dev/ss5_config/main/huawei_install.sh -O huawei_install.sh;bash huawei_install.sh
else
    wget -q --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/huawei_install.sh -O huawei_install.sh;bash huawei_install.sh
fi
exit 0
EOF
bash huawei_copy_bash.sh
```  
