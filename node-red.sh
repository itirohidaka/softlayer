#!/bin/bash
#=======================================================================
# File: nodered.sh
# Description: nodered instalation for CentOS
# Author: Gerson Itiro Hidaka
# Date: 25/07/2015 (dd/mm/yyy)
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
LOG_FILE=/var/log/nodered.log

#=======================================================================
# 2. Initial Configuration
#=======================================================================
sudo su -
echo "2. End of Step 2 - Initial Configuration: $?" >> $LOG_FILE

#=======================================================================
# 3. CentOS Update
#=======================================================================
apt-get -y update
echo "3. End of Linux Update: $?" >> $LOG_FILE

#=======================================================================
# 4. Pre-requisites for Node-Red (Node.js)
#=======================================================================
curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install --yes nodejs
sudo apt-get install --yes build-essential
echo "4. End of Pre-requisites installations for Node-Red: $?" >> $LOG_FILE

#=======================================================================
# 5. Node-Red Installation
#=======================================================================
sudo npm install -g node-red
echo "5. End of Node-Red installation: $?" >> $LOG_FILE

#=======================================================================
# 6. Node-Red Execution
#=======================================================================
nohup node-red &
echo "6. End of Node-Red execution: $?" >> $LOG_FILE

#=======================================================================
# End.
#=======================================================================
echo "End of Script...: $?" >> $LOG_FILE