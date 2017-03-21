FROM centos

LABEL maintainer "Vladislav Odintsov <odivlad@gmail.com>"

RUN yum install epel-release -y && \
    yum install -y \
        gcc \
        git \
        python-devel \
        python-pip

RUN git clone https://github.com/openstack/masakari && \
        cd masakari && \
        pip install -r requirements.txt && \
        python setup.py install
RUN pip install pymysql
RUN yum remove -y \
        epel-release \
        gcc \
        git \
        python-devel \
        python-pip && \
    rm -rf /masakari/

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["masakari-engine"]
