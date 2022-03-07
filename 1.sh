#!/bin/bash
#!/bin/sh
clear
ping -c 2 cip.cc > /dev/null
if [ $? -eq 0 ];then
ip=`curl -s ifconfig.me`
    echo "##############################################################################################################################"
    echo -e "\n"
    echo "        华为云服务器公网 IP (EIP)|HUAWEI CLOUD server public IP (EIP)   >>>>>:    $ip"
    echo -e "\n"
    echo "##############################################################################################################################"
    huawei=`curl cip.cc  | grep "华为云" |awk '{print $5}'`
    if [ $huawei = "华为云" ];then
        export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
        sed -i '$a export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' ~/.bash_profile
        source ~/.bash_profile
        read -ep "        现在搭建ss5应用服务下载安装 Centos 7.6 环境依赖包和源包,
        操作请输入（英文提示符号）再回车:
        Now build the ss5 application service to download and install the Centos 7.6 environment dependency package and source package,
        please enter (English prompt symbol) and press Enter:

        [安装编译: "Y" 或 "y" ]
        [Install build: "Y" or "y" ]
#
        [修改端口: "n" 或 "N" ]
        [Modify port: "n" or "N" ]
#
        [退出脚本: "q" 或 "Q" ]
        [Exit script: "q" or "Q" ]
#
        [关闭进程: "s" 或 "S" ]
        [close process: "s" or "S" ]
#
        [启动进程: "r" 或 "R" ]
        [start process: "r" or "R" ]
#
        [进程状态: "z" 或 "Z" ]
        [process status: "z" or "Z" ]

        [卸载程序: "u" 或 "U" ]
        [Uninstaller: "u" or "U" ]
#
        >> " ok
        case $ok in
        [yY][eE][sS]|[yY])
            cd ~
            yum -y install pam-devel openldap-devel openssl-devel gcc pam-devel wget net-tools
            wget -nc http://downloads.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz
            tar -xzvf ss5-3.8.9-8.tar.gz
            cd /root/ss5-3.8.9/
            ./configure
            make
            make install
            confFile=/etc/opt/ss5/ss5.conf
            sed -i '87c auth    0.0.0.0/0       -               -' $confFile
            sed -i '203c permit -        0.0.0.0/0       -       0.0.0.0/0       -       -       -       -       -' $confFile
            sed -i '2c SS5_OPTS=" -u root -b 0.0.0.0:1080"' /etc/sysconfig/ss5
            chmod a+x /etc/init.d/ss5
            chmod a+x /etc/rc.d/init.d/ss5
            mkdir -p /var/run/ss5/
            chmod 755 /etc/opt/ss5
            chmod a+x /etc/rc.d/rc.local
            chkconfig --add ss5
            chkconfig --level 345 ss5 on
            confFile_ss5=/etc/rc.d/init.d/ss5
            sed -i '/echo -n "Starting ss5... "/a if [ ! -d "/var/run/ss5/" ];then mkdir /var/run/ss5/; fi' $confFile_ss5
            sed -i '54c rm -rf /var/run/ss5/' $confFile_ss5
            sed -i '18c [[ ${NETWORKING} = "no" ]] && exit 0' $confFile_ss5
            sed -i '2c export SS5_SOCKS_PORT=1080' /etc/init.d/ss5
            sed -i '3c export SS5_SOCKS_USER=root' /etc/init.d/ss5
            if [ ! -d "/var/run/ss5/" ];then
                mkdir -p /var/run/ss5/
                echo "create ss5 success!"
            else
                echo "/ss5/ is OK!"
            fi
            systemctl daemon-reload
            service ss5 start && service ss5 status
            echo -e "\n"
            /etc/rc.d/init.d/ss5 restart
            echo -e "\n"
            echo "`netstat -anltup | grep ss5`"
        ;;
        [nN][oO]|[nN])
            read -ep "            默认端口为：1080,
            如需修改SS5端口(1-65535)操作请输入（英文提示符号）再回车:
            The default port is: 1080. If you need to modify the SS5 port (1-65535), 
            please enter (English prompt symbol) and press Enter:

            [定义端口: "Y" 或 "y" ]
            [Define port: "Y" or "y" ]
#
            [不改端口: "n" 或 "N" ]
            [Do not change port: "n" or "N" ]
#
            [退出脚本: "q" 或 "Q" ]
            [Exit script: "q" or "Q" ]
