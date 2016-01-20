
(
SynthDef(\bass, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env1;
	freq = [freq, freq/2];
	env1 = EnvGen.kr( Env([1,10,0.4],[0.1,2.8]), gate );
	freq = freq * ( 1 + ( SinOsc.ar(1551 * env1) * 4 ));
	sig = SinOsc.ar(freq);
	sig1 = LFSaw.ar(freq);
	sig2 = LFPulse.ar(freq);
	sig3 = SinOsc.ar(freq);
	sig = SelectX.ar( EnvGen.kr(Env([0,0.5,1],[0.01,3.8]), 1), [sig1, sig2, sig3]);
	sig = RLPF.ar(sig, \lpf.kr(200), \rq.kr(0.5));
	//sig = sig.wrap2(0.3 * SinOsc.kr(1/10 * ~t).range(4,1)) * 5;
	//sig = sig.fold2(0.3 * SinOsc.kr(1/13 * ~t).range(4,1)) * 5;
	sig = (sig * 1 * env1**2).tanh;
	sig = LPF.ar(sig, 30 * env1) + BPF.ar(sig, [70,80,200,500,1140,799],0.4,2).mean ;
	sig = Ringz.ar(sig, 500) / 050 + sig  ;
	sig = sig / 1;
	sig = HPF.ar(sig, 80);
	sig = sig * EnvGen.ar(Env.adsr(0.001,0.1,0.8,0.8,1,-2),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).flop;
	Out.ar(out, sig);
}).add;
);

(
Pdef(\bass, Pbind(
	\instrument, \bass,
	\degree, Pseq([0],inf),
	\octave, 3,
	\lpf, 400,
	\sustain, Pseq([
		8,0,0,0, 0,0,0,0,
	],inf)/5 / ~t,
	\oscmix, 0.2,
	\isRest, Pseq([
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.4
)).play;
);

Pdef(\bass2).stop
(
Pdef(\bass2, Pbind(
	\instrument, \bass,
	\degree, Pseq([-3],inf),
	\octave, 3,
	\oscmix, 0,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,1,0,0, 1,0,1,0,
	],inf).coin.not,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,1, 1,1,0,1,
	],inf).coin.not,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0, // 0,0,1,0, 1,0.51,0,1,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,1, 0,0,1,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,1,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,1,0,
		0,0,1,0, 0,0.51,0,0,
		1,0,0,1, 0,0,1,0,
	],inf).coin.not,
	//\lag, 0.1,
	\dur, 1/16,
	\dur, (1 + (0.06 * Pseq([1,-1],inf).stutter(2))) / 16,
	\amp, 0.4
)).play;
);


(
Pdef(\kick, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 2,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 4,
	\amp, 0.8
)).play;
);

(
SynthDef(\hat, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = WhiteNoise.ar;
	sig = RLPF.ar(sig, \lpf.kr(11100), \rq.kr(0.5));
	sig = RHPF.ar(sig, \hpf.kr(3100), \rq.kr(0.5));
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.2,1,-4),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1),-4),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
);

(
Pdef(\hat, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\sustain, 0.05,
	\isRest, Pseq([
		1,0,1,0,
	],inf).coin.not,
	\rel, Pseq([ 
		Pseq([ 0.01, ],3), 0.1,
		Pseq([ 0.01, ],3), 0.1 + Pwhite(0.1,0.4,1),
	],inf).stutter(2),
	\dur, 1/4,
	//\dur, (1 + (0.09 * Pseq([-1,1],inf))).stutter(2) / 4,
	\amp, 0.03
)).play;
);

Pdef(\hat).stop

(
SynthDef(\hat2, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = WhiteNoise.ar;
	sig = RLPF.ar(sig, \lpf.kr(15100), \rq.kr(0.5));
	sig = RHPF.ar(sig, \hpf.kr(6100), \rq.kr(0.5));
	//sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.2,1,-4),gate,doneAction:2);
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1),-4),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
);

(
Pdef(\hat2, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/8,
	\sustain, 0.05,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,1,1,0,
		0,0,1,1, 0,1,0,1,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,1,1,1,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,1, 0,0,1,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\rel, Pseq([ 
		0.1,
	],inf).stutter(2),
	\amp, 0.03
)).play;
);


(
Pdef(\plop, Pbind(
	\instrument, \default,
	\degree, Pseq([10,1,1,1],inf),
	\sustain, 0.01,
	\dur, 1/2,
	\amp, 0.1
)).play;
);

(
Pdef(\kick, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 2,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 4,
	\amp, 0.8
)).play;
);

(
Pdef(\kick2, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 1,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,
	],inf).coin.not,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\amp, 0.8
)).play;
);
