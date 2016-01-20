
(
Pdef(~name +++ \pre, Pbind(
	\env0, [ Env.new([0.0, 1, 0.1, 0], [0.005, 0.16, 0.1], [-4, -2, 4]) ],
	\env1, Pfunc({
		[ Env.new([110, 46, 28+3.rand], [0.015, 0.19], [-4, -5]) ]
	}),
	//\env3, [ Env.new([1.0, 2, 1.5, 0], [0.005, 0.016, 0.04], [-4, -2, -4]) ],
	\env3, Env([0, 0, 0.5, 0], [0.005, 0.016, 00.011], [-4, -2, -4]),
	\timeScale, 1,

	\freqpan, 0.001,
	\oscmix, 0.71261261261261,
	\osc2mix, 0.1,
	\fratio1, 0.772042493417,
	\fratio2, 0.8249932448162,
	\fratio2, Pseq([0.1,2],inf),
	\fratio1, 
	Prand([
		Pseq([1,1,1,1],1),
		Pseq([1,Pwhite(0.1,0.8,1),0.5,1],1),
	],inf),
	\amp, Pkey(\amp) * 1.72,
	\amp, Pkey(\amp) * Pseq([ 1+0.2,1,1,1, 1+0.1,1,1,1, ] - 0.2,inf),
	\distlim, 1.4,
	\distmix, 0.0,
	\pan, Pseq([
		Pser([0],17),
		Pwhite(-1.0,1.0,16-1)
	],inf).stutter(1) * 0.5,
	\spread, 0.1,
	\fratio, Pseq([
		0.21,0.52,
		0.21,0.72,
		0.31,0.52,
		0.11,0.72,
	],inf).stutter(8),
	\fratio, 1/2,
	\dur, 1/8,
	//\isRest, Veco(~namex).isrest(16),
	
	\isRest, Pseq([
		Pser([
			1,0,0,0,
			//0,1,0,0, 1,0,0,0, 
		],inf),
	],inf).coin.not,
	\isRest, Veco(~namex).isrest(16),
	\isRest, Pseq([
		Pser([
			1,0,0,0.3, 0,0,0.6,0, 1,0.1,1,0.3, 0,0,0,0, 
		],inf),
	],inf).coin.not,
));
)
// END

Pdef(\hey).edit
Sdef()

[0.6]
[110,53,29].midicps

Ndef(~name+++\mixer).get(\amp)
{ SinOsc.ar(200) ! 2 * 0.1}.play;