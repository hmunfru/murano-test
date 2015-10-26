apt-get install -y host syslinux
host="murano"
ip="`gethostip -d "$host"`"
echo $ip
dh -f
ls -l /opt/test
echo "$ip murano.lab.fiware.org" >> /etc/hosts
sed -i -e "s/XXX/${PASSWORD}/" /etc/tempest/tempest.conf
