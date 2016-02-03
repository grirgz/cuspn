
(
Pdef(\snare, Pbind(
	\instrument, \snare,
	\dur, 1/8,
	\freq, 20,
	\lpf, 13300,
	\isRest, Pseq([
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp, 0.93
)).play;
);


Pdef(\snare).stop