#
            >> " ok0
            case $ok0 in
                [yY][eE][sS]|[yY])
                    echo "已使用端口(IP:端口)Port used (IP:Port)：`netstat -anultp`"
                    read -ep "输入 '未使用' 端口号Enter the 'unused' port number（1-65535）: " ss5_Port
                    sed -i '2c SS5_OPTS=" -u root -b 0.0.0.0:'$ss5_Port'"' /etc/sysconfig/ss5
                    sed -i '2c export SS5_SOCKS_PORT='$ss5_Port'' /etc/init.d/ss5
                    if [ $? -eq 0 ];then
                        systemctl start firewalld
                        firewall-cmd --zone=public --add-port=$ss5_Port/tcp --permanent
                        firewall-cmd --zone=public --query-port=$ss5_Port/tcp
                        /usr/sbin/iptables -I INPUT -p tcp --dport $ss5_Port -j ACCEPT
                        firewall-cmd --add-port=$ss5_Port/tcp --permanent
                        firewall-cmd --reload
                        service ss5 restart && service ss5 status
                        echo "`netstat -anltup | grep ss5`"
                        echo -e "\n"
                    else
                        echo -e "\n\n"
                        echo "未安装ss5,请重新运行 ss5_install_config.sh 脚本输入 Y 或 y 进行安装!!!"
                        echo "ss5 is not installed, please re-run the ss5_install_config.sh script and enter Y or y to install!!!"
                        echo -e "\n\n"
                    fi
                    chmod 755 /etc/init.d/ss5
                    chmod a+x /etc/init.d/ss5
                    chmod a+x /etc/rc.d/init.d/ss5
                ;;
                [nN][oO]|[nN])
                    if [ $? -eq 0 ];then
                        echo "`netstat -anltup | grep ss5`"
                    else
                        echo -e "\n\n"
                        echo "未安装ss5,请重新运行 ss5_install_config.sh 脚本输入 Y 或 y 进行安装!!!"
                        echo "ss5 is not installed, please re-run the ss5_install_config.sh script and enter Y or y to install!!!"
                        echo -e "\n\n"
                    fi
                ;;
                [qQ][uU][iI][tT]|[qQ])
                    exit 0
                ;;
            esac
        ;;
        [qQ][uU][iI][tT]|[qQ])
            exit 0
        ;;
        [sS][tT][oO][pP]|[sS])
            service ss5 stop && service ss5 status
            stop_ss5_1=`ps -ef  | grep "ss5" |awk  '{print $2}'|awk 'NR==1'`
            stop_ss5_2=`ps -ef  | grep "ss5" |awk  '{print $2}'|awk 'NR==2'`
            killall -9 $stop_ss5_1
            killall -9 $stop_ss5_2
            killall -9 ss5
            echo -e "\n"
            echo "##############################################################################################################################"
            echo -e "\n"
            echo "                                              已停止ss5服务，下次开机运行!!!"
            echo "                          The ss5 service has been stopped, and it will run on the next boot!!!"
            echo -e "\n"
            echo "##############################################################################################################################"
            echo -e "\n"
        ;;
        [rR][eE][sS][tT][aA][rR][tT]|[rR])
            /etc/rc.d/init.d/ss5 restart
            if [ $? -eq 0 ];then
                echo "`netstat -anltup | grep ss5`"
            else
                echo -e "\n\n"
                echo "未安装ss5,请重新运行 ss5_install_config.sh 脚本输入 Y 或 y 进行安装!!!"
                echo "ss5 is not installed, please re-run the ss5_install_config.sh script and enter Y or y to install!!!"
                echo -e "\n\n"
            fi
        ;;
        [zZ][sS][tT][aA][tT][eE]|[zZ])
            netstat -anltup | grep ss5
            if [ $? -eq 0 ];then
                echo "`netstat -anltup | grep ss5`"
            else
                echo -e "\n"
                echo "############################################################################################################################################################"
                echo -e "\n"
                echo "                     未安装ss5或未运行ss5;请重新运行 ss5_install_config.sh 脚本输入 [安装编译: "Y" 或 "y" ] 或 [启动进程: "r" 或 "R" ]!!!"
                echo "ss5 is not installed or running; please re-run the ss5_install_config.sh script and enter [install compile: "Y" or "y" ] or [start process: "r" or "R" ]!!!"
                echo -e "\n"
                echo "############################################################################################################################################################"
                echo -e "\n"
            fi
        ;;
        [uU][nN][iI][nN][sS][tT][aA][lL][lL]|[uU])
            service ss5 stop
            rm -rf /run/ss5
            rm -f /run/lock/subsys/ss5
            rm -rf /etc/opt/ss5
            rm -f /usr/local/bin/s5
            rm -rf /usr/lib/ss5
            rm -f /usr/sbin/ss5
            rm -rf /usr/share/doc/ss5
            rm -rf /root/ss5-3.8.9
            rm -f /etc/sysconfig/ss5
            rm -f /etc/rc.d/init.d/ss5
            rm -f /etc/pam.d/ss5
            rm -rf /var/log/ss5
        ;;
        esac
    else
        echo -e "\n\n"
        echo "请在华为云弹性云服务器ECS上使用 ss5_install_config.sh 脚本!!!"
        echo "Please use the ss5_install_config.sh script on HUAWEI CLOUD ECS!!!"
        echo -e "\n\n"
    fi
else
    echo -e "\n\n"
    echo "请在检测华为云弹性云服务器ECS IP （EIP）网络是否可用或是否绑定网卡!!!"
    echo "Please check whether the ECS IP (EIP) network of HUAWEI CLOUD ECS is available or whether the network card is bound!!!"
    echo -e "\n\n"
fi

    if [ $? -eq 0 ];then
        echo -e "\n"
        echo "##############################################################################################################################"
        echo -e "\n"
        echo "                        脚本运行成功;请确保 Huawei Cloud 云服务器防火墙全放通 TCP 和 UDP "
        echo "       The script runs successfully; please ensure that the firewall of Huawei Cloud cloud server allows all TCP and UDP"
        echo -e "\n"
        echo "##############################################################################################################################"
        echo -e "\n"
    else
        echo -e "\n"
        echo "##############################################################################################################################"
        echo -e "\n"
        echo "                         未安装ss5,请重新运行 ss5_install_config.sh 脚本输入 Y 或 y 进行安装!!!"
        echo "             ss5 is not installed, please re-run the ss5_install_config.sh script and enter Y or y to install!!!"
        echo -e "\n"
        echo "##############################################################################################################################"
    fi
ip2=`curl -s ifconfig.me`
port_end=`netstat -anltup | grep ss5 | awk  '{print $4}'|awk -F":" '{ print $2 }'`
echo -e "\n"
echo "##############################################################################################################################"
echo -e "\n\n"
echo "            华为云服务器公网 IP (EIP)和ss5端口|HUAWEI CLOUD server public IP (EIP) and ss5 port  >>>>: $ip2:$port_end"
echo -e "\n\n"
echo "##############################################################################################################################"
exit 0
