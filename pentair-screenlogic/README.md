# pentair-screenlogic

## Screen Logic AddOn for [Home Assistant](https://www.home-assistant.io/) using the [node-screenlogic](https://github.com/parnic/node-screenlogic) library

## Instructions

* This addon requires a MQTT broker to pass state and commands to Screenlogic.

* Add repository to your addons and install: https://github.com/bwoodworth/hassio-addons

* Set config options:
  
  MQTT_server - IP address of MQTT server
  
  MQTT_port - MQTT server IP
  
  MQTT_user - MQTT server username
  
  MQTT_password - MQTT server password
  
  ScreenLogic_server - IP address of the ScreenLogic controller
  
* Add the entities from configuration-entries.yaml to the HASS configuration...use those command_topic and state_topic attributes exactly as that's what the addon is using.  Restart your Home Assistant so you see the new entities.

* You should be getting values into the sensor entities and be able to turn the configured circuits ON/OFF

** Credit goes to https://github.com/krk628/hassio-screenlogic-addon for creating the initial proof of concept that this plugin is based on

### Pentair IntelliBrite Command Information

|Command |Action                 |Description                                                       |
|--------|-----------------------|------------------------------------------------------------------|
|0       |Off                    |Turn all lights off.                                              |
|1       |On                     |Turn all lights on.                                               |
|2       |Set                    |Presets the light to a specific color.                            |
|3       |Sync                   |Switches on all  lights to synchronize their colors.              |
|4       |Swim                   |Presets the light to transition through colors in sequence.       |
|5       |Party Mode             |Rapid color changing building energy and excitement.              |
|6       |Romance Mode           |Slow color transitions creating a mesmerizing and calming effect. |
|7       |Caribbean Mode         |Transitions between a variety of blues and greens.                |
|8       |American Mode          |Patriotic red, white and blue transition.                         |
|9       |California Sunset Mode |Dramatic transitions of orange, red and magenta tones.            |
|10      |Royal Mode             |Richer, deeper color tones.                                       |
|11      |Hold                   |Save the current color effect during a color light show.          |
|12      |Recall                 |Activate the last saved color effect.                             |
|13      |Blue                   |Fixed color.                                                      |
|14      |Green                  |Fixed color.                                                      |
|15      |Red                    |Fixed color.                                                      |
|16      |White                  |Fixed color.                                                      |
|17      |Purple                 |Fixed color.                                                      |

>NOTE: The **Set** and **Swim** actions require a separate relay for each light.
