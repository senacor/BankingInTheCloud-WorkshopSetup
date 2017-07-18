# What you have to do before the workshop starts
This repo provides setup instructions for the banking in the cloud workshops we provide. This part is to be done before the workshop starts.

## Setup Requirements 

The setup we propose will provide you with an lubuntu machine (with GUI) that includes all the necessary tools we use during the workshop. 

Requirements for using the Vagrant machine:

* About ~15GB of free disk space. 
* Your notebook should have at least 10GB RAM (4GB for the host, 6GB for the guest)
* VirtualBox
* Vagrant

### Alternative setup possibilities
You can also setup everything locally or alter the base machine we use.
Local setup instructions can be found in the [alternative-setup folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/alternative-setup).

## Do the 4-step setup

1. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
2. Install VirtualBox Extensions: https://www.virtualbox.org/wiki/Downloads (click on the Extensions link and install the Extension pack)
    * to install the extension start VirtualBox as admin/root and go to File->Settings->Extensions
3. Install Vagrant: https://www.vagrantup.com/downloads.html 
4. run this command in terminal: ```vagrant box add dakami/javadev```

The command will download the [javadev vagrant machine](https://app.vagrantup.com/dakami/boxes/javadev) (box file) to your computer. After the download finished you are done. If the download fails you should start it again with the same command.

Further instructions (provisioning of the machine, project setup, ...) will be given in the workshop.

### Troubleshooting

#### Problem: "[...] error 104"

This is a download error - hashicorp's vagrant cloud (previously "atlas server") and the connections to it are sometimes not that stable... 
If you get this error it means that the connections was interrupted and the download was aborted. You can just run it again ("vagrant box add dakami/ethdev"); it should resume the download at the point where it stopped.

Note: It might help to plug your computer by cable.