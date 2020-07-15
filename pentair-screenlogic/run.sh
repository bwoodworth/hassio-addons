#!/bin/bash
#set -e

CONFIG_PATH=/data/options.json
MQTTIP=$(jq --raw-output ".MQTT_server" $CONFIG_PATH)
MQTTPORT=$(jq --raw-output ".MQTT_port" $CONFIG_PATH)
MQTTUSER=$(jq --raw-output ".MQTT_user" $CONFIG_PATH)
MQTTPASS=$(jq --raw-output ".MQTT_password" $CONFIG_PATH)
SCREENLOGICIP=$(jq --raw-output ".ScreenLogic_server" $CONFIG_PATH)
POOLCIRCUIT=$(jq --raw-output ".pool_circuit" $CONFIG_PATH)
SPACIRCUIT=$(jq --raw-output ".spa_circuit" $CONFIG_PATH)
POOLLIGHTCIRCUIT=$(jq --raw-output ".pool_light_circuit" $CONFIG_PATH)
SPALIGHTCIRCUIT=$(jq --raw-output ".spa_light_circuit" $CONFIG_PATH)
JETSCIRCUIT=$(jq --raw-output ".jets_circuit" $CONFIG_PATH)
CLEANERCIRCUIT=$(jq --raw-output ".cleaner_circuit" $CONFIG_PATH)

cd /node_modules/node-screenlogic

node initialize.js $SCREENLOGICIP

while [ 1 ]; do
# change IP address (-h) port (-p) username (-u) and password (-P) to match your MQTT broker settings
PAYLOAD=`mosquitto_sub -h $MQTTIP -p $MQTTPORT -u $MQTTUSER -P $MQTTPASS -v -t pentair/# -W 10 -C 1`
if [ $? -gt 0 ]; then
  echo "MQTT Client exited with non-zero status"
  sleep 10
else
  TOPIC=`echo $PAYLOAD | awk '{print $1}'`
  MESSAGE=`echo $PAYLOAD | awk '{print $2}'`

  case $TOPIC in
    "pentair/circuit/500/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 500 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 500 0
    fi
    ;;
    "pentair/circuit/501/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 501 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 501 0
    fi
    ;;
    "pentair/circuit/502/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 502 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 502 0
    fi
    ;;
    "pentair/circuit/503/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 503 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 503 0
    fi
    ;;
    "pentair/circuit/504/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 504 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 504 0
    fi
    ;;
    "pentair/circuit/505/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 505 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 505 0
    fi
    ;;
    "pentair/circuit/506/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 506 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 506 0
    fi
    ;;
    "pentair/circuit/507/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 507 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 507 0
    fi
    ;;
    "pentair/circuit/508/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 508 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 508 0
    fi
    ;;
    "pentair/circuit/509/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 509 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 509 0
    fi
    ;;
    "pentair/circuit/510/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 510 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 510 0
    fi
    ;;
    "pentair/circuit/511/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 511 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 511 0
    fi
    ;;
    "pentair/circuit/512/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 512 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 512 0
    fi
    ;;
    "pentair/circuit/513/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 513 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 513 0
    fi
    ;;
    "pentair/circuit/514/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 514 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 514 0
    fi
    ;;
    "pentair/circuit/515/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 515 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 515 0
    fi
    ;;
    "pentair/circuit/516/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 516 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 516 0
    fi
    ;;
    "pentair/circuit/517/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 517 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 517 0
    fi
    ;;
    "pentair/circuit/518/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 518 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 518 0
    fi
    ;;
    "pentair/circuit/519/command")
    if [ "${MESSAGE}" == "ON" ]; then
      ./set_circuit $SCREENLOGICIP 519 1
    elif [ "${MESSAGE}" == "OFF" ]; then
      ./set_circuit $SCREENLOGICIP 519 0
    fi
    ;;
    "pentair/heater/spa/mode/set")
    if [ "${MESSAGE}" == "heat" ]; then
      ./set_heater $SCREENLOGICIP 1 1
    elif [ "${MESSAGE}" == "off" ]; then
      ./set_heater $SCREENLOGICIP 1 0
    fi
    ;;
    "pentair/heater/pool/mode/set")
    if [ "${MESSAGE}" == "heat" ]; then
      ./set_heater $SCREENLOGICIP 0 1
    elif [ "${MESSAGE}" == "off" ]; then
      ./set_heater $SCREENLOGICIP 0 0
    fi
    ;;
    "pentair/heater/spa/temperature/set")
    if [ 1 ]; then
      ./set_temp $SCREENLOGICIP 1 "${MESSAGE}"
    fi
    ;;
    "pentair/heater/pool/temperature/set")
    if [ 1 ]; then
      ./set_temp $SCREENLOGICIP 0 "${MESSAGE}"
    fi
    ;;
    "pentair/light/command")
    if [ 1 ]; then
      ./set_light $SCREENLOGICIP "${MESSAGE}"
    fi
    esac
fi

# change IP address (-h) port (-p) username (-u) and password (-P) to match your MQTT broker settings
node send_state_to_ha.js $SCREENLOGICIP | awk -F, '{print "mosquitto_pub -h '"$MQTTIP"' -p '"$MQTTPORT"' -u '"$MQTTUSER"' -P '"$MQTTPASS"' -t " $1 " -m " $2}' | bash -s

done