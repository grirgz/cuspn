
(
SynthDef(\goro, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq);
	freq = freq * ( 1 + ( SinOsc.ar(freq * [1,1.01]) * 100 ));
	sig = LFSaw.ar(freq * [1, 1.0001]);
	sig = RLPF.ar(sig, \lpf.kr(1000), \rq.kr(0.5));
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1)),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
}).add;

SynthDef(\hsnare, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var env1;
	env1 = EnvGen.ar( Env([4,2,1],[0.01,0.8]) ,gate,doneAction:0);
	sig = SinOsc.ar(freq);
	freq = freq * ( 1 + ( SinOsc.ar(freq * [1,1.01]) * 100 ));
	sig = LFSaw.ar(freq * [1, 1.0001]);
	sig = { WhiteNoise.ar } ! 2;
	sig = RHPF.ar(sig, 1000 * env1, \rq.kr(0.5));
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1)),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
}).add;

SynthDef(\snare, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var env1;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	env1 = EnvGen.ar( Env([4,2,1],[0.01,0.8]) ,gate,doneAction:0);
	sig = SinOsc.ar(freq);
	freq = freq * ( 1 + ( SinOsc.ar(freq * [1,1.01]) * 100 ));
	sig = LFSaw.ar(freq * [1, 1.0001]);
	sig1 = { WhiteNoise.ar } ! 2;
	sig1 = RLPF.ar(sig, 1000 * env1, \rq.kr(0.5));
	sig2 = { WhiteNoise.ar } ! 2;
	sig2 = RLPF.ar(sig, 1000 * env1, \rq2.kr(0.2));
	sig = [sig1, sig2];
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1)),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
}).add;


SynthDef(\carla, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq);
	sig = WhiteNoise.ar;
	sig = BPF.ar(sig, freq, 0.3);
	sig = BPF.ar(sig, freq, 0.03);
	sig = sig * 20;
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.8),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;

SynthDef(\bob, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	sig1 = LFSaw.ar(freq);
	sig2 = LFPulse.ar(freq);
	sig3 = SinOsc.ar(freq);
	sig = SelectX.ar(\oscmix.kr(0.5)*2, [sig1, sig2, sig3]);
	sig = RLPF.ar(sig, \lpf.kr(1000), \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
);

(
	
Pdef(\hat, Pbind(
	\instrument, \goro,
	\degree, Pseq([0],inf),
	\lpf, 15000 * Pseq([1,3/4],inf).stutter(2),
	\octave, 5,
	\dur, 1/4,
	\rel, Pseq([ Pseq([
		0.1
	],6),0.4, 0.4],inf),
	\isRest, Pseq([
		1,0.51,1,0, 1,0,1,0,
		1,0,1,0.51, 1,0.4,1,0,
	],inf).coin.not,
	\amp, 0.3
));



Pdef(\kick, Pbind(
	\instrument, \dr_kick,
	\dur, 1/8,
	\isRest, Pseq([
		1,0,0,0, 0,0,0,0,
		1,0,1,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		1,0,1,0, 0,0,0,1,
		1,0,0,0, 0,0.4,0,0,
		1,0,1,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		1,0,1,0, 0,0,0,1,
	],inf).coin.not,
	\amp, 0.8
));

Pdef(\kick_v2, Pbind(
	\instrument, \dr_kick,
	\dur, 1/8,
	\isRest, Pseq([
		1,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,0.5,0,
	],inf).coin.not,
	\amp, Pkey(\amp) * Pseq([1.2,1,1,1, 1,1,1,1],inf),
	\amp, 0.8
));

Pdef(\snare, Pbind(
	\instrument, \snare,
	\dur, 1/8,
	\freq, 80,
	\lpf, 6000,
	\isRest, Pseq([
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp, 0.93
));

Pdef(\hsnare, Pbind(
	\instrument, \hsnare,
	\dur, 1/8,
	\freq, 80,
	\lpf, 6000,
	\isRest, Pseq([
		0,0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0,0,
		0,0,1,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\amp, 0.93
));

Pdef(\carla, Pbind(
	\instrument, \carla,
	\degree, Pseq([[13,10]],inf),
	\octave, 5,
	\dur, 1/4,
	\lag, Pseq([[0,0], [0.05,0], [0.03,0]],inf).stutter(16),
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,0,0,
	],inf).coin.not,
	\amp, 0.5
));

Pdef(\bob, Pbind(
	\instrument, \bob,
	\degree, Pseq([[10,13]+2-7],inf),
	\oscmix, Ndef(\boblfo1, { SinOsc.kr(1/13).range(0,1)  }),
	\dur, 1/8,
	\isRest, Pseq([
		1,0,0,0, 0,0,1,0,
		0,0,0,0, 1,1,0,0,
		0,0,1,0, 0,0,0,0,
	],inf).coin.not.stutter(4),
	\legato, Pseq([1,1,1,2],inf) * 0.1,
	\amp, 0.2
));


BufDef(\ukraine, "bruit1/07_ukraine.flac");
BufDef(\amen, "vipere/amenbreak.wav");
Pdef(\tuf, Pbind(
	\instrument, \dr_oscsampler,
	\degree, Pseq([0],inf),
	\bufnum, BufDef(\amen),
	\pos, 0.13,
	\timeScale, 9,
	\sustain, 0.01,
	\isRest, Pseq([
		0,0,0,0, 0,0,1,0,
		1,0,0,1, 1,0,1,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,1, 0,0,1,0,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.9
));

BufDef(\ukraine, "bruit1/07_ukraine.flac");
BufDef(\amen, "vipere/amenbreak.wav");
Pdef(\tar, Pbind(
	\instrument, \dr_oscsampler,
	\degree, Pseq([0],inf),
	\bufnum, BufDef(\ukraine),
	\posenv, Pseq([
		[ Env([0.1,0.112,0.14, 0.3,0.1],[0.1,0.8,0.1,0.1]) ]
	],inf),
	\pos, 0.63,
	\adsr, Pseq([
		[ Env.adsr(0.1,0.1,0.8,0.4) ],
	],inf),
	\fshift, 100,
	\freq, 1400,
	\distmix, 1,
	\distpreamp, 1000,
	\timeScale, 8,
	\levelScale, 0.1,
	\framerange, 10,
	\lpmix, 0.5,
	\ffreq, 8100,
	\sustain, 2.01,
	\isRest, 1,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.1
));

)
