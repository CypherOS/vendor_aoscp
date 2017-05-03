#!/bin/bash

while read -r device || [[ -n $device ]]
do
    add_lunch_combo "aoscp_$device-userdebug"
done < vendor/aoscp/aoscp.devices
