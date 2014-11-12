
(
Pdef(\fossil, Pbind(
	\instrument, \fossil1,
	\degree, Pseq([0],inf),
	\freq, Pseq([700,2020,300,3000],inf).stutter(4),
	\dur, 1/4,
	\legato, Pseq([4,0.3,0.3,0.3],inf),
	\isRest, Pseq([
		1,0,0,0,
	],inf).coin.not,
	\amp, 0.1
)).play;
);
