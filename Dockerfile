FROM ubuntu:18.04

RUN export TERM=dumb ; \
  apt-get update && apt-get install -y \
    apt-transport-https gnupg \
    curl locales \
    haproxy supervisor \
    python3.8=3.8.0-3~18.04 \
    python3.8-dev \
    python3.8-venv \
    python3-pip \
    virtualenv \
    less vim unzip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
  
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN update-alternatives --set python /usr/bin/python3.8
RUN update-alternatives --set python3 /usr/bin/python3.8

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD /bin/bash
