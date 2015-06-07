#!/bin/bash
#=======================================================================
# File: puppetagent_v2.sh
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

# configuração do arquivo hosts
sed -i '$ a\169.54.65.91 puppet' /etc/hosts
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

# configuração do arquivo puppet.conf
sed -i '/templatedir=/a runinterval=60' /etc/puppet/puppet.conf
echo "5.1 End of Step 5.1 - Puppet runinterval: $?" >> $LOG_FILE

# configuração do arquivo puppet.conf
service puppet restart
echo "5.2 End of Step 5.2 - Puppet restart: $?" >> $LOG_FILE
puppet agent --enable
echo "5.3 End of Step 5.3 - Puppet Agent Enable: $?" >> $LOG_FILE

#=======================================================================
# End.
#=======================================================================
echo "End of Script...: $?" >> $LOG_FILE
