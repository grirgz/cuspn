Veco.load_lib("main.scd");
Veco.load_lib("synth.scd");

Veco.main.board_size = Point(32,64);
~set_default_quant.(4);
~set_project_tempo.(1);
~load_standard_quickpad.();

Veco.exec_file("rdn.scd")

// END

Veco.main.fadeout_time = 16;
TempoClock.default = TempoClock(1)
{  TempoClock.beatsPerBar = 1 }.fork
TempoClock.beatsPerBar 

TempoClock.default.beats = 0
TempoClock.default.beats 

Tempo
CmdPeriod.run
t
(
Pdef(\plop, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);

