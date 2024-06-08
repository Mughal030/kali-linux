FROM kalilinux/kali-rolling

# Install any additional tools you need
RUN apt-get update && apt-get install -y \
    net-tools \
    iputils-ping \
    vim \
    git \
    curl

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
