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
function npm_tutorial() {
	# see:
	# https://nodejs.dev/learn/an-introduction-to-the-npm-package-manager
	echo "Add echo statement because cannot leave function empty..."
}
function list_npm_installed_packages() {
	#	Get List of Globally Installed Packages
	#	source: https://www.dariawan.com/tutorials/javascript/npm-get-list-globally-installed-packages/
	npm list --global --depth 0
	npm list --local --depth 0
	# OR
	# npm list --global --depth 0 && npm list --local --depth 0

	# to uninstall package
	# source: https://flaviocopes.com/npm-uninstall-packages/
	# sudo npm uninstall --global <package_name>
	# OR
	# sudo npm uninstall --local <package_name>
}
function uninstall_npm_project_packages() {
	# source: https://flaviocopes.com/npm-uninstall-packages
	# !!! project-specific !!!
	# For "dependencies" section
	# npm uninstall --save <package-name>
	########## ########## ########## ########## ##########
	# For "devDependencies" section
	# npm uninstall --save-dev <package_name>
	echo "Add echo statement because cannot leave function empty..."
}
function manage_npm_packages() {
	# source: https://www.toptal.com/javascript/a-guide-to-npm-the-node-package-manager
	# !!! project-specific !!!
	npm outdated

	# !!! global scope !!!
	npm outdated --global --depth 0
	npm outdated --local --depth 0
	# OR
	# npm outdated --global --depth 0 && npm outdated --local --depth 0
}
function update_npm() {
	# source: https://www.sitepoint.com/npm-guide/
	sudo npm install --global npm@latest
}
function install_postman() {
	#	To install POSTMAN
	#	search in Ubuntu Software Store
	echo "Add echo statement because cannot leave function empty..."
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
	#	sudo apt-get autoremove p7zip --yes

	# Personally, I do not like this program
	echo "Add echo statement because cannot leave function empty..."
}




###################################################################################################
#	BASH/TERMINAL-RELATED
#	source: https://www.howtogeek.com/howto/41418/how-to-be-more-productive-in-ubuntu-using-keyboard-shortcuts/
# 	source: https://askubuntu.com/questions/470966/shortcut-to-clear-command-line-terminal
###################################################################################################
function bash_useful_keyboard_shortcuts() {
	echo "Shift+Ctrl+T:		Open a new tab."
	echo "Shift+Ctrl+W:		Close the current tab."
	echo "Ctrl+Page Up: 	Switch to the previous tab."
	echo "Ctrl+U:			clear all the current line from the end to the beginning."
	echo "Ctrl+K:			clear all the current line from the beginning to the end."

	# BASH CHEAT SHEET
	# source: https://devhints.io/bash
}
###################################################################################################
#	LINUX-RELATED
###################################################################################################
function list_linux_installed_packages() {
	#	list installed packages
	#	source: https://www.cyberciti.biz/faq/apt-get-list-packages-are-installed-on-ubuntu-linux/
	sudo apt list --installed
}
function remove_vs_autoremove() {
	# see:
	# https://superuser.com/questions/398670/when-would-you-use-apt-get-remove-over-apt-get-autoremove/668406
	echo "Remove vs Autoremove"
}
function apt_vs_apt-get() {
	# see:
	# https://itsfoss.com/apt-vs-apt-get-difference
	#	apt install	    | apt-get install       | Installs a package
	#	apt remove	    | apt-get remove	    | Removes a package
	#	apt purge	    | apt-get purge	        | Removes package with configuration
	#	apt update	    | apt-get update	    | Refreshes repository index
	#	apt upgrade	    | apt-get upgrade	    | Upgrades all upgradable packages
	#	apt autoremove	| apt-get autoremove	| Removes unwanted packages
	#	apt full-upgrade| apt-get dist-upgrade	| Upgrades packages with auto-handling of dependencies
	#	apt search	    | apt-cache search	    | Searches for the program
	#	apt show	    | apt-cache show	    | Shows package details
	echo "Apt vs Apt-Get"
}
function install_oracle_database() {
	# 	Link to download ORACLE DATABASE FOR LINUX
	# 	https://www.oracle.com/database/technologies/xe-prior-releases.html
	#	Oracle Account
	#	username:	malege9774@0335g.com
	#	password:	13579SPACExploration


	# How to install a deb file
	# source: https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt
	sudo apt install /path/to/package/name.deb


	# How to install a rpm file
	# source: https://phoenixnap.com/kb/install-rpm-packages-on-ubuntu
	sudo add-apt-repository universe
	sudo apt update
	sudo apt install alien --yes
	sudo alien --install packagename.rpm
}
function install_oracle_sql_developer() {
	# Download RPM file from:
	# https://www.oracle.com/tools/downloads/sqldev-downloads.html

	# Install RPM file

	# to launch app see:
	# source: https://dev.to/ishakantony/how-to-install-oracle-sql-developer-on-ubuntu-20-04-3jpd
	cd /opt/sqldeveloper
	sudo chmod 777 sqldeveloper.sh
	./sqldeveloper.sh
	echo "Add echo statement because cannot leave function empty..."
}




###################################################################################################
# VMWARE-RELATED
###################################################################################################
function manage_expand_virtual_disk() {
	# see:
	# https://kb.vmware.com/s/article/1004071
	# I personally recommend GPARTED
	echo "Add echo statement because cannot leave function empty..."
}




###################################################################################################
# MAIN FUNCTION
# source: https://unix.stackexchange.com/questions/550771/sourced-bash-script-each-with-main-function
###################################################################################################
main() {
	# UPDATE VS UPGRADE
	# source: https://unix.stackexchange.com/questions/361814/whats-the-difference-between-software-update-and-upgrade
	echo "================================================================================"
	echo "============================== Running Update =================================="
	echo "================================================================================"
	sudo apt update --yes

	echo "================================================================================"
	echo "============================== Running Upgrade ================================="
	echo "================================================================================"
	sudo apt upgrade --yes
}
main "$@"



