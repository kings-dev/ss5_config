cat << "EOF" > /root/test_download_bash.sh
#!/bin/bash
#!/bin/sh
yum -y install wget > /dev/null
wget -q --no-check-certificate https://gh.api.99988866.xyz/https://raw.githubusercontent.com/kings-dev/ss5_config/main/test_install.sh -O /root/test1.sh && bash test_install.sh
exit 0
EOF
cd ~ && sh test_download_bash.sh
