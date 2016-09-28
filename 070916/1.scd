
(
Pdef(\plop, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1/2,
	\legator, 0.1,
	\amp, 0.1
)).play;
);

(
	Pdef(\yep1, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,1,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\bkick)).play;
	Pdef(\yep2, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
)

// part 0
(
	Pdef(\yep1, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\bkick)).play;
	Pdef(\yep2, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0.5,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
)

// part 1
(
	Pdef(\yep1, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\bkick)).play;
	Pdef(\yep2, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
Ndef(\rdn1).play;
Ndef(\rdn2).play;
)

// part 2
(
	Pdef(\yep1, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,1, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,1, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\bkick)).play;
	Pdef(\yep2, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
	Pdef(\yep3, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,1,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0, 1,0, 0,0, 0,0,
		0,0, 0,0, 1,0, 1,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/4, \amp, 0.051)	<>Pdef(\hat)).play;
Ndef(\rdn1).play;
Ndef(\rdn2).play;
)
		Pdef(\yep).quant

Pdef(\yep1).stop
Pdef(\yep2).stop
		
Ndef(\rdn1).edit;
Ndef(\rdn2).edit;
Ndef.defaultQuant = 4;
Pdef.defaultQuant = 4;
