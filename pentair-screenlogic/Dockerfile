ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add npm jq mosquitto-clients && npm install node-screenlogic smart-buffer

COPY run.sh /
COPY set_circuit /node_modules/node-screenlogic/
COPY set_temp /node_modules/node-screenlogic/
COPY set_heater /node_modules/node-screenlogic/
COPY set_light /node_modules/node-screenlogic/
COPY send_state_to_ha.js /node_modules/node-screenlogic/
COPY initialize.js /node_modules/node-screenlogic/

RUN chmod a+x /node_modules/node-screenlogic/*
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
