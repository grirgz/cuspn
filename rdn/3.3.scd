
Pdef(~name +++ \pre, Pbind(
	\freq, 800,
	\legato, 0.1,
	\dur, 1/8,
));

// END

TempoClock.default.tempo = 2
TempoClock.default = TempoClock.new.tempo_(2)
TempoClock.default.beats
