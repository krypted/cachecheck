#!/bin/sh
#
#
#
#Jamf Pro Extension Attribute used to return the active Caching Server(s) found by a Mac
#Note that the return is either a multi-line output of IPs or null if none are found
#Note - each server is listed once whether it caches iCloud data or just shared assets
#
#
$
result=`/usr/bin/AssetCacheLocatorUtil 2>&1 | grep guid | awk '{print$4}' | sed 's/^\(.*\):.*$/\1/' | sort | uniq`
echo "<result>$result</result>"
