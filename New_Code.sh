#!/bin/bash
#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#clear
echo "请等待.................................................... [  OK  ]"
echo "Please wait............................................... [  OK  ]"
ping -c 2 cip.cc >/dev/null 2>&1
if [[ $? -eq 0 ]];then
ip=`curl -s ifconfig.me`
    echo "##############################################################################################################################"
    echo -e "\n"
    echo "        华为云服务器公网 IP (EIP)|HUAWEI CLOUD server public IP (EIP)   >>>>>: $ip"
    echo -e "\n"
    echo "##############################################################################################################################"
    huawei=`curl cip.cc |awk 'NR==5 {print $0}'|awk '{print $5}'|md5sum`
    huawei_encrypt=`echo $huawei|sha1sum`
    if [[ $huawei_encrypt = "ef3904fa7c30f29213cdd606b168d6aec7929499 -" ]];then
        echo "ok"
        else
        echo "no ok"
    fi
    else
    echo "ip no ok"
    fi
