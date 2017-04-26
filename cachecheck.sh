#!/bin/sh
#
#
#
#Jamf Pro Extension Attribute to return the active Caching Server
#Note that the return is either a multi-line output of IPs or null if none are found
#
#
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [ "$osvers" < "12" ]; then
  result=""
else
  result=`/usr/bin/AssetCacheLocatorUtil 2>&1 | grep guid | awk '{print$4}' | sed 's/^\(.*\):.*$/\1/' | uniq`
fi

echo "<result>$result</result>"
