FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install --no-install-recommends \
  ca-certificates curl perl \
  && rm -rf /var/lib/apt/lists/*

RUN cd ~ \
  && curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  && zcat < install-tl-unx.tar.gz | tar xf - \
  && cd install-tl-* && perl ./install-tl --no-interaction \
  && rm -rf install-tl-unx.tar.gz && rm -rf ~/install-tl-*

RUN echo "export PATH=\"$PATH:$(echo /usr/local/texlive/*/bin/x86_64-linux)\"" >> /etc/profile.d/99-texlive.sh \
  && chmod +x /etc/profile.d/99-texlive.sh

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  build-essential pandoc fontconfig \
  && rm -rf /var/lib/apt/lists/*

# For remote development
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  git ssh locales \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8  

# Change default password for root user
RUN echo "root:root" | chpasswd

RUN echo "Port 2222" >> /etc/ssh/sshd_config && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
EXPOSE 2222

ENTRYPOINT ["bash", "-c", "service ssh restart && /bin/bash" ]
