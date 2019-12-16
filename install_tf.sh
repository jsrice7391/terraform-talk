#!/usr/bin/env bash
sudo apt-get -qq update
sudo apt-get install unzip
if [ -x "$(command -v pip)" ]; then
    echo "pip installed."
fi
sudo apt-get install python-pip -y -qq
sudo apt-get install python3-pip -y -qq
pip3 install awscli virtualenv --upgrade --user

# Install Terraform Version 0.12.16

wget -q https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip
#  Unzip it
unzip terraform_0.12.16_linux_amd64.zip
# Add to bin
sudo mv terraform /usr/local/bin/

echo "Tfenf not installed yet. Installing tfenv"
rm -r ~/.tfenv
sudo git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo $?
echo "Cloned repo"

