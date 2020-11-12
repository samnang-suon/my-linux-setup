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


function install_mysql_workbench() {
	echo "To install MYSQL WORKBENCH"
	echo "Go to Ubuntu App Store (Ubuntu Software)"
}


function update_mysql_policy() {
	echo "RUNNING UPDATE MYSQL POLICY REQUIREMENT"
	#	source from:
	#	https://stackoverflow.com/questions/43094726/your-password-does-not-satisfy-the-current-policy-requirements
	sudo mysql -u root -p
	#	enter password
	SHOW VARIABLES LIKE 'validate_password%';
	SET GLOBAL validate_password.length = 8;
	SET GLOBAL validate_password.mixed_case_count = 0;
	SET GLOBAL validate_password.number_count = 0;
	SET GLOBAL validate_password.policy = low;
	SET GLOBAL validate_password.special_char_count = 0;
	SHOW VARIABLES LIKE 'validate_password%';
}


function create_a_new_database_user() {
	echo "CREATING A NEW USER"
	#	source from:
	#	https://askubuntu.com/questions/773446/unable-to-connect-via-mysql-workbench-to-localhost-in-ubuntu-16-04-passwordless
	sudo mysql -u root -p
	# enter password
	CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
	GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;	
}




###################################################################################################
#	GIT-RELATED
#	for more info: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04
###################################################################################################
function install_git() {
	#	source from:
	#	https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
	sudo apt-get update --yes
	sudo apt-get install git --yes
	git --version
	git config --list --global
}


function enable_git_credential_helper() {
	#	How to fix Git always asking for user credentials
	#	source from:
	#	https://www.freecodecamp.org/news/how-to-fix-git-always-asking-for-user-credentials/
	git config --global credential.helper store

	#	TO REMOVE CREDENTIALS
	#	source from: https://stackoverflow.com/questions/15381198/remove-credentials-from-git
	#	git config --global --unset credential.helper
}





###################################################################################################
#	USEFUL NPM COMMANDS
#	For more info: https://docs.npmjs.com/cli/v6/commands
###################################################################################################
function list_npm_global_installed_packages() {
	#	Get List of Globally Installed Packages
	#	source: https://www.dariawan.com/tutorials/javascript/npm-get-list-globally-installed-packages/
	npm list -g --depth 0
}


function install_postman() {
	#	To install POSTMAN
	#	search in Ubuntu Software STore
}




###################################################################################################
#	JAVA-RELATED
###################################################################################################
function install_java() {
	#To install JAVA
	#	source:
	#	https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04
	sudo apt-get update
	sudo apt install default-jdk --yes
	java --version
}




###################################################################################################
#	LINUX-RELATED
###################################################################################################
function list_linux_installed_packages() {
	#	list installed packages
	#	source: https://www.cyberciti.biz/faq/apt-get-list-packages-are-installed-on-ubuntu-linux/
	sudo apt list --installed
}




###################################################################################################
#	DOCKER-RELATED
#	source: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
###################################################################################################
function install_docker_ce() {
	sudo apt-get update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common --yes
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update
	apt-cache policy docker-ce
	sudo apt install docker-ce
	sudo systemctl status docker
	docker --version
}




###################################################################################################
#	ZIP-RELATED
###################################################################################################
function install_7zip() {
	#	ARCHIVE FILES
	#	sudo apt-get install p7zip-full --yes
	#	To uninstall
	#	sudo apt remove p7zip --yes

	# Personally, I do not like this program
}




/**************************************************************************************************
					BASH/TERMINAL-RELATED
source: https://www.howtogeek.com/howto/41418/how-to-be-more-productive-in-ubuntu-using-keyboard-shortcuts/
**************************************************************************************************/
Shift+Ctrl+T: Open a new tab. 
Shift+Ctrl+W Close the current tab. 
Ctrl+Page Up: Switch to the previous tab
