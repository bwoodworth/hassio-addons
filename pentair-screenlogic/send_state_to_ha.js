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
    console.log('pentair/circuit/' + status.circuitArray[0].id + '/state,' + (status.circuitArray[0].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[1].id + '/state,' + (status.circuitArray[1].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[2].id + '/state,' + (status.circuitArray[2].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[3].id + '/state,' + (status.circuitArray[3].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[4].id + '/state,' + (status.circuitArray[4].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[5].id + '/state,' + (status.circuitArray[5].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[6].id + '/state,' + (status.circuitArray[6].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[7].id + '/state,' + (status.circuitArray[7].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[8].id + '/state,' + (status.circuitArray[8].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[9].id + '/state,' + (status.circuitArray[9].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[10].id + '/state,' + (status.circuitArray[10].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[11].id + '/state,' + (status.circuitArray[11].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[12].id + '/state,' + (status.circuitArray[12].state ? 'ON' : 'OFF'));
    console.log('pentair/circuit/' + status.circuitArray[13].id + '/state,' + (status.circuitArray[13].state ? 'ON' : 'OFF'));
  }).on('chemicalData', function(chemData) {
    console.log('pentair/calcium/state,' + chemData.calcium);
    console.log('pentair/cyanuricacid/state,' + chemData.cyanuricAcid);
    console.log('pentair/alkalinity/state,' + chemData.alkalinity);
    client.close();
  });

  client.connect();
}
