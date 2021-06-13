FROM ubuntu:18.04

RUN apt-get -y update
#    apt-get install -y sudo && \
#    rm -rf /var/lib/apt/lists/*

RUN apt-get -y update && \
    apt-get install -y vim apt-utils && \
    apt-get -y  clean

RUN apt install -y python3-pip && \
    apt-get install -y jq && \
    apt-get install -y python-dev && \
    apt-get -y install sshpass && \
#    apt-get install -y curl && \
#    apt install unzip && \
    apt-get -y  clean


# install deps
RUN apt-get update -y && apt-get install -y \
    unixodbc-dev \
    libczmq-dev \
    libssl-dev \
    inetutils-telnet \
    bind9utils \
    gcc \
    sudo\
    default-libmysqlclient-dev\
   # mysql-server\
    && apt-get clean

#RUN apt-get install -y default-libmysqlclient-dev && \
#    libmariadbclient-dev  && \
#    unixodbc-dev

RUN pip3 install mysql-connector-python mysqlclient
RUN pip3 install apache-airflow==1.10.13
RUN pip3 install 'apache-airflow[kubernetes]'
RUN pip3 install 'apache-airflow[mysql]'
RUN pip3 install celery cattrs==1.0.0

#COPY backend root/airflow/backend
#COPY airflow/dags root/airflow/dags/
#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#COPY variables.sh etc/profile.d/variables.sh
COPY airflow.cfg root/airflow/airflow.cfg
#COPY .kube/config root/.kube/config
#RUN  mkdir -p /root/airflow/airflow-bootstrap-scripts && \
#    touch /root/airflow/airflow-bootstrap-scripts/log.txt
#COPY airflow_web.sh root/airflow/airflow-bootstrap-scripts/airflow_web.sh
#COPY dags /root/airflow/dags

#RUN apt-get install --reinstall build-essential -y
#RUN apt-get update RUN apt-get install gcc unixodbc-dev gnupg2 apt-transport-https curl -y \
#    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#    && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list
#RUN apt-get update RUN ACCEPT_EULA=Y apt-get install msodbcsql17 -y
#RUN ACCEPT_EULA=Y apt-get install mssql-tools -y
#RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

#RUN  pip3 install 'apache-airflow[mssql]' \
#                 'pyodbc' \
#                 'pymssql'

EXPOSE 8080
COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
ENTRYPOINT ["bash","/bootstrap.sh"]