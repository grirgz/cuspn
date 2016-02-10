
Pdef.defaultQuant  = 8;
Pdef.defaultQuant  = 2;
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

SynthDef(\bassman, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = LFPulse.ar(freq * [1,1.001], SinOsc.ar(100).range(0,1));
	//sig = RLPF.ar(sig, \lpf.kr(300) * SinOsc.kr(\sf.kr(2*~t)).range(\smin.kr(1),\smax.kr(4)), \rq.kr(0.5));
	sig = RLPF.ar(sig, \lpf.kr(300));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;

/*
(
SynthDef(\bassman_lfo, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = LFPulse.ar(freq * [1,1.001], SinOsc.ar(100).range(0,1));
	sig = RLPF.ar(sig, \lpf.kr(300) * SinOsc.kr(\sf.kr(2*~t) * XLine.kr(1,14,1.3)).range(\smin.kr(1),\smax.kr(4)), \rq.kr(0.5));
	//sig = RLPF.ar(sig, \lpf.kr(300));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;
);
*/


SynthDef(\bassman_lfo, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	sig = LFPulse.ar(freq * [1,1.001], SinOsc.ar(100).range(0,1));
	sig = RLPF.ar(sig, \lpf.kr(1300) * SinOsc.kr(\sf.kr(2*~t)).range(\smin.kr(1),\smax.kr(4)), \rq.kr(0.5));
	//sig = BRF.ar(sig, freq* [1/2,1,2,3], 0.7).mean;
	//sig = BRF.ar(sig, [400,320, 250, 175, 600, 700], 1).mean;
	sig1 = LPF.ar(sig, 1320);
	sig1 = HPF.ar(sig1, 135);
	sig = sig - sig1;
	//sig = RLPF.ar(sig, \lpf.kr(300));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;
);

(
SynthDef(\bassman_lfo2, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sigx;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var lfo1, lfo2, lfo3, lfo4, lfo5, lfo6, lfo7, lfo8;
	var input;
freq.poll;
	sig = LFPulse.ar(freq / 2, SinOsc.ar(10).range(0,1));
	sig = LFSaw.ar(freq ! 2) + sig;
	sigx = sig;
	lfo1 = SinOsc.kr(\sf.kr(2*~t) * XLine.kr(1,1,1.3)).range(\smin.kr(1),\smax.kr(8));
	sig = RLPF.ar(sig, \lpf.kr(100) * lfo1, \rq.kr(0.5));
	sig = sig + RLPF.ar(sig, 140 * SinOsc.kr(1).range(\smin2.kr(1),\smax2.kr(8)), \rq2.kr(0.15));
	sig2 = HPF.ar(sigx, 1000 * lfo1);
	sig2 = LPF.ar(sigx, 2000 * lfo1);
	sig = sig + sig2;
	sig1 = LPF.ar(sig, 1500);
	sig1 = HPF.ar(sig1, 135);
	sig = sig - sig1;
	sig = sig * EnvGen.ar(Env.adsr(0.1,0.1,0.4,1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	sig = \xamp.kr(1) * sig;
	Out.ar(out, sig);
}).add;

Pdef(\bassman, PmonoArtic(\bassman,
	\degree, Pseq([0,2],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/4,
	\sf, Pseq([2],inf).stutter(4) * ~t,
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

Pdef(\bassman_lfo, Pbind(
	\instrument, \bassman_lfo,
	\degree, Pseq([-4],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/2,
	\smax, 5.7,
	\sf, Pseq([2],inf) * ~t,
	\xamp, Pseq([1,0,1,1],inf),
	\legato, Pseq([
		//3 + ( 2/4 ),
		2,
	],inf),
	\isRest, Pseq([
		1,0,0,0, 1,0,0,0,
		1,0,0,0, 0,0,1,0,
	],inf).coin.not,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,1,0,
	],inf).coin.not,
	\amp, 0.8
)).play;

Pdef(\bassman_wo, Pbind(
	\instrument, \bassman_lfo2,
	\degree, Pseq([0,0],inf).stutter(4),
	\scale, Scale.minor,
	\octave, 3,
	\dur, 1/4,
	\sf, Pseq([2.4],inf) * ~t,
	\xamp, Pseq([1],inf),
	\legato, Pseq([
		3 + ( 2/4 ),
	],inf),
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp, 0.2
)).play;

Pdef(\subman, Pbind(
	\instrument, \subman,
	\degree, Pseq([-1],inf).stutter(4),
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
Pdef(\subman).stop;
Pdef(\bassman).play;
Pdef(\bassman_wo).stop;
Pdef(\bassman_lfo).stop;
Pdef(\bassman).stop;
Pdef(\plop, Pbind(
	\instrument, \bip,
	\degree, Pseq([13,10,10,10],inf),

	\legato, 0.01,
	\dur, 1/2,
	\amp, 0.5
)).play;
SynthDef(\bip, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq);
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.04),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
Pdef(\plop, Pbind(
	\instrument, \bip,
	\degree, Pseq([13,10,10,10],inf),

	\legato, 0.01,
	\dur, 1/4,
	\amp, 0.5
)).play;

);
Pdef(\subman).stop

TempoClock.default.beat = 0

TempoClock.default.beat = 0
s.latency = 0.2

