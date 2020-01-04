'use strict';

const ScreenLogic = require('./index');

var finder = new ScreenLogic.FindUnits();
finder.on('serverFound', function(server) {
  finder.close();
  connect(new ScreenLogic.UnitConnection(server));
});

finder.search();

function connect(client) {
  client.on('loggedIn', function() {
    this.getVersion();
  }).on('version', function(version) {
    this.getPoolStatus();
  }).on('poolStatus', function(status) {
    this.getChemicalData();
    console.log('/pentair/pooltemp/state,' + status.currentTemp[0]);
    console.log('/pentair/spatemp/state,' + status.currentTemp[1]);
    console.log('/pentair/airtemp/state,' + status.airTemp);
    console.log('/pentair/saltppm/state,' + status.saltPPM);
    console.log('/pentair/ph/state,' + status.pH);
    console.log('/pentair/saturation/state,' + status.saturation);
    if (status.isSpaActive()) {
        console.log('/pentair/spa/state,ON');
    } else {
        console.log('/pentair/spa/state,OFF');
    }
    if (status.isPoolActive()) {
        console.log('/pentair/pool/state,ON');
    } else {
        console.log('/pentair/pool/state,OFF');
    }
  }).on('chemicalData', function(chemData) {
    console.log('/pentair/calcium/state,' + chemData.calcium);
    console.log('/pentair/cyanuricacid/state,' + chemData.cyanuricAcid);
    console.log('/pentair/alkalinity/state,' + chemData.alkalinity);
    client.close();
  });

  client.connect();
}
