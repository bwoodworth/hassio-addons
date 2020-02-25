'use strict';

const ScreenLogic = require('./index');

var myArgs = process.argv.slice(2);

connect(new ScreenLogic.UnitConnection(80, myArgs[0]));

function connect(client) {
  client.on('loggedIn', function() {
    this.getVersion();
  }).on('version', function(version) {
    this.getPoolStatus();
  }).on('poolStatus', function(status) {
    this.getChemicalData();
    console.log('pentair/pooltemp/state,' + status.currentTemp[0]);
    console.log('pentair/spatemp/state,' + status.currentTemp[1]);
    console.log('pentair/airtemp/state,' + status.airTemp);
    console.log('pentair/saltppm/state,' + status.saltPPM);
    console.log('pentair/ph/state,' + status.pH);
    console.log('pentair/saturation/state,' + status.saturation);
    var i;
    for(i = 0; i < config.bodyArray.length; i++)
    {
      console.log('pentair/circuit/' + status.circuitArray[i].id + '/state,' + (status.circuitArray[i].state ? 'ON' : 'OFF'));
    }
  }).on('chemicalData', function(chemData) {
    console.log('pentair/calcium/state,' + chemData.calcium);
    console.log('pentair/cyanuricacid/state,' + chemData.cyanuricAcid);
    console.log('pentair/alkalinity/state,' + chemData.alkalinity);
    client.close();
  });

  client.connect();
}
