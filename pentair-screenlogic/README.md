** Credit goes to https://github.com/krk628/hassio-screenlogic-addon for creating the initial proof of concept that htis plugin is based on

# Control Pentair Pool Circuits via Screenlogic IP and Recieve Status updates

Home Assistant addon for communicating with Pentair EasyTouch via Screenlogic IP via nodejs

## Instructions

* This addon requires a MQTT broker to pass state and commands to Screenlogic.

* Add repository to you addons and install: https://github.com/bwoodworth/hassio-addons

* Set config options:
  MQTT_server - IP address of MQTT server
  MQTT_port - MQTT server IP
  MQTT_user - MQTT server username
  MQTT_password - MQTT server password
	ScreenLogic_server - IP address of the ScreenLogic controller
  
* Add the entities from configuration-entries.yaml to the HASS configuration...use those command_topic and state_topic attributes exactly as that's what the addon is using.  Restart your Home Assistant so you see the new entities.

* You should be getting values into the sensor entities and be able to turn the configured circuits ON/OFF

