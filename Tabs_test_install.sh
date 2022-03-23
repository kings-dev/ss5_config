#!/bin/bash
#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
echo "请等待.................................................... [  OK  ]"
echo "Please wait............................................... [  OK  ]"
ping -c 2 cip.cc >/dev/null 2>&1
if [[ $? -eq 0 ]];then
ip=`curl -s ifconfig.me`
	echo "##############################################################################################################################"
	echo -e "\n"
	echo "			云服务器公网 IP (EIP)|CLOUD server public IP (EIP)   >>>>>: $ip"
	echo -e "\n"
	echo "##############################################################################################################################"
	huawei=`curl cip.cc|grep "华为云"|awk '{print $5}'`
	if [[ -z "$huawei" ]];then
		sed -i '$a export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' ~/.bash_profile
		source ~/.bash_profile
		read -ep "        现在搭建ss5应用服务下载安装 Centos 7.6 环境依赖包和源包,
		操作请输入（英文提示符号）再回车:
		Now build the ss5 application service to download and install the Centos 7.6 environment dependency package and source package,
		please enter (English prompt symbol) and press Enter:
#^Y^#
		[安装编译+++++++++++: "Y" 或 "y" ]
		[Install build +++++: "Y" or "y" ]
#^N^#
		[修改端口+++++++++++: "n" 或 "N" ]
		[Modify port +++++++: "n" or "N" ]
#^Q^#
		[退出脚本+++++++++++: "q" 或 "Q" ]
		[Exit script +++++++: "q" or "Q" ]
#^S^#
		[关闭进程+++++++++++: "s" 或 "S" ]
		[close process +++++: "s" or "S" ]
#^R^#
		[启动进程+++++++++++: "r" 或 "R" ]
		[start process +++++: "r" or "R" ]
#^Z^#
		[进程状态+++++++++++: "z" 或 "Z" ]
		[process status ++++: "z" or "Z" ]
#^U^#
		[卸载程序+++++++++++: "u" 或 "U" ]
		[Uninstaller +++++++: "u" or "U" ]
#^V^#
		>> " ok
		echo -e "\n"
		case $ok in
		[yY][eE][sS]|[yY])
			echo "Yum 下载依赖包环境进行安装中 ................................................. 耐心等待 ...................>> [  OK  ]"
			echo -e "Yum is downloading the dependency package environment for installation ....... Wait patiently .............>> [  OK  ]\n"
#**************************************************************************************#
cat << "EOF" > ./par.sh
#!/bin/bash
echo -e "\n\n"
par0=`ps|grep "yum" >/dev/null;echo $?`
while [ "$par0" == "0" ];
	do
		sleep 0.1 && echo -ne "\r\\		Activity: \\			001%  . "&&
		sleep 0.1 && echo -ne "\r|		Activity: |			004%  .. "&&
		sleep 0.1 && echo -ne "\r/		Activity: /			009%  ... "&&
		sleep 0.1 && echo -ne "\r-		Activity: -			013%  .... "&&
		sleep 0.1 && echo -ne "\r\\		:Active: \\			020%  ..... "&&
		sleep 0.1 && echo -ne "\r|		:aCtive: |			027%  ...... "&&
		sleep 0.1 && echo -ne "\r/		:acTive: /			030%  ....... "&&
		sleep 0.1 && echo -ne "\r-		:actIve: -			042%  ........ "&&
		sleep 0.1 && echo -ne "\r\\		:actiVe: \\			050%  ......... "&&
		sleep 0.1 && echo -ne "\r|		:activE: |			061%  .......... "&&
		sleep 0.1 && echo -ne "\r/		:activE: /			073%  ........... "&&
		sleep 0.1 && echo -ne "\r-		:actiVe: -			080%  ............ "&&
		sleep 0.1 && echo -ne "\r\\		:actIve: \\			084%  ............. "&&
		sleep 0.1 && echo -ne "\r|		:acTive: |			090%  .............. "&&
		sleep 0.1 && echo -ne "\r/		:aCtive: /			096%  ............... "&&
		sleep 0.1 && echo -ne "\r-		:Active: -			100%  ................ ";
		if [ "$par0" == "1" ];then
		break
		exit
		fi
	done
