#Initialise
var engine1 = engines.Turboprop.new(0, 0.2);
var engine2 = engines.Turboprop.new(1, 0.2);
var engine3 = engines.Turboprop.new(2, 0.2);
var engine4 = engines.Turboprop.new(3, 0.2);
var engine5 = engines.Turboprop.new(4, 0.2);
var engine6 = engines.Turboprop.new(5, 0.2);
var engine7 = engines.Turboprop.new(6, 0.2);
var engine8 = engines.Turboprop.new(7, 0.2);
var engine9 = engines.Turboprop.new(8, 0.2);
var engine10 = engines.Turboprop.new(9, 0.2);

engine1.init();
engine2.init();
engine3.init();
engine4.init();
engine5.init();
engine6.init();
engine7.init();
engine8.init();
engine9.init();
engine10.init();

props.globals.initNode("/sim/autostart/started", 0, "BOOL");

var eng1fuelon = func { setprop("/controls/engines/engine[0]/cutoff", 0); }
var eng2fuelon = func { setprop("/controls/engines/engine[1]/cutoff", 0); }
var eng3fuelon = func { setprop("/controls/engines/engine[2]/cutoff", 0); }
var eng4fuelon = func { setprop("/controls/engines/engine[3]/cutoff", 0); }
var eng5fuelon = func { setprop("/controls/engines/engine[4]/cutoff", 0); }
var eng6fuelon = func { setprop("/controls/engines/engine[5]/cutoff", 0); }
var eng7fuelon = func { setprop("/controls/engines/engine[6]/cutoff", 0); }
var eng8fuelon = func { setprop("/controls/engines/engine[7]/cutoff", 0); }
var eng9fuelon = func { setprop("/controls/engines/engine[8]/cutoff", 0); }
var eng10fuelon = func { setprop("/controls/engines/engine[9]/cutoff", 0); }

var eng1fueloff = func { setprop("/controls/engines/engine[0]/cutoff", 1); }
var eng2fueloff = func { setprop("/controls/engines/engine[1]/cutoff", 1); }
var eng3fueloff = func { setprop("/controls/engines/engine[2]/cutoff", 1); }
var eng4fueloff = func { setprop("/controls/engines/engine[3]/cutoff", 1); }
var eng5fueloff = func { setprop("/controls/engines/engine[4]/cutoff", 1); }
var eng6fueloff = func { setprop("/controls/engines/engine[5]/cutoff", 1); }
var eng7fueloff = func { setprop("/controls/engines/engine[6]/cutoff", 1); }
var eng8fueloff = func { setprop("/controls/engines/engine[7]/cutoff", 1); }
var eng9fueloff = func { setprop("/controls/engines/engine[8]/cutoff", 1); }
var eng10fueloff = func { setprop("/controls/engines/engine[9]/cutoff", 1); }

var eng1starter = func { setprop("/controls/engines/engine[0]/starter", 1); }
var eng2starter = func { setprop("/controls/engines/engine[1]/starter", 1); }
var eng3starter = func { setprop("/controls/engines/engine[2]/starter", 1); }
var eng4starter = func { setprop("/controls/engines/engine[3]/starter", 1); }
var eng5starter = func { setprop("/controls/engines/engine[4]/starter", 1); }
var eng6starter = func { setprop("/controls/engines/engine[5]/starter", 1); }
var eng7starter = func { setprop("/controls/engines/engine[6]/starter", 1); }
var eng8starter = func { setprop("/controls/engines/engine[7]/starter", 1); }
var eng9starter = func { setprop("/controls/engines/engine[8]/starter", 1); }
var eng10starter = func { setprop("/controls/engines/engine[9]/starter", 1); }

var eng1start = func {
  eng1fueloff();
  eng1starter();
  settimer(eng1fuelon, 2);
}

var eng2start = func {
  eng2fueloff();
  eng2starter();
  settimer(eng2fuelon, 2);
}

var eng3start = func {
  eng3fueloff();
  eng3starter();
  settimer(eng3fuelon, 2);
}

var eng4start = func {
  eng4fueloff();
  eng4starter();
  settimer(eng4fuelon, 2);
}

var eng5start = func {
  eng5fueloff();
  eng5starter();
  settimer(eng5fuelon, 2);
}

var eng6start = func {
  eng6fueloff();
  eng6starter();
  settimer(eng6fuelon, 2);
}

var eng7start = func {
  eng7fueloff();
  eng7starter();
  settimer(eng7fuelon, 2);
}

var eng8start = func {
  eng8fueloff();
  eng8starter();
  settimer(eng8fuelon, 2);
}

var eng9start = func {
  eng9fueloff();
  eng9starter();
  settimer(eng9fuelon, 2);
}

var eng10start = func {
  eng10fueloff();
  eng10starter();
  settimer(eng10fuelon, 2);
}

var engstart = func {
  settimer(eng1start, 2);
  settimer(eng2start, 30);
  settimer(eng3start, 60);
  settimer(eng4start, 90);
  settimer(eng5start, 120);
  settimer(eng6start, 150);
  settimer(eng7start, 180);
  settimer(eng8start, 210);
  settimer(eng9start, 240);
  settimer(eng10start, 270);
}

var engstop = func {
  eng1fueloff();
  eng2fueloff();
  eng3fueloff();
  eng4fueloff();
  eng5fueloff();
  eng6fueloff();
  eng7fueloff();
  eng8fueloff();
  eng9fueloff();
  eng10fueloff();
}

var autostart = func {
  var startstatus = getprop("/sim/autostart/started");
  if ( startstatus == 0 ) {
    gui.popupTip("Autostarting...");
    setprop("/sim/model/autostart", 1);
    setprop("/sim/autostart/started", 1);
    setprop("/controls/electric/battery-switch", 1);
    settimer(engstart, 0.4);
    gui.popupTip("Starting Engines");
  }
  if ( startstatus == 1 ) {
    gui.popupTip("Shutting Down...");
    setprop("/sim/model/autostart", 0);
    setprop("/sim/autostart/started", 0);
    setprop("/controls/engines/engine[0]/throttle", 0);
    setprop("/controls/engines/engine[1]/throttle", 0);
    setprop("/controls/engines/engine[2]/throttle", 0);
    setprop("/controls/engines/engine[3]/throttle", 0);
    setprop("/controls/engines/engine[4]/throttle", 0);
    setprop("/controls/engines/engine[5]/throttle", 0);
    setprop("/controls/engines/engine[6]/throttle", 0);
    setprop("/controls/engines/engine[7]/throttle", 0);
    setprop("/controls/engines/engine[8]/throttle", 0);
    setprop("/controls/engines/engine[9]/throttle", 0);
    eng1fueloff();
    eng2fueloff();
    eng3fueloff();
    eng4fueloff();
    eng5fueloff();
    eng6fueloff();
    eng7fueloff();
    eng8fueloff();
    eng9fueloff();
    eng10fueloff();
  }
}

var autostop = func {
   engstop();
}
