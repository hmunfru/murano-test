FROM ubuntu
RUN apt-get update && sudo apt-get -y install python-pip python-dev \
  libmysqlclient-dev libpq-dev \
  libxml2-dev libxslt1-dev git \
  libffi-dev zip python-mysqldb mysql-server
RUN pip install tox tempest nose 
RUN git clone https://github.com/openstack/murano /opt/murano/
COPY tempest.conf /etc/tempest/tempest.conf
WORKDIR /opt/murano
CMD nosetest murano/test/funtional 
