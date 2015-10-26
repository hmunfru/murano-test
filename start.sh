apt-get install -y host syslinux
host="murano"
ip="`gethostip -d "$host"`"
echo $ip
df -h
ls -l /opt
echo "$ip murano.lab.fiware.org" >> /etc/hosts
cat /etc/hosts
curl http://$ip:8082
cat /opt/test/hola
sed -i -e "s/XXX/${PASSWORD}/" /etc/tempest/tempest.conf
