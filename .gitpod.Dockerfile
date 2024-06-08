FROM kalilinux/kali-rolling

# Install sudo and other necessary tools
RUN apt-get update && apt-get install -y \
    sudo \
    net-tools \
    iputils-ping \
    vim \
    git \
    curl

# Add gitpod user to sudoers
RUN echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
