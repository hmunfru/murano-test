apt-get install -y host syslinux
host="murano"
ip="`gethostip -d "$host"`"
echo $ip
df -h
ls -l /opt
echo "$ip murano.lab.fiware.org" >> /etc/hosts
sed -i -e "s/XXX/${PASSWORD}/" /etc/tempest/tempest.conf
