FROM ubuntu:22.04

# Set the time zone and avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone

# Install packages via Japanese servers
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://jp.archive.ubuntu.com/ubuntu|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
    texlive-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-lang-japanese \
    latexmk \
    fonts-noto-cjk \
    locales && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure locale settings
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 && \
    echo 'LANG=en_US.UTF-8' >> /etc/environment && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/environment && \
    dpkg-reconfigure locales

# set a workspace
WORKDIR /workdir
