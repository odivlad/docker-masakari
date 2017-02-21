FROM centos

LABEL maintainer "Vladislav Odintsov <odivlad@gmail.com>"

RUN yum install epel-release -y && \
    yum install -y \
        gcc \
        git \
        python-devel \
        python-pip

RUN pip install masakari
RUN pip install pymysql
RUN yum remove -y \
        epel-release \
        gcc \
        git \
        python-devel \
        python-pip && \
    rm -rf /masakari/

VOLUME /etc/masakari/

EXPOSE 15868

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["masakari-api"]
