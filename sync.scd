
// as a leader:
m = MandelHub.start(\benoit, 135/60);

// as a follower:
MandelHub.join(\benoit2, action:{ |instance| m = instance });

// communicating:
m.chat("hi there");
m.shout("I said HELLO!");

TempoClock.default = m.clock;

// gui tools
m.gui;
m.shoutWindow;

// changing tempo:
m.changeTempo(280/60);       // instant change
m.changeTempo(2.5);       // instant change
m.changeTempo(120/60, 30); // changes to 2 bps in 30 seconds

// use the MandelSpace
x = m.space;

// Finish!
MandelHub.clear;

TempoClock.default.tempo
