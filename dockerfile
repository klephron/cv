FROM zubrailx/base-documentation:latest

ARG DEBIAN_FRONTEND=noninteractive

# Locales
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  locales \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

# Users
RUN echo "root:root" | chpasswd
RUN useradd -ms /bin/bash user
RUN echo "user:user" | chpasswd

# SSH
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  ssh \
  && rm -rf /var/lib/apt/lists/*

RUN echo "Port 2222" >> /etc/ssh/sshd_config && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
EXPOSE 2222

ENTRYPOINT ["bash", "-c", "service ssh restart && /usr/bin/bash" ]
