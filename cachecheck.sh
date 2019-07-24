#!/bin/sh
#
#
#
#Jamf Pro Extension Attribute to return the active Caching Server
#Note that the return is either a multi-line output of IPs or null if none are found
#
#
result=`/usr/bin/AssetCacheLocatorUtil 2>&1 | grep guid | awk '{print}' | sed 's/^\(.*\):.*$/\1/'| sort | uniq`
echo "<result>$result</result>"
