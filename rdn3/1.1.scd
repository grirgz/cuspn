
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
	sig4 = SelectX.ar( EnvGen.kr(Env([1,0.5,1],[1.41,3.8]), 1), [sig1, sig2, sig3]);
	sig = RLPF.ar(sig, \lpf.kr(200), \rq.kr(0.5));
	//sig = sig.wrap2(0.3 * SinOsc.kr(1/10 * ~t).range(4,1)) * 5;
	//sig = sig.fold2(0.3 * SinOsc.kr(1/13 * ~t).range(4,1)) * 5;
	//sig = (sig * 1 * env1**2).tanh;
	sig = sig + ( sig * BPF.ar(LFSaw.ar(freq), 400) );
	sig = LPF.ar(sig, 30 * env1) + BPF.ar(sig, [70,80,200,500,1140,799],0.4,2).mean ;
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
)).stop;
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

(
SynthDef(\snare, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var env1, env2, env3, env4, env5, env6, env7, env8;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	sig = SinOsc.ar(freq);
	sig = WhiteNoise.ar;
	env1 = EnvGen.kr(Env([4000,4400,1700],[0.04,0.7],-4), 1) * \env1scale.kr(1);
	sig1 = RLPF.ar(sig, env1 , \rq.kr(0.5) * [1,0.5]) * [1,0.7];
	env2 = EnvGen.kr(Env([1000,4400,1700],[0.01,0.7],-4), 1) * \env2scale.kr(1);
	sig2 = RLPF.ar(sig, env2 , \rq.kr(0.5) * [1,0.5]) * [1,0.7];
	sig = [sig1, sig2];
	//sig = [FreqShift.ar(sig, -220) , sig];
	sig = DelayL.ar(sig, 0.1, [ 1/8000, 1/7000 ]) + sig;
	sig = DelayL.ar(sig, 0.1, [ 1/8000, 1/7000 ] * 4.11) + sig;
	sig = 4.collect { arg x;
		var isig = DelayL.ar(sig, 0.1,0.01 * ( x/40 )) + sig;
		isig = DelayL.ar(isig, 0.1, [ 1/8000, 1/7000 ] * 0.98 * ( x/10 )) + sig;
	};
	sig = sig.mean;
	sig.debug("sig");
	sig = sig * EnvGen.ar(\env.kr(Env.perc(0.01,0.2,1)),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
}).add;
);

(
Pdef(\snare, 

	Pbind(
		\instrument, \snare,
		\degree, Pseq([0],inf),
		\dur, 1/4,
		\isRest, Pseq([
			0,0,0,0, 1,0,0,0,
		],inf).coin.not,
		\amp, 0.2
	)
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0.01,0.2) ],
			[
				[ Env.perc(0.01,0.4) ],
				[ Env.perc(0.02,0.4) ]
			]
		],inf),
		\env1scale, Pseq([1,1.0],inf),
		\env2scale, Pseq([1,[0.4,0.8]],inf),
		\lag, Pseq([0, Ptuple([0,Pwhite(0.01,0.071,1)])],inf),
	).stutter(8)

).play;
);


(
SynthDef(\snare2, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env1, env2, env3, env4, env5, env6, env7, env8;
	var fmf;
	sig1 = WhiteNoise.ar;
	env1 = EnvGen.kr(Env([freq,freq*2,4541],[0.01,0.08]), 1);
	sig1 = BPF.ar(sig1, env1);
	sig2 = WhiteNoise.ar;
	env2 = EnvGen.kr(Env([freq,freq*2,8541],[0.04,0.08]), 1);
	sig2 = BPF.ar(sig2, env2);

	fmf = freq * [1,1/4];
	env3 = EnvGen.kr(Env([1,2,1],[0.1,0.8]), 1);
	sig3 = SinOsc.ar(fmf * ( 1 + ( SinOsc.ar(fmf * 8/10) * env3 )));
	sig = [sig1, sig2];
	sig = sig * EnvGen.kr(Env.perc(0.0001,0.02), gate);
	sig = sig + sig3;
	//sig = [sig1, sig2] * 2;
	sig = DelayL.ar(sig, 0.1, [ 1/8000, 1/7000 ] * 1744.11) + sig;
	sig = sig * EnvGen.kr(Env.perc(0.0001,0.2), gate, doneAction:2);
	sig = Pan2.ar(sig, pan, amp).mean;
	Out.ar(out, sig);
}).add;
);

(
Pdef(\snare2, Pbind(
	\instrument, \snare2,
	\freq, Pseq([100,200,170,120],inf),
	\isRest, Pseq([
		1,0,0,1,
		1,1,0,0,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.8
)).play;
);

(
Pdef(\plop, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);
