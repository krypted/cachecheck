#!/bin/sh
#
#
#
#Jamf Pro Extension Attribute used to return the active Caching Server(s) found by a Mac
#Note that the return is either a multi-line output of IPs or null if none are found
#Note - each server is listed once whether it caches iCloud data or just shared assets
#
#

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [ "$osvers" -lt "12" ]; then
  result=""
else
  result=`/usr/bin/AssetCacheLocatorUtil 2>&1 | grep guid | awk '{print$4}' | sed 's/^\(.*\):.*$/\1/' | sort | uniq`
fi

echo "<result>$result</result>"
