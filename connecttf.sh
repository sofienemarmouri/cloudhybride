TF_VERSION=1.5.7
curl -LO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
unzip terraform_${TF_VERSION}_linux_amd64.zip
chmod +x terraform
sudo mv terraform /usr/local/bin/terraform_${TF_VERSION}
sudo rm /usr/local/bin/terraform
sudo ln -s /usr/local/bin/terraform_${TF_VERSION} /usr/local/bin/terraform
rm terraform_${TF_VERSION}_linux_amd64.zip
