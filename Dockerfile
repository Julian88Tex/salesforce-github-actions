FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common curl git jq openjdk-17-jdk-headless && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-venv python3.11-distutils python3-pip && \
    ln -sf python3.11 /usr/bin/python3 && \
    ln -sf pip3 /usr/bin/pip

# Install Node.js 18 and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install Salesforce CLI
RUN npm install --global @salesforce/cli

# Install latest CumulusCI
RUN python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install --upgrade 'cumulusci>=4.4.0'

SHELL ["/bin/bash", "-c"] 