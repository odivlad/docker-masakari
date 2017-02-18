FROM centos

LABEL maintainer "Vladislav Odintsov <odivlad@gmail.com>"

RUN yum install epel-release -y && \
    yum install -y \
        gcc \
        git \
        python-devel \
        python-pip

#RUN git clone https://github.com/openstack/masakari && \
#    cd masakari && \
#    pip install -r requirements.txt && \
#    python setup.py build && \
#    python setup.py install && \
#    mkdir /etc/masakari/
#    cp ./etc/masakari/api-paste.ini \
#        ./etc/masakari/policy.json \
#        /etc/masakari/
RUN pip install masakari
RUN yum remove -y \
        epel-release \
        gcc \
        git \
        python-devel \
        python-pip && \
    rm -rf /masakari/

COPY docker-entrypoint.sh /

ADD masakari.conf /etc/masakari/

EXPOSE 15868

ENTRYPOINT ["/docker-entrypoint.sh"]
