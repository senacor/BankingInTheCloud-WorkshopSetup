#!/usr/bin/env bash

# script origin: https://stackoverflow.com/questions/30130934/how-to-install-intellij-idea-on-ubuntu 

# We need root to install
[ $(id -u) != "0" ] && exec sudo "$0" "$@"


echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections
# Attempt to install a JDK
# apt-get install openjdk-8-jdk
echo "##############################################"
echo "################ INSTALL JAVA 8 ##############"
echo "##############################################"
add-apt-repository ppa:webupd8team/java && apt-get update && apt-get -y install oracle-java8-installer

# Prompt for edition
#while true; do
#    read -p "Enter 'U' for Ultimate or 'C' for Community: " ed 
#    case $ed in
#        [Uu]* ) ed=U; break;;
#        [Cc]* ) ed=C; break;;
#    esac
#done

echo "##############################################"
echo "########## INSTALL INTELLIJ IDEA #############"
echo "##############################################"

ed=C

# Fetch the most recent version
VERSION=$(wget "https://www.jetbrains.com/intellij-repository/releases" -qO- | grep -P -o -m 1 "(?<=https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/idea/BUILD/)[^/]+(?=/)")

# Prepend base URL for download
URL="https://download.jetbrains.com/idea/ideaI$ed-$VERSION.tar.gz"

echo $URL

# Truncate filename
FILE=$(basename ${URL})

# Set download directory
DEST=/home/vagrant/Downloads/$FILE

echo "Downloading idea-I$ed-$VERSION to $DEST..."

# Download binary
wget -cO ${DEST} ${URL} --read-timeout=5 --tries=0

echo "Download complete!"

# Set directory name
DIR="/opt/idea-I$ed-$VERSION"

echo "Installing to $DIR"

# Untar file
if mkdir ${DIR}; then
    tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi

# Grab executable folder
BIN="$DIR/bin"

# Add permissions to install directory
chown -R vagrant:vagrant ${DIR}
chmod -R +rwx ${DIR}

# Set desktop shortcut path
DESK=/usr/share/applications/IDEA.desktop

# Add desktop shortcut
echo "[Desktop Entry]" > ${DESK}
echo "Encoding=UTF-8" >> ${DESK}
echo "Name=IntelliJ IDEA" >> ${DESK}
echo "Comment=IntelliJ IDEA">> ${DESK}
echo "Exec=${BIN}/idea.sh" >> ${DESK}
echo "Icon=${BIN}/idea.png" >> ${DESK}
echo "Terminal=false" >> ${DESK}
echo "StartupNotify=true" >> ${DESK}
echo "Type=Application" >> ${DESK}

# copy desktop shortcut to desktop
cp /usr/share/applications/IDEA.desktop /home/vagrant/Desktop/

# Create symlink entry
ln -s ${BIN}/idea.sh /usr/local/bin/idea

# cleanup downloaded archive file
rm ${DEST}

echo "Done installing IntelliJ." 

# source: https://store.docker.com/editions/community/docker-ce-server-ubuntu

echo "##############################################"
echo "############## SETUP DOCKER REPO #############"
echo "##############################################"
apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

apt-get update

echo "##############################################"
echo "############### INSTALL DOCKER ###############"
echo "##############################################"
apt-get -y install docker-ce

echo "##############################################"
echo "################ TEST  DOCKER ################"
echo "##############################################"
docker run hello-world

echo "##############################################"
echo "########### INSTALL DOCKER COMPOSE ###########"
echo "##############################################"
apt-get update
apt-get -y install python-pip
pip install docker-compose

echo "##############################################"
echo "### MAKE DOCKER AVAILABLE FOR VAGRANT USER ###"
echo "##############################################"
groupadd docker
gpasswd -a vagrant docker

# source: https://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/

echo "##############################################"
echo "############### INSTALL MAVEN ################"
echo "##############################################"
apt-cache search maven
apt-get install -y maven

echo "##############################################"
echo "############ TEST: MAVEN VERSION #############"
echo "##############################################"
mvn -version

echo "##############################################"
echo "############# INSTALL:  NODEJS ###############"
echo "##############################################"
# source: https://nodejs.org/en/download/package-manager/
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

echo "##################################################"
echo "### INSTALL: Chrome (better web-tool support) ####"
echo "##################################################"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable
# add desktop entry for chrome
cp /usr/share/applications/google-chrome.desktop /home/vagrant/Desktop/

echo "##################################################"
echo "############## INSTALL: Postman ##################"
echo "##################################################"
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
# create postman unity launcher icon 
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

