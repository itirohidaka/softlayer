#!/bin/bash
#=======================================================================
# File: rails.sh
# Description: rails instalation for Ubuntu 14.04
# Author: Gerson Itiro Hidaka
# Date: 26/07/2015 (dd/mm/yyy)
#==============================================================================
# Disclaimer
# Be aware that all scripts are run at your own risk and while every script has
# been written with the intention of minimising the potential for unintended
# consequences, the owners, hosting providers and contributers cannot be held
# responsible for any misuse or script problems.
#==============================================================================

#=======================================================================
# 1. Variables
#=======================================================================
LOG_FILE=/var/log/rails.log
echo "1. End of Step 1 - Log Variable: $?" >> $LOG_FILE

#=======================================================================
# 2. Initial Configuration
#=======================================================================
#sudo su -
echo "2. End of Step 2 - Initial Configuration: $?" >> $LOG_FILE

#=======================================================================
# 3. Ubuntu Update
#=======================================================================
sudo apt-get -y update
echo "3. End of Linux Update: $?" >> $LOG_FILE

#=======================================================================
# 4. Pre-requisites for Rails
#=======================================================================
# MySQL Pre-requisites
#sudo apt-get install mysql-server mysql-client libmysqlclient-dev
sudo apt-get install libmysqlclient-dev
# CURL installation
sudo apt-get -y install curl
# Node.js installation
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install --yes nodejs
# RVM installation
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
echo "4. End of Pre-requisites installations for Rails: $?" >> $LOG_FILE

#=======================================================================
# 5. Rails installation
#=======================================================================
gem install rails
echo "5. End of Rails installation: $?" >> $LOG_FILE

#=======================================================================
# End.
#=======================================================================
echo "End of Script...: $?" >> $LOG_FILE
