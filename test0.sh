cat << "EOF" > /root/test0.sh
#!/bin/bash
#!/bin/sh
yum -y install wget > /dev/null
wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/test1.sh -O /root/test1.sh
exit 0
EOF
cd ~ && sh test0.sh
