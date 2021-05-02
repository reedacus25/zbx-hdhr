# Zabbix HDHomeRun Scraper

This is a super simple bash script that pulls data from an HDHomeRun Tuner on your network, and puts the signal strength, quality, and bandwidth, for an active stream into Zabbix.

It only reports data if there is an active stream, if there isn't an active stream, it skips sending the data.

This script was tested against a 2 tuner HDHR, but should be able to be tweaked for more/different tuners.

You will need to create a host for your HDHR in Zabbix, and assign the template to the host in Zabbix to receive the traps.
You will need to edit the script to change the values for the Zabbix Server, Zabbix Hostname, HDHDR IP address.
Set this up in cron at whatever interval you please.
