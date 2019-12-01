#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install unzip
# Install Terraform Version 0.12.16
wget -q https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip
#  Unzip it
unzip terraform_0.12.16_linux_amd64.zip
# Add to bin
sudo mv terraform /usr/local/bin/
# Clone theh repo
git clone https://github.com/jsrice7391/terraform-talk.git
# Go into the repo
cd terraform-talk/
