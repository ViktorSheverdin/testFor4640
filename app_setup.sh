sed -r -i 's/^(%wheel\s+ALL=\(ALL\)\s+)(ALL)$/\1NOPASSWD: ALL/' /etc/sudoers
yum install epel-release vim git tcpdump curl net-tools bzip2
yum update