echo -e "\n"
echo "Yum install Or Update >>>: OK."
echo -e "\n\n\n"
exit 0
EOF
#**************************************************************************************#
			bash par.sh & yum -y install yum-utils wget net-tools gcc gcc-c++ automake autoconf libtool make pam-devel openldap-devel cyrus-sasl-devel openssl-devel | xargs -L 21 | xargs -I@ echo -ne "\r\n#...Yum Install...[########################################][  OK  ]\n\r"
			bash par.sh & yum update -y nss curl libcurl  | xargs -L 12 | xargs -I@ echo -ne "\r\n#...Yum Update...[########################################][  OK  ]\n\r"
			#yum clean all >/dev/null 2>&1;yum-complete-transaction >/dev/null 2>&1
			echo -e "\r\n正在下载		'ss5-3.8.9-8.tar.gz' .... 耐心等待 ........... [  OK  ]\n\r"
			echo -e "\r\nDownloading	'ss5-3.8.9-8.tar.gz' .... Wait patiently ..... [  OK  ]\n\r"
			wget -nc http://downloads.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz >/dev/null 2>&1
			lj=`pwd`
			tar -xzvf ss5-3.8.9-8.tar.gz | xargs -L 13 | xargs -I@ echo -ne "\r\n#..Tar -xzvf *.gz.[########################################][  OK  ]\n\r"
			cd /$lj/ss5-3.8.9/
			./configure >/dev/null 2>&1;make >/dev/null 2>&1;make install >/dev/null 2>&1
			echo -e "\r\n===>... 配置 ........ 编译 ....... 安装 ................>> [  OK  ]\n\r"
			echo -e "\r\n===>... Configure ... Make ....... Install .............>> [  OK  ]\n\r"
			chmod 777 /etc/rc.d/init.d/ss5
			chmod a+x /etc/rc.d/init.d/ss5
			confFile=/etc/opt/ss5/ss5.conf
			sed -i '87c auth	0.0.0.0/0		-		-' $confFile
			sed -i '203c permit	-	0.0.0.0/0	-	0.0.0.0/0	-	-	-	-	-	' $confFile
			sed -i '2c SS5_OPTS=" -u root -b 0.0.0.0:1080"' /etc/sysconfig/ss5
			chmod a+x /etc/init.d/ss5
			mkdir -p /var/run/ss5/
			chmod 755 /etc/opt/ss5
			chmod a+x /etc/rc.d/rc.local
			chmod +x /etc/init.d/ss5
			sed -i '2c export SS5_SOCKS_PORT=1080' /etc/init.d/ss5
			sed -i '3c export SS5_SOCKS_USER=root' /etc/init.d/ss5
			systemctl daemon-reload
			service ss5 start && service ss5 status
			echo -e "\n"
			/etc/rc.d/init.d/ss5 restart
			echo -e "\n"
			echo "`netstat -anltup | grep ss5`"
			systemctl daemon-reload
		;;
		[nN][oO]|[nN])
			read -ep "			默认端口为：1080,
			如需修改SS5端口(1-65535)操作请输入（英文提示符号）再回车:
			The default port is: 1080. If you need to modify the SS5 port (1-65535),
			please enter (English prompt symbol) and press Enter:
#^Y^#
			[定义端口+++++++++++: "y" 或 "Y" ]
			[Define port +++++++: "y" or "Y" ]
#^N^#
			[不改端口+++++++++++: "n" 或 "N" ]
			[Do not change port : "n" or "N" ]
#^Q^#
			[退出脚本+++++++++++: "q" 或 "Q" ]
			[Exit script +++++++: "q" or "Q" ]
