# SmartContract-Workshop
This repo provides instructions for the Smart Contract workshops we provide. 

It is assumed that you did the steps in the folder ```before-workshop``` already.

## Running and shutting down the machine

If you did a local setup (not using the Vagrant VM) you can jump to [section Getting the Code](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/during-workshop#getting-the-code) immediately.

### First startup of machine

To run the machine you have to use the ```Vagrantfile``` and ```bootstrap.sh``` provisioning script provided in [BankingInTheCloud-VM folder](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/during-workshop/BankingInTheCloud-VM)!
Don't just run ```vagrant init``` with the javadev machine, it will not provision as wanted. 

1. Clone this repository. 
2. Navigate to folder ```BankingInTheCloud-VM``` in your terminal.
3. run command: ```vagrant up```
4. The machine will start up with GUI.
5. Log in with password ```vagrant```
6. Move on to [section Getting the Code](https://github.com/senacor/BankingInTheCloud-WorkshopSetup/tree/master/during-workshop#getting-the-code)

Note:  Instead of cloning the repository (step 1) you can also create an empty folder and copy the Vagrantfile and the bootstrap.sh file into it. Vagrant needs these 2 files to manage the machine.

### Startup and shutdown after first startup (including provisioning) is over

Shutdown the machine:
```
vagrant halt 
```

Start the machine (provisioning will not be done unless you say so explicitly):
```
vagrant up
```

### Manage the machine(s)

Update the machine's box to new version (it will show you when I released a new version of the box on the Atlas server):
```
vagrant box update
```

Show list of boxes currently available on this computer:
```
vagrant box list
```

Remove a box from computer:
```
vagrant box remove BOX_NAME [--box.version BOX_VERSION]
```

Note: The box files are stored in the ```.vagrant.d``` folder in your user provile. The upacked VirtualBox machines are stored in VirtualBox's default VM folder. Usually that is the folder ```VirtualBox VMs``` in yor user profile.

### Troubleshooting

#### Problem: "[...] USB 2.0 Ports [...]"

Make sure you installed the VirtualBox Extension Pack! See setup in ```before-workshop```.

#### Problem: "the guest extensions on this machine do not match the installed version of VirtualBox"

Note that this problem will just appear when you run the "vagrant up" command. Adding the machine should not result in problems.

If you get the warning, that "the guest extensions on this machine do not match the installed version of VirtualBox" when you run "vagrant up" you should be able to ignoe it. Note that your shared folder (folder shared between host and guest machine) might not work properly - but that's not a big problem.

#### "No provider found (...)" or similar error message

If you receive an error on machine startup, that tells you that "no provided can be found" (or similar) then make sure you have the latest version of VirtualBox installed. 

#### The setup is stuck ("hangs")

Most important question: Are you on a Lenovo notebook?

*If yes:* 

Most likely your ["hardware virtualization" is deactivated in BIOS](https://stackoverflow.com/questions/34907910/vagrant-up-hangs-at-ssh-auth-method-private-key). 

1. Access your BIOS and activate "hardware virtualization". 
2. Try again, it should work now.

*If no:*

1. Check if your internet connection works properly
2. Wait for about ~5 minutes to see if an error appears.
3. Once an error appears: google it

All the "hang" we encountered so far were caused by the hardware virtualization deactivated problem.

## Getting the Code

In order to get the code you have to [fork](https://help.github.com/articles/fork-a-repo/) the [BankingInTheCloud-Fineract repo](https://github.com/senacor/BankingInTheCloud-Fineract) into your github account.

After you forked the repository you can clone your fork (the forked version of the repository in your github account) into a directory; either in the Vagrant VM (if you plan to use it) or into a local directory on your notebook.

### Configuration pull-request

Once you have a local copy of the forked repository:

1. Create your own branch
2. Ask the instructors for the workshop-branch name in the master repository
3. [Create a pull request from your fork against the workshop-branch of the master repository](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).

