#!/bin/bash
#set -e

CONFIG_PATH=/data/options.json
MQTTIP=$(jq --raw-output ".MQTT_server" $CONFIG_PATH)
MQTTPORT=$(jq --raw-output ".MQTT_port" $CONFIG_PATH)
MQTTUSER=$(jq --raw-output ".MQTT_user" $CONFIG_PATH)
MQTTPASS=$(jq --raw-output ".MQTT_password" $CONFIG_PATH)
MQTTWAIT=$(jq --raw-output ".MQTT_wait" $CONFIG_PATH)
export SCREENLOGICIP=$(jq --raw-output ".ScreenLogic_server" $CONFIG_PATH)

cd /node_modules/node-screenlogic

node initialize.js

while [ 1 ]; do
# change IP address (-h) port (-p) username (-u) and password (-P) to match your MQTT broker settings
PAYLOAD=`mosquitto_sub -h $MQTTIP -p $MQTTPORT -u $MQTTUSER -P $MQTTPASS -v -t pentair/# -W $MQTTWAIT -C 1`
if [ $? -gt 0 ]; then
  echo "MQTT Client exited with non-zero status"
  sleep 10
else
  TOPIC=`echo $PAYLOAD | awk '{print $1}'`
  MESSAGE=`echo $PAYLOAD | awk '{print $2}'`
  CIRCUIT="$(cut -d'/' -f3 <<<"$TOPIC")"

  case $TOPIC in
    "pentair/circuit/${CIRCUIT}/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $CIRCUIT 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $CIRCUIT 0
    fi
    ;;
    "pentair/heater/spa/mode/set")
    if [ "${MESSAGE}" == "heat" ]; then
      ./set_heater 1 1
    elif [ "${MESSAGE}" == "off" ]; then
      ./set_heater 1 0
    fi
    ;;
    "pentair/heater/pool/mode/set")
    if [ "${MESSAGE}" == "heat" ]; then
      ./set_heater 0 1
    elif [ "${MESSAGE}" == "off" ]; then
      ./set_heater 0 0
    fi
    ;;
    "pentair/heater/spa/temperature/set")
    if [ 1 ]; then
      ./set_temp 1 "${MESSAGE}"
    fi
    ;;
    "pentair/heater/pool/temperature/set")
    if [ 1 ]; then
      ./set_temp 0 "${MESSAGE}"
    fi
    ;;
    "pentair/salt/pool/set")
    if [ 1 ]; then
      ./set_salt 0 "${MESSAGE}"
    fi
    ;;
    "pentair/salt/spa/set")
    if [ 1 ]; then
      ./set_salt 1 "${MESSAGE}"
    fi
    ;;
    "pentair/light/command")
    if [ 1 ]; then
      ./set_light "${MESSAGE}"
    fi
    esac
fi

# change IP address (-h) port (-p) username (-u) and password (-P) to match your MQTT broker settings
node send_state_to_ha.js $SCREENLOGICIP | awk -F, '{print "mosquitto_pub -h '"$MQTTIP"' -p '"$MQTTPORT"' -u '"$MQTTUSER"' -P '"$MQTTPASS"' -t " $1 " -m " $2}' | bash -s

done
