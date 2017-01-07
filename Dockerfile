FROM centos

MAINTAINER Vladislav Odintsov <odivlad@gmail.com>

RUN yum install epel-release -y && \
    yum install -y \
        gcc \
        git \
        python-devel \
        python-pip && \
    git clone https://github.com/openstack/masakari && \
    cd masakari && \
    pip install -r requirements.txt && \
    python setup.py build && \
    python setup.py install && \
    mkdir /etc/masakari/ && \
    cp ./etc/masakari/api-paste.ini \
        ./etc/masakari/policy.json \
        /etc/masakari/ && \
    yum remove -y \
        epel-release \
        gcc \
        git \
        python-devel \
        python-pip && \
    rm -rf /masakari/

COPY docker-entrypoint.sh /

EXPOSE 15868

ENTRYPOINT ["/docker-entrypoint.sh"]
