sed -r -i 's/^(%wheel\s+ALL=\(ALL\)\s+)(ALL)$/\1NOPASSWD: ALL/' /etc/sudoers
yum install epel-release vim git tcpdump curl net-tools bzip2 -y
yum update -y
#firewall-cmd --zone=public --list-all
#firewall-cmd --get-services
firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --add-service=https
firewall-cmd --zone=public --add-service=ssh
firewall-cmd --runtime-to-permanent

setenforce 0
sed -r -i 's/SELINUX=(enforciing|disabled)/SELINUX=permissive/' /etc/selinux/config

useradd -m -r todo-app && passwd -l todo-app
yum install nodejs npm -y
yum install mongodb-server -y
systemctl enable mongod && systemctl start mongod

su - todo-app
mkdir app
git clone https://github.com/timoguic/ACIT4640-todo-app.git .
npm install

#TODO replace the config file

yum install nginx -y



