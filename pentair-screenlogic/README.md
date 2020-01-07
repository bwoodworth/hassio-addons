# Talk and Control Pentair Pool Circuits via Screenlogic IP

home assistant addon for communicating with Pentair EasyTouch via Screenlogic IP via nodejs

## Instructions

* This addon requires a MQTT broker to pass state and commands to Screenlogic.  So install one.

* Add the entities from configuration-entries.yaml to the HASS configuration...use those command_topic and state_topic attributes exactly as that's what the addon is using.  Restart your Home Assistant so you see the new entities.

* Add repository to you addons: https://github.com/bwoodworth/hassio-addons

* You should be getting state into those entities and be able to turn the Pool and Spa ON/OFF

