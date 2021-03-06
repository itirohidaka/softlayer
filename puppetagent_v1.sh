#!/bin/bash
#=======================================================================
# File: puppetagent_v1.sh
# Puppet Agent Installation Script for Ubuntu Server 14.04
# Author: Gerson Itiro Hidaka
#=======================================================================

#=======================================================================
# 1. Variables
#=======================================================================
LOG_FILE=/var/log/softlayer_bootstrap.log

#=======================================================================
# 2. Initial Configuration
#=======================================================================
sudo su -
# configuração do arquivo hostname
sed -i "s/ubuntu/ubuntu_sl_01/g" /etc/hostname
hostname ubuntu_sl_01
echo "2.1 End of Step 2.1 - Initial Configuration - Hostname: $?" >> $LOG_FILE

# configuração do arquivo hosts
#sed -i "s/ubuntu/ubuntu_sl_01/g" /etc/hosts
# Substitute "127.0.0.1" with the Puppet Master IP Address
sed -i '$ a\169.54.65.91 puppet' /etc/hosts
echo "2.1 End of Step 2.1 - Initial Configuration - Hosts File: $?" >> $LOG_FILE

echo "2. End of Step 2 - Initial Configuration: $?" >> $LOG_FILE

#=======================================================================
# 3. Linux Update
#=======================================================================
apt-get -y update
echo "3. End of Linux Update: $?" >> $LOG_FILE

#=======================================================================
# 4. Pre-requisites for Puppet Agent
#=======================================================================
apt-get -y install curl
apt-get -y install openssh-server
echo "4. End of Pre-requisites installations for Puppet Agent: $?" >> $LOG_FILE

#=======================================================================
# 5. Instalação do Puppet Agent
#=======================================================================
apt-get -y install puppet
echo "4. End of Puppet Agent installation: $?" >> $LOG_FILE

#=======================================================================
# End.
#=======================================================================
echo "End of Script...: $?" >> $LOG_FILE
