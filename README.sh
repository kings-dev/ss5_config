运行环境: 华为云服务器( ECS: Centos 7 ) 网络 ( EIP : IPv4 & IPv6 );
Centos 7 系统操作bash shell：复制0.sh里面代码到 bash shell 窗口回车即可（下一步根据指令提示安装等操作回车）;
命令 sh 0.sh (会下载文件到/root/1.sh);
命令 sh 1.sh (再次运行脚本安装等).

cat << "EOF" > /root/0.sh
#!/bin/bash
#!/bin/sh
clear
ping -c 4 raw.githubusercontent.com
if [ $? -eq 0 ];then
    wget --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/1.sh -O /root/1.sh
    cd ~
    sh 1.sh
else
    echo `curl https://ipaddress.com/website/raw.githubusercontent.com`|grep -Po "[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]\.[0-9][0-9][0-9]"|awk '{print $0" raw.githubusercontent.com"}'>> /etc/hosts
    wget --no-check-certificate --content-disposition https://raw.githubusercontent.com/kings-dev/ss5_config/main/1.sh -O /root/1.sh
    cd ~
    sh 1.sh
fi
exit 0
EOF
sh 0.sh
