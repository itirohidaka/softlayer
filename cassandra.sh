#!/bin/bash
#=======================================================================
# File: nodered.sh
# Description: Cassandra  2.1.9 instalation for Ubuntu 14.04
# Author: Gerson Itiro Hidaka
# Date: 12/09/2015 (dd/mm/yyy)
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
LOG_FILE=/var/log/cassandra.log
echo "1. End of Step 1 - Log Variable: $?" >> $LOG_FILE

#=======================================================================
# 2. Initial Configuration (Java and CURL)
#=======================================================================
#sudo apt-get -y update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y curl
echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
echo "2. End of Step 2 - Initial Configuration: $?" >> $LOG_FILE

#=======================================================================
# 3. Ubuntu Update
#=======================================================================
sudo apt-get -y update
echo "3. End of Linux Update: $?" >> $LOG_FILE

#=======================================================================
# 4. Cassandra Installation
#=======================================================================
sudo apt-get install -y dsc21=2.1.9-1 cassandra=2.1.9
echo "4. End of Cassandra 2.1.9 installation: $?" >> $LOG_FILE

#=======================================================================
# End.
#=======================================================================
echo "End of Script...: $?" >> $LOG_FILE
