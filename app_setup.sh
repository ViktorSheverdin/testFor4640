sed -r -i 's/^(%wheel\s+ALL=\(ALL\)\s+)(ALL)$/\1NOPASSWD: ALL/' /etc/sudoers
yum install epel-release vim git tcpdump curl net-tools bzip2
yum update
#firewall-cmd --zone=public --list-all
#firewall-cmd --get-services
firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --add-service=https
firewall-cmd --zone=public --add-service=ssh
firewall-cmd --runtime-to-permanent

setenforce 0
sed -r -i 's/SELINUX=(enforciing|disabled)/SELINUX=permissive/' /etc/selinux/config
