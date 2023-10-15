# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set the non-interactive mode for apt
ARG DEBIAN_FRONTEND=noninteractive

# Update the package lists and install the unattended-upgrades package
RUN apt-get update && \
    apt-get install -y unattended-upgrades && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python3 and the pandas library
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install pandas && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the unattended-upgrades configuration file
COPY 50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

# Run unattended-upgrades when the container starts
CMD ["/usr/bin/unattended-upgrades", "--verbose"]