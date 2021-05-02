#!/bin/bash

HDHR={INSERT YOUR HDHR IP HERE}
FILE=/tmp/hdhr.json #Feel free to choose a different location for the temp file
ZABX={INSERT YOUR ZABBIX SERVER/PROXY IP HERE}
ZNAM={INSERT YOUR HDHR HOSTNAME AS IT APPEARS IN ZABBIX HERE}

wget http://$HDHR/status.json -O $FILE

T0CH=$(cat $FILE | jq '.[0].VctNumber')
if [ $T0CH != "null" ] ; then
		T0SS=$(cat $FILE | jq '.[0].SignalStrengthPercent')
		T0SQ=$(cat $FILE | jq '.[0].SignalQualityPercent')
		T0SY=$(cat $FILE | jq '.[0].SymbolQualityPercent')
		T0NR=$(cat $FILE | jq '.[0].NetworkRate')
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner0.channel" -o "$T0CH"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner0.sigstr" -o "$T0SS"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner0.sigqual" -o "$T0SQ"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner0.symqual" -o "$T0SY"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner0.bandw" -o "$T0NR"
	fi

T1CH=$(cat $FILE | jq '.[1].VctNumber')
if [ $T1CH != "null" ] ; then
		T1SS=$(cat $FILE | jq '.[1].SignalStrengthPercent')
		T1SQ=$(cat $FILE | jq '.[1].SignalQualityPercent')
		T1SY=$(cat $FILE | jq '.[1].SymbolQualityPercent')
		T1NR=$(cat $FILE | jq '.[1].NetworkRate')
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner1.channel" -o "$T1CH"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner1.sigstr" -o "$T1SS"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner1.sigqual" -o "$T1SQ"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner1.symqual" -o "$T1SY"
		/usr/bin/zabbix_sender -vv -z "$ZABX" -s "$ZNAM" -k "hdhr.tuner1.bandw" -o "$T1NR"
	fi
