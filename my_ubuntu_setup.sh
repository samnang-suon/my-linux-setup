#!/bin/bash

function update_ubuntu() {
	echo "================================================================================"
	echo "============================== UPDATE UBUNTU ==================================="
	echo "================================================================================"
	sudo apt update --yes &&
	sudo apt upgrade --yes &&
	sudo apt autoremove --yes
}


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

	# Try to open a connection

	# To protect ourself from the following error
	# An AppArmor policy prevents this sender from sending this message to this recipient;
	# type="method_call", sender=":1.125" (uid=1000 pid=7944 comm="/snap/mysql-workbench-community/5/usr/bin/mysql- wo"
	# label="snap.mysql-workbench-community.mysql-workbench- community (enforce)")
	# interface="org.freedesktop.Secret.Service" member="OpenSession” error name="(unset)"
	# requested_reply="0" destination=":1.13" (uid=1000 pid=2044 comm="/usr/bin/gnome-
	# keyring-daemon –daemonize –login" label="unconfined")
	# source: https://askubuntu.com/questions/1144497/how-to-disable-apparmor-for-mysql
	# source: https://superuser.com/questions/282115/how-to-restart-mysql
	# sudo /etc/init.d/mysql stop
	# sudo ln -s /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/
	# sudo apparmor_parser -R /etc/apparmor.d/usr.sbin.mysqld
	# sudo /etc/init.d/mysql restart
	# sudo /etc/init.d/mysql status
	# BEST SOLUTION
	# source: https://itectec.com/ubuntu/ubuntu-cannot-connect-mysql-workbench-to-mysql-server/
	sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

	# Retry to open a connection

	# To protect ourself from the following error
	# Access denied for user 'root'@'localhost'
	SELECT user,authentication_string,plugin,host FROM mysql.user;
	ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
	FLUSH PRIVILEGES;
	exit;
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

	# If the above shows
	# Empty set (0.00 sec)
	# Change root authentication_string from 'auth_socket' to 'mysql_native_password'
	# source: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
	SELECT user,authentication_string,plugin,host FROM mysql.user;
	ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
	FLUSH PRIVILEGES;
	exit;
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
function configure_git() {
	git config --global user.email "samnang.suon.1@ens.etsmtl.ca"
	git config --global user.name "samnang-suon"
	git config --list --global
}





###################################################################################################
#	NODEJS-RELATED
#	For more info: https://docs.npmjs.com/cli/v6/commands
###################################################################################################
function install_nodejs_npm() {
    sudo apt install nodejs --yes
    node --version
	sudo apt install npm --yes
    npm --version
}
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
	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing DOCKER ==============================="
	echo "================================================================================"
	sudo apt install apt-transport-https ca-certificates curl software-properties-common --yes
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update
	apt-cache policy docker-ce
	sudo apt install docker-ce
	# sudo systemctl status docker
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




