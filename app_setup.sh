adduser admin
echo P@ssw0rd | passwd admin --srdin
usermod -aG wheel admin
wget https://acit4640.y.vu/docs/module02/resources/acit_admin_id_rsa.pub -P ~admin/.ssh/authorized_keys

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


mkdir /home/todo-app/app
chown todo-app /home/todo-app/app
cd /home/todo-app/app/
git clone https://github.com/timoguic/ACIT4640-todo-app.git .
npm install

#TODO replace the config file
cp /root/module03/testFor4640/files/database.js /home/todo-app/app/config/ -f
cat /home/todo-app/app/config/database.js

#node /home/todo-app/app/server.js

yum install nginx -y
systemctl enable nginx
systemctl start nginx
cp /root/module03/testFor4640/files/nginx.conf /etc/nginx/nginx.conf -f
cp /root/module03/testFor4640/files/todoapp.service /lib/systemd/system -f

systemctl daemon-reload
systemctl enable todoapp
systemctl start todoapp