#^V^#
			>> " ok0
			echo -e "\n"
			case $ok0 in
				[yY][eE][sS]|[yY])
					echo "已使用端口(IP:端口)Port used (IP:Port)：`netstat -anultp`"
					read -ep "输入 '未使用' 端口号Enter the 'unused' port number（1-65535）: " ss5_Port
					sed -i '2c SS5_OPTS=" -u root -b 0.0.0.0:'$ss5_Port'"' /etc/sysconfig/ss5
					sed -i '2c export SS5_SOCKS_PORT='$ss5_Port'' /etc/init.d/ss5
					if [[ $? -eq 0 ]];then
						systemctl start firewalld
						firewall-cmd --zone=public --add-port=$ss5_Port/tcp --permanent
						firewall-cmd --zone=public --query-port=$ss5_Port/tcp
						/usr/sbin/iptables -I INPUT -p tcp --dport $ss5_Port -j ACCEPT
						firewall-cmd --add-port=$ss5_Port/tcp --permanent
						firewall-cmd --reload
						systemctl daemon-reload
						service ss5 restart && service ss5 status
						echo "`netstat -anltup | grep ss5`"
						echo -e "\n"
					else
						echo -e "\n\n"
						echo "未安装ss5,请重新运行 test_install.sh 脚本输入 Y 或 y 进行安装!!!"
						echo "ss5 is not installed, please re-run the test_install.sh script and enter Y or y to install!!!"
						echo -e "\n\n"
					fi
					chmod 755 /etc/init.d/ss5
					chmod a+x /etc/init.d/ss5
					chmod a+x /etc/rc.d/init.d/ss5
				;;
				[nN][oO]|[nN])
					if [[ $? -eq 0 ]];then
						systemctl daemon-reload
						echo "`netstat -anltup | grep ss5`"
					else
						echo -e "\n\n"
						echo "未安装ss5,请重新运行 test_install.sh 脚本输入 Y 或 y 进行安装!!!"
						echo "ss5 is not installed, please re-run the test_install.sh script and enter Y or y to install!!!"
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
			systemctl daemon-reload
			stop_ss5_1=`ps -ef  | grep "ss5" |awk  '{print $2}'|awk 'NR==1'`
			stop_ss5_2=`ps -ef  | grep "ss5" |awk  '{print $2}'|awk 'NR==2'`
			killall -9 $stop_ss5_1
			killall -9 $stop_ss5_2
			killall -9 ss5
			echo -e "\n"
			echo "##############################################################################################################################"
			echo -e "\n"
			echo "												已停止ss5服务，下次开机运行!!!"
			echo "							The ss5 service has been stopped, and it will run on the next boot!!!"
			echo -e "\n"
			echo "##############################################################################################################################"
			echo -e "\n"
		;;
		[rR][eE][sS][tT][aA][rR][tT]|[rR])
			/etc/rc.d/init.d/ss5 restart
			if [[ $? -eq 0 ]];then
				echo "`netstat -anltup | grep ss5`"
				systemctl daemon-reload
			else
				echo -e "\n\n"
				echo "未安装ss5,请重新运行 test_install.sh 脚本输入 Y 或 y 进行安装!!!"
				echo "ss5 is not installed, please re-run the test_install.sh script and enter Y or y to install!!!"
				echo -e "\n\n"
			fi
		;;
		[zZ][sS][tT][aA][tT][eE]|[zZ])
			netstat -anltup | grep ss5
			if [[ $? -eq 0 ]];then
				echo "`netstat -anltup | grep ss5`"
				systemctl daemon-reload
			else
				echo -e "\n"
				echo "############################################################################################################################################################"
				echo -e "\n"
				echo "						未安装ss5或未运行ss5;请重新运行 test_install.sh 脚本输入 [安装编译: "Y" 或 "y" ] 或 [启动进程: "r" 或 "R" ]!!!"
				echo "ss5 is not installed or running; please re-run the test_install.sh script and enter [install compile: "Y" or "y" ] or [start process: "r" or "R" ]!!!"
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
			rm -rf /$lj/ss5-3.8.9
			rm -f /etc/sysconfig/ss5
			rm -f /etc/rc.d/init.d/ss5
			rm -f /etc/pam.d/ss5
			rm -rf /var/log/ss5
		;;
		esac
	else
		echo -e "\n\n"
		echo "请在弹性云服务器ECS上使用 test_install.sh 脚本!!!"
		echo "Please use the test_install.sh script on ECS!!!"
		echo -e "\n\n"
	fi
else
	echo -e "\n\n"
	echo "请在检测弹性云服务器ECS IP （EIP）网络是否可用或是否绑定网卡!!!"
	echo "Please check whether the ECS IP (EIP) network of ECS is available or whether the network card is bound!!!"
	echo -e "\n\n"
fi
	if [[ $? -eq 0 ]];then
		echo -e "\n"
		echo "##############################################################################################################################"
		echo -e "\n"
		echo "							脚本运行成功; 请确保云服务器防火墙全放通 TCP 和 UDP "
		echo "			The script runs successfully; please ensure that the firewall of cloud server allows all TCP and UDP"
		echo -e "\n"
		echo "##############################################################################################################################"
		echo -e "\n"
	else
		echo -e "\n"
		echo "##############################################################################################################################"
		echo -e "\n"
		echo "							未安装ss5, 请重新运行 test_install.sh 脚本输入 Y 或 y 进行安装!!!"
		echo "			ss5 is not installed, please re-run the test_install.sh script and enter Y or y to install!!!"
		echo -e "\n"
		echo "##############################################################################################################################"
	fi
	ip2=`curl -s ifconfig.me`
	port_end=`netstat -anltup | grep ss5 | awk  '{print $4}'|awk -F":" '{ print $2 }'`
	systemctl daemon-reload
	echo -e "\n"
	echo "##############################################################################################################################"
	echo -e "\n\n"
	echo "				云服务器公网 IP (EIP)和ss5端口|CLOUD server public IP (EIP) and ss5 port	>>>>: $ip2:$port_end"
	echo -e "\n\n"
	echo "##############################################################################################################################"
	echo -e "\n\n\n"
	exit 0
