###################################################################################################
#	MOST TUTORIALS COME FROM:
# 	https://www.digitalocean.com/community/tags/ubuntu-18-04
###################################################################################################


function install_mysql() {
	#	To install MYSQL
	#	source from:
	#	https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04
	echo "Running 'install mysql'"
	sudo apt update
	sudo apt install mysql-server --yes
	#	sudo mysql_secure_installation
	#	Instead of using the above step, just use the usual
}


function connect_to_mysql_database() {
	sudo mysql -u root -p
	# enter password
}



// To install MYSQL WORKBENCH
1. Go to Ubuntu App Store (Ubuntu Software)


// UPDATE MYSQL POLICY REQUIREMENT
// source from:
// https://stackoverflow.com/questions/43094726/your-password-does-not-satisfy-the-current-policy-requirements
1. sudo mysql -u root -p
2. enter password
3. SHOW VARIABLES LIKE 'validate_password%';
4. SET GLOBAL validate_password.length = 8;
5. SET GLOBAL validate_password.mixed_case_count = 0;
6. SET GLOBAL validate_password.number_count = 0;
7. SET GLOBAL validate_password.policy = low;
8. SET GLOBAL validate_password.special_char_count = 0;
9. SHOW VARIABLES LIKE 'validate_password%';


// CREATE A NEW USER
// source from:
// https://askubuntu.com/questions/773446/unable-to-connect-via-mysql-workbench-to-localhost-in-ubuntu-16-04-passwordless
1. sudo mysql -u root -p
2. enter password
3. CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
4. GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;




/**************************************************************************************************
					GIT-RELATED
for more info: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04
**************************************************************************************************/
// To install GIT
// source from:
// https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
1. sudo apt-get update --yes
2. sudo apt-get install git --yes
3. git --version
4. git config --list --global


// How to fix Git always asking for user credentials
// source from:
// https://www.freecodecamp.org/news/how-to-fix-git-always-asking-for-user-credentials/
1. git config --global credential.helper store

//  TO REMOVE CREDENTIALS
// source from: https://stackoverflow.com/questions/15381198/remove-credentials-from-git
 git config --global --unset credential.helper




/**************************************************************************************************
					USEFUL NPM COMMANDS
			For more info: https://docs.npmjs.com/cli/v6/commands
**************************************************************************************************/
// Get List of Globally Installed Packages
// source: https://www.dariawan.com/tutorials/javascript/npm-get-list-globally-installed-packages/
npm list -g --depth 0


// To install POSTMAN
search in Ubuntu Software STore

 

/**************************************************************************************************
					JAVA-RELATED
**************************************************************************************************/
 // To install JAVA
 // source:
 // https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04
 1. sudo apt-get update
 2. sudo apt install default-jdk --yes
 3. java --version
 
 
 
 
/**************************************************************************************************
					Linux-RELATED
**************************************************************************************************/
// list installed packages
// source: https://www.cyberciti.biz/faq/apt-get-list-packages-are-installed-on-ubuntu-linux/
 sudo apt list --installed
 
 
 
 
 /**************************************************************************************************
					DOCKER-RELATED
source: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
**************************************************************************************************/
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common --yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
docker --version




/**************************************************************************************************
					ZIP-RELATED
**************************************************************************************************/
// ARCHIVE FILES
// sudo apt-get install p7zip-full --yes

// sudo apt remove p7zip --yes




/**************************************************************************************************
					BASH/TERMINAL-RELATED
source: https://www.howtogeek.com/howto/41418/how-to-be-more-productive-in-ubuntu-using-keyboard-shortcuts/
**************************************************************************************************/
Shift+Ctrl+T: Open a new tab. 
Shift+Ctrl+W Close the current tab. 
Ctrl+Page Up: Switch to the previous tab
