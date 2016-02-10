s.meter;


(


SynthDef(\dr_kick, { |out=0, amp=0.1, pan=0, fratio=1.5, freqpan=0.01, spread=0.08, timeScale=1|
	var env0, env1, env1m, son;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 0.6, 1, 0], [0.0001, 0.05, 0.01], [-4, -2, -4]));
	env1 = \env1.kr(Env.new([70, 25, 22], [0.085, 0.29], [-4, -5]));

	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = EnvGen.ar(env1, timeScale:timeScale);
	env1m = env1.midicps;

	son = LFPulse.ar(env1m * freqpan, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, env1m*fratio, env0);
	son = son + SinOsc.ar(env1m, 0.5, env0);

	son = son * amp;
	son = Splay.ar(son, spread, amp, pan);

	OffsetOut.ar(out, son);
},).add;

SynthDef(\goro, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = SinOsc.ar(freq);
	freq = freq * ( 1 + ( SinOsc.ar(freq * [1,1.01]) * 100 ));
	sig = LFSaw.ar(freq * [1, 1.0001]);
	sig = RHPF.ar(sig, \lpf.kr(1000), \rq.kr(0.5));
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.01)),gate,doneAction:2);
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
	Out.ar(10, sig);
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
	sig2 = sig2 + Mix.ar(BPF.ar(sig,[127,430],[0.5,0.5])*0.1);

	sig2 = RLPF.ar(sig, 1000 * env1, \rq2.kr(0.2));
	sig = [sig1, sig2];
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0,\rel.kr(0.05)),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
	Out.ar(10, sig);
}).add;

SynthDef(\hsnare2, { arg out=0,tu=1, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var env = EnvGen.ar(Env.perc(0.01,1));
	var enf = EnvGen.ar(Env([600,177,230],[0.01,0.01],-4));
	sig = SinOsc.ar(tu*enf+127,0,0.5)*env;
	sig = WhiteNoise.ar+sig;
	sig = RHPF.ar(sig, \hpf.kr(170)*tu, \rq.kr(0.5));
	sig = sig + Mix.ar(BPF.ar(sig,[127,430],[0.5,0.5])*0.1);
	sig = RLPF.ar(sig, \lpf.kr(11100)*tu, \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1),-4),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
	Out.ar(10, sig);
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
	\lpf, 10000 * Pseq([1,3/4],inf).stutter(4),
	\octave, 5,
	\dur, 1/8,
	\rel, Pseq([ Pseq([
		0.1
	],6),0.05, 0.02],inf),
	\isRest, Pseq([
		1,0.51,1,0, 1,0,1,0,
		1,0,1,0.51, 1,0.4,1,0,
	],inf).coin.not,
	\amp, Pseq([0.3,0.1],inf)
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
	\amp, 0.7
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
	\freq, 180,
	\lpf, 1000,
	\isRest, Pseq([
		0,0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0,0,
		0,0,1,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\amp, 0.83
));

Pdef(\hsnare,Ppar([ Pbind(
	\instrument, \hsnare,
	\dur, 1/8,
	\freq, 80,
	\lpf, 6000,
	\isRest, Pseq([
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp, 0.83
),
Pbind(
	\instrument,\hsnare2,
	\dur,1/8,
	\isRest, Pseq([
		0,0,0,0, 1,0,0,0,
	],inf).coin.not,
	\amp,0.15,
)])
);

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


)

s.makeGui;