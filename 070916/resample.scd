
(
Ndef(\fx1).play;
Pdef(\recorder, Ppar([
	Pbind(
		\instrument, \recorder,
		\bufnum, BufDef(\smp2, s.sampleRate * 16),
		\inbus, BusDef(\rec, \audio),
		\inbus, Ndef(\fx1).bus,
		\dur, Pseq([16],1),
		\amp, 0.1
	),

])).play
)

Pdef(\recorder).quant = 4

(
Pdef(\smpdrum1, Ppar([
	Pbind(
		\instrument, \playerbeat,
		\bufnum, BufDef(\smp1),
		\isRest, Pseq([
			1,0,0,1, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\legato, 2,
		\dur, 1/8,
		\amp, 0.2
	),
	Pbind(
		\instrument, \playerbeat,
		\bufnum, BufDef(\smp1),
		\isRest, Pseq([
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\legato, 4,
		\pos, 3,
		\dur, 1/8,
		\amp, 0.2
	),
])).play

)