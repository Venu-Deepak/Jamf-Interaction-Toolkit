#!/bin/bash

jamfBinary="/usr/local/jamf/bin/jamf"

# uex_inventory_update_agent

# Wiat until only the UEX agents are running then run a recon
otherJamfprocess=`ps aux | grep jamf | grep -v grep | grep -v launchDaemon | grep -v jamfAgent | grep -v uexrestartagent | grep -v uex_inventory_update_agent | grep -v uexlogoutagent`
while [[ $otherJamfprocess != "" ]] ; do 
	sleep 15
	otherJamfprocess=`ps aux | grep jamf | grep -v grep | grep -v launchDaemon | grep -v jamfAgent | grep -v uexrestartagent | grep -v uex_inventory_update_agent | grep -v uexlogoutagent`
done

$jamfBinary recon

exit 0

##########################################################################################
##									Version History										##
##########################################################################################
# 
# Oct 24, 2018 	v4.0	--DR--	All Change logs are available now in the release notes on GITHUB