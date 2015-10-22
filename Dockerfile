FROM ubuntu
RUN apt-get update && sudo apt-get -y install python-pip python-dev \
  libmysqlclient-dev libpq-dev \
  libxml2-dev libxslt1-dev git \
  libffi-dev zip python-mysqldb mysql-server
RUN pip install tox  
RUN git clone https://github.com/openstack/murano /opt/murano/
RUN git clone https://github.com/openstack/tempest /opt/murano/tempest
WORKDIR /opt/murano/tempest
RUN pip install -r requirements.txt
RUN python setup.py install
RUN pip install nose tempest-lib
WORKDIR /opt/murano
COPY requirements.txt /opt/murano/requirements.txt
RUN pip install -r test-requirements.txt
RUN pip install -r requirements.txt
RUN python setup.py install
COPY start.sh /opt/murano/start.sh
CMD ./start.sh; nosetests /opt/murano/murano/tests/functional/api/v1 
