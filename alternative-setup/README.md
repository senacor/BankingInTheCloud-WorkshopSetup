# Alternative Setup

This folder contains information on an alternative setup (locally) if you don't want to use the provided virtual machine. If you don't have ~15GB of disk space available, or if your notebook does not have that much RAM it might be better to do a local setup. Otherwise we recommend using the virtual machine, as described in the [before-workshop folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/before-workshop).

If you want to setup the tools locally and you are on a *nix System you can use the setup-script provided in the [scripts folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/alternative-setup/scripts). 
Note that the provided script is the provisioning script for the base machine we use for Vagrant. You might have to adapt it to your system's need before using it.

## Tools you need during the workshop 

You need the following tools:

* Java 1.8.x
* IntelliJ IDEA (community edition)
* NodeJs 6.x + npm
* docker
* docker-compose
* Maven 
* Chrome
* Postman (Chrome extension)
* dBeaver (optional)

Furthermore you have to clone the [BankingInTheCloud-Fineract repo](https://github.com/senacor/BankingInTheCloud-Fineract/).

Note that you can also use any other IDE (eclipse, NetBeans, ...) but we only support IntelliJ IDEA, so you will be responsible for the fineract-setup by yourself.
Note that you can also use IntelliJ IDEA Ultimate Edition (if you have a license). Since we cannot assure that all participants will have an IntelliJ IDEA Ultimate license we prepare the examples using the community edition.

If you use the virtual machine the tools mentioned above are pre-installed in the machine and the repo is cloned upon provisioning when starting the machine for the first time.