###################################################################################################
#	ORACLE-RELATED
###################################################################################################
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


	# To protect ourself from the following error
	# /bin/chown: invalid user: 'oracle:dba'
	##### Create new user
	sudo adduser oracle
	##### Create new group
	sudo groupadd dba
	##### Add user to DBA group
	sudo usermod -a -G dba oracle
	# solution from: http://sampig.github.io/tutorial/2019/06/17/install-oracle-express-in-ubuntu
	# solution from: https://www.cyberciti.biz/faq/create-a-user-account-on-ubuntu-linux/
	# solution from: https://technorattle.wordpress.com/2011/09/06/binchown-invalid-user-oracledba-error-while-reinstalling-oracle-xe-on-ubuntu/


	# To protect ourself from the following error:
	# /bin/chmod: cannot access '/u01/app/oracle/oradata': No such file or directory
	# /bin/chmod: cannot access '/u01/app/oracle/diag': No such file or directory
	sudo mkdir /u01/app/oracle/oradata
	sudo mkdir /u01/app/oracle/diag


	# Configure Oracle
	sudo chmod 777 /etc/init.d/oracle-xe
	sudo /etc/init.d/oracle-xe configure


	# Run service
	sudo service oracle-xe start


	# To reconfigure Oracle XE in case you made a mistake
	# ERROR: ORA-12162: TNS:net service name is incorrectly specified
	# OR
	# Oracle Database 11g Express Edition is already configured
	sudo rm -rf /etc/default/oracle-xe
	# then
	sudo /etc/init.d/oracle-xe configure
	# solution from: https://stackoverflow.com/questions/5433118/how-to-reconfigure-oracle-10g-xe-on-linux
}
function install_oracle_sql_plus() {
	# Download RPM files:
	# 1. Basic Light Package (RPM)
	# 2. SQL*Plus Package (RPM)
	# from:
	# https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html

	cd ~/Download
	sudo mkdir /opt/oracle
	sudo mv *instantclient* /opt/oracle
	cd /opt/oracle
	sudo alien --install basic-client.rpm
	sudo alien --install sql-plus.rpm


	# Create tnsnames.ora
	# source: https://mkyong.com/jdbc/ora-12505-tnslistener-does-not-currently-know-of-sid-given-in-connect-descriptor/
	# source: https://www.ibm.com/support/knowledgecenter/en/SSBNJ7_1.4.1/oracle/ttnpm_ora_createtnsnamesorafile.html
	cd /usr/lib/oracle/19.9/client64/lib/network/admin
	sudo touch tnsnames.ora
	copy-paste the config from website
	save the changes


	# To protect ourself from the following error:
	# sqlplus: error while loading shared libraries: libsqlplus.so: cannot open shared object file: No such file or directory
	# source: https://askubuntu.com/questions/420395/sqlplus-error-while-loading-shared-libraries-libsqlplus-so-cannot-open-shared
	ls /usr/lib/oracle
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/oracle/19.9/client64/bin:/usr/lib/oracle/19.9/client64/lib
	# Replace '19.9' with your version


	# Create database users
	# source: https://stackoverflow.com/questions/18192521/ora-12505-tnslistener-does-not-currently-know-of-sid-given-in-connect-descript
	# sqlplus system/system-password@XE
	# source: https://chartio.com/resources/tutorials/how-to-fix-ora-12505-tns-listener-does-not-currently-know-of-sid-given-in-connect-descriptor/
	sqlplus username/password@host:port:SID
	create user USERNAME identified by PASSWORD;
	alter database open resetlogs;
	grant connect, resource to USERNAME;
	exit;

}
function install_oracle_sql_developer() {
	# Download RPM file from:
	# https://www.oracle.com/tools/downloads/sqldev-downloads.html

	# Install RPM file

	# to launch app see:
	# source: https://dev.to/ishakantony/how-to-install-oracle-sql-developer-on-ubuntu-20-04-3jpd
	# source: https://mariadb.com/kb/en/oracle-xe-112-and-mariadb-101-integration-on-ubuntu-1404-and-debian-systems/
	export ORACLE_SID=xe
	cd /opt/sqldeveloper
	sudo chmod 777 sqldeveloper.sh
	./sqldeveloper.sh
	echo "Add echo statement because cannot leave function empty..."
}
function uninstall_oracle() {
	sudo apt autoremove oracle-instantclient19.9-basiclite --yes
	sudo apt autoremove oracle-instantclient19.9-sqlplus --yes
	sudo apt autoremove oracle-xe --yes
	sudo apt autoremove sqldeveloper --yes
	sudo rm -rf /u01
	sudo rm -rf /opt/oracle

	# to list all users:
	# cat /etc/passwd
	# OR
	# ls /home

	# delete oracle user
	# source: https://www.digitalocean.com/community/tutorials/how-to-add-and-delete-users-on-ubuntu-18-04
	sudo deluser oracle
	sudo rm -rf /home/oracle
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
# AUDIO-VIDEO-RELATED
###################################################################################################
function install_vlc() {
	# source: https://www.videolan.org/vlc/download-ubuntu.html
	printf "\n\n"
	echo "================================================================================"
	echo "============================== INSTALL VLC ====================================="
	echo "================================================================================"
	sudo snap install vlc
}




function list_software_versions() {
	printf "\n\n"
	echo "================================================================================"
	echo "============================== SOFTWARE VERSIONS ==============================="
	echo "================================================================================"
	printf "\n\n>>> JAVA:\n"
	java --version
	printf "\n\n>>> GIT:\n"
	git --version
	printf "\n\n>>> NODE:\n"
	node --version
	printf "\n\n>>> NPM:\n"
    npm --version
    printf "\n\n>>> DOCKER:\n"
    docker --version
}


function update_ubuntu() {
	# UPDATE VS UPGRADE
	# source: https://unix.stackexchange.com/questions/361814/whats-the-difference-between-software-update-and-upgrade
	echo "================================================================================"
	echo "============================== UPDATE UBUNTU ==================================="
	echo "================================================================================"
	sudo apt update --yes &&
	sudo apt upgrade --yes &&
	sudo apt autoremove --yes
}


###################################################################################################
# MAIN FUNCTION
# source: https://unix.stackexchange.com/questions/550771/sourced-bash-script-each-with-main-function
###################################################################################################
main() {
	update_ubuntu


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing JAVA ================================="
	echo "================================================================================"
	sudo apt install default-jdk --yes


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing GIT =================================="
	echo "================================================================================"
	sudo apt install git --yes


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing NODE_JS =============================="
	echo "================================================================================"
	sudo apt install nodejs --yes
	sudo apt install npm --yes


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing INTELLIJ ============================="
	echo "================================================================================"
	sudo snap install intellij-idea-community --classic


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing WEBSTORM ============================="
	echo "================================================================================"
	sudo snap install webstorm --classic


	printf "\n\n"
	echo "================================================================================"
	echo "============================== Installing MYSQL ================================"
	echo "================================================================================"
	sudo apt install mysql-server --yes


	install_docker_ce
	list_software_versions


	printf "\n\n"
	echo "================================================================================"
	echo "============================== YOUR UBUNTU VERSION ============================="
	echo "================================================================================"
	lsb_release -a
}
main "$@"
