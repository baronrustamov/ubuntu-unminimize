FROM ubuntu:latest
RUN set -xe \
    && apt-get update \
    && apt-get install -y apt-utils tzdata locales
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
     && echo $TZ > /etc/timezone

#RUN set -xe &&\
#    dpkg-reconfigure --frontend=noninteractive tzdata && \
#    sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
#    echo 'LANG="ru_RU.UTF-8"'>/etc/default/locale && \
#    dpkg-reconfigure --frontend=noninteractive locales && \
#    update-locale LANG=ru_RU.UTF-8

#ENV LANG ru_RU.UTF-8
#ENV LANGUAGE ru_RU.UTF-8
#ENV LC_ALL ru_RU.UTF-8

# # Unminimize
RUN yes | unminimize

RUN set -xe \
    && apt-get install -y vim perl wget tar man sudo adduser netstat-nat net-tools curl w3m fish nginx npm git iptables  \
    # && apt-get install -y mariadb-server redis-server postgresql postgresql-contrib python3-pip python3-venv gcc g++ cmake openssh-server \
    && useradd -m -p "\$6\$AyOAQ1vh\$CcIXBW4cJopgUVKsTcxlGplUZ382K4yIxIAHhqmEewzJdc6x0MmbSDDQJ1DR.4eueGlYTf2ZbUl9oAQaUQEoi1" -s /bin/bash user \
    && usermod -aG sudo user \
    && echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user \
    && chmod 0440 /etc/sudoers.d/user 
    # && npm i -g n
    # && n stable

USER user:user

#COPY id_rsa /home/user/.ssh

WORKDIR /home/user

#RUN set -xe \
#    && git clone git@github.com:baronrustamov/fork-off-substrate.git

CMD [ "/bin/bash" ]