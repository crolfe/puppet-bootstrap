#!/bin/bash

 ########################################################################################################
# Written by: Colin Rolfe (@colin_rolfe)                                                                 # 
#                                                                                                        #
# This script bootstraps a new Ubuntu 12.04 server with latest Puppet from Puppet Labs's apt source.     #
# You almost certainly want to run this with sudo, otherwise it's going to fail with errors.             #
#                                                                                                        #
# Note: one side effect of this script that may not be desireable is it will also upgrade your packages. #
#  If this is something you don't want, comment that bit out.                                            #
#                                                                                                        #
# v0.1 - Initial version (11/11/2013)                                                                    #
 ########################################################################################################   

 ############
# Parameters #
 ############


 ###########
# Variables #
 ###########

ubuntuVersion="precise"
echo "Installing the ${ubuntuVersion} version of the Puppet Labs apt sources..."

# Download Puppet Labs apt sources and install Puppet
wget http://apt.puppetlabs.com/puppetlabs-release-${ubuntuVersion}.deb
dpkg -i puppetlabs-release-precise.deb
rm puppetlabs-release-${ubuntuVersion}.deb

# Update apt
apt-get update

# Finally, install puppet
apt-get --assume-yes install puppet

echo "Installed Puppet version `puppet -V`"
