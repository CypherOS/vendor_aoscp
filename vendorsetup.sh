for device in $(cat vendor/aoscp/aoscp.devices)
do
add_lunch_combo aoscp_$device-userdebug
done
