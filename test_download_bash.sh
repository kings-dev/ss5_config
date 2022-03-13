cat << "EOF" > /root/test_download_bash.sh
#!/bin/bash
#!/bin/sh
yum -y install wget > /dev/null
wget -q -N --no-check-certificate http://raw.fastgit.org/kings-dev/ss5_config/main/test_install.sh -O /root/test_install.sh && bash test_install.sh
exit 0
EOF
cd ~ && sh test_download_bash.sh
