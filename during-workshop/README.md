# SmartContract-Workshop
This repo provides instructions for the Smart Contract workshops we provide. 

It is assumed that you did the steps in the folder ```before-workshop``` already.

## Running and shutting down the machine

### First startup of machine

To run the machine you have to use the ```Vagrantfile``` and ```bootstrap.sh``` provisioning script provided in folder ```provision-ethdev```!
Don't just run ```vagrant init``` with the ethdev machine, it will not provision as wanted. 

1. Clone this repository. 
2. Navigate to folder ```BankingInTheCloud-VM``` in your terminal.
3. run command: ```vagrant up```
4. Wait until the command line output finishes (provisioning will be done headless).
5. run command: ```vagrant halt```
6. Wait until the machine was "gracefully shut down"
7. run command (again): ```vagrant up```
8. The machine will start up with GUI now.
9. Log in with password ```vagrant```

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

1. Check if you your internet connection works properly
2. Wait for about ~5 minutes to see if an error appears.
3. Once an error appears: google it

All the "hang" we encountered so far were caused by the hardware virtualization deactivated problem.