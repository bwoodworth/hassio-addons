'use strict';

const ScreenLogic = require('./index');

var myArgs = process.argv.slice(2);

connect(new ScreenLogic.UnitConnection(80, myArgs[0]));

// generic connection method used by all above examples
function connect(client) {
  client.on('loggedIn', function() {
    this.getVersion();
  }).on('version', function(version) {
    this.getPoolStatus();
    console.log(' version=' + version.version);
  }).on('poolStatus', function(status) {
    this.getChemicalData();
    console.log(' pool ok=' + status.ok);
    console.log(' pool active=' + status.isPoolActive());
    console.log(' pool temp=' + status.currentTemp[0]);
    console.log(' pool heatStatuse=' + status.heatStatus[0]);
    console.log(' spa active=' + status.isSpaActive());
    console.log(' spa temp=' + status.currentTemp[1]);
    console.log(' spa heatStatus=' + status.heatStatus[1]);
    console.log(' salt ppm=' + status.saltPPM);
    console.log(' pH=' + status.pH);
    console.log(' saturation=' + status.saturation);
    console.log(' air temp=' + status.airTemp);
    console.log(' freezeMode=' + status.freezeMode);
    console.log(' alarms=' + status.alarms);
    console.log(' Number of circuitArray Objects=' + status.circuitArray.length);
  }).on('chemicalData', function(chemData) {
    this.getSaltCellConfig();
    console.log(' calcium=' + chemData.calcium);
    console.log(' cyanuric acid=' + chemData.cyanuricAcid);
    console.log(' alkalinity=' + chemData.alkalinity);
  }).on('saltCellConfig', function(saltCellConfig) {
    this.getControllerConfig();
    console.log(' salt cell installed=' + saltCellConfig.installed);
  }).on('controllerConfig', function(config) {
    console.log(' controller is in celsius=' + config.degC);
    console.log(' controllerId=' + config.controllerId);
    console.log(' pumpCircArray=' + config.pumpCircArray);
    console.log(' Number of bodyArray Objects=' + config.bodyArray.length);
    console.log(' bodyArray=');
    var i;
    for(i = 0; i < config.bodyArray.length; i++)
    {
      console.log('   circuitId: ' + config.bodyArray[i].circuitId);
	    console.log('     name: ' + config.bodyArray[i].name);
    }
	  client.close();
  });

  client.connect();
}
