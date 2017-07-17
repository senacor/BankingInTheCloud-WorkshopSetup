#!/usr/bin/env bash

git clone https://github.com/senacor/BankingInTheCloud-Fineract.git

# give rights to vagrant on the folder
sudo chown -R vagrant:vagrant BankingInTheCloud-Fineract/
# add execution rights to the build file
#sudo chmod +x fineract-project/build_all_docker_containers.sh