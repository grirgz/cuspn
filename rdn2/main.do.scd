
TempoClock.default.tempo = ~t = 75/60
(
[
Pdef(\hat),
Pdef(\kick),
//Pdef(\kick_v2),
Pdef(\snare),
Pdef(\hsnare),
Pdef(\carla),
Pdef(\bob),
Pdef(\tuf),
Pdef(\tar),
].collect(_.play)
)

Pdef(\hat),
Pdef(\kick),
Pdef(\kick_v2),
Pdef(\snare),
Pdef(\hsnare),
Pdef(\carla),
Pdef(\bob),
Pdef(\tuf),
Pdef(\tar),

(
Pdef(\loop, Ppar([
Pdef(\hat),
//Pdef(\kick),
Pdef(\kick_v2),
Pdef(\snare),
Pdef(\hsnare),
Pdef(\carla),
//Pdef(\bob),
//Pdef(\tuf),
//Pdef(\tar),
])).play;
)

(
Pdef(\bla,  
	Pbind(\dur, 1/3, \isRest, false, )
<>
Pdef(\kick) 
).play
)

(
SynthDef(\subman, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq * [1,1.001]);
	//sig = RLPF.ar(sig, \lpf.kr(300) * SinOsc.kr(\sf.kr(2*~t)).range(\smin.kr(1),\smax.kr(4)), \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;
);

(
SynthDef(\bassman, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = LFPulse.ar(freq * [1,1.001], SinOsc.ar(100).range(0,1));
	sig = RLPF.ar(sig, \lpf.kr(300) * SinOsc.kr(\sf.kr(2*~t)).range(\smin.kr(1),\smax.kr(4)), \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;
);

(
Pdef(\bassman, PmonoArtic(\bassman,
	\degree, Pseq([0,2],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/4,
	\sf, Pseq([4,2],inf) * ~t,
	//\xamp, Pseq([1,0,1,1],inf),
	\legato, Pseq([
		3 + ( 2/4 ), 3.4,4.4,4.4,
		3 + ( 2/4 ), 3.4,4.4,0.4,

		3 + ( 2/4 ), 3.4,4.4,4.4,
		3 + ( 2/4 ), 3.4,4.4,0.4,

		3 + ( 2/4 ), 3.4,4.4,4.4,
		3 + ( 2/4 ), 3.4,4.4,1.4,

		3 + ( 2/4 ), 3.4,4.4,0.4,
		3 + ( 2/4 ), 3.4,4.4,0.4,
	],inf),
	\isRest, Pseq([
		1,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\amp, 0.8
)).play;
);

Pdef(\subman).play;
Pdef(\bassman).play;

(
Pdef(\bassman, Pbind(
	\instrument, \bassman,
	\degree, Pseq([0,2],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/1,
	\sf, Pseq([4,2],inf) * ~t,
	\xamp, Pseq([1,0,1,1],inf),
	\legato, Pseq([
		3 + ( 2/4 ),
	],inf),
	\isRest, Pseq([
		1,0,0,0, 1,0,0,0,
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp, 0.8
)).play;
);

(
Pdef(\subman, Pbind(
	\instrument, \subman,
	\degree, Pseq([0],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/4,
	\sf, Pseq([4,2],inf) * ~t,
	\xamp, Pseq([1,0,1,1],inf),
	\legato, Pseq([
		3 + ( 2/4 ),
	],inf),
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\amp, 0.8
)).play;
);

TempoClock.default.beat = 0
(
Pdef(\plop, Pbind(
	\instrument, \bip,
	\degree, Pseq([13,10,10,10],inf),

	\legato, 0.01,
	\dur, 1/2,
	\amp, 0.5
)).play;
);
Pdef.defaultQuant  = 4

(
SynthDef(\bip, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq);
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.04),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
);

(
Pdef(\plop, Pbind(
	\instrument, \bip,
	\degree, Pseq([13,10,10,10],inf),

	\legato, 0.01,
	\dur, 1/4,
	\amp, 0.5
)).play;
);
TempoClock.default.beat = 0
s.latency = 0.2

