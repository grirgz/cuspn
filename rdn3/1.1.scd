



)
(

Pdef(\snare_hat).play;
Pdef(\kick).play;
Pdef(\kick2).play;
)
Pdef(\violin).play;
Pdef(\snare).stop;

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

		0,0,1,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,

		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,

		0,0,0,1, 0,0,1,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,
	],inf).coin.not,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\amp, 0.8
)).play;
)

(
);

(
);
Pdef(\hat).play

Pdef(\hat).stop
Pdef(\hat2).stop
(
)
Pdef(\snare).stop
Pdef(\hat3).stop

Pdef(\snare).play
Pdef(\hat3).play
Pdef(\violin).stop
Pdef(\violin).play

/////////////////////////////////////// yobass

(
)




/////////////////////////////////////// var1


(
)

/////////////////////////////// pause
/////////////////////////////// pause
/////////////////////////////// pause
/////////////////////////////// pause

Pdef(\hat3, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/8,
	\sustain, 0.05,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\rel, Pseq([ 
		0.1,
	],inf).stutter(2),
	\amp, 0.05
)).play;

Pdef(\snare, 

	Pbind(
		\instrument, \snare,
		\degree, Pseq([0],inf),
		\dur, 1/4,
		\isRest, Pseq([
			0,0,0,0, 1,0,0,0,
			0,0,0,0, 1,0,0,0,
		],inf).coin.not,
		//\lag, 0.01,
		\amp, 0.1
	)
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0.01,0.2) ],
		],inf),
		//\env1scale, Pseq([1,1.0],inf),
		//\env2scale, Pseq([1,[0.4,0.8]],inf),
		//\lag, Pseq([0, Ptuple([0,Pwhite(0.01,0.071,1)])],inf),
	).stutter(8)

).play;

(
Pdef(\hat2, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/8,
	\sustain, 0.05,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0.81,1,0,
		0,0,1,0.8, 0,1,0,0.81,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,1,1,0.81,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 1,0,0,0,
		1,0,0,1, 0,0,1,0,
		0,0,0,0, 0,0,0,0,

		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,1, 0,0,1,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\rel, Pseq([ 
		0.1,
	],inf).stutter(2),
	\amp, 0.05
)).play;
);
/////////////////////////////////////////////////////////////////////////////////

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
Pdef(\bass).stop
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


Pdef(\kick).clear
(
);

(
);

(
Ndef(\plop, { arg freq=200, pan=0, amp=0.1;
	var sig;
	sig = LFSaw.ar(freq * SinOsc.kr(4).range(0,1));
	sig = Pan2.ar(sig, pan, amp);
}).play;
);

Pdef(\hat).clear
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
	\amp, 0.01
)).play;
);

Pdef(\hat).stop

(
);

(
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
);

(
);

(
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
);

(
Pdef(\snare2, Pbind(
	\instrument, \snare2,
	\freq, Pseq([470,480],inf).stutter(16),
	\isRest, Pseq([
		1,0,0,1,
		1,1,0,0,
	],inf).coin.not,
	\isRest, Pseq([
		Pseq([
			1,0,0,1,
			0,0,1,0,
		],3,2),
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.3
)).play;
);

(
Pdef(\plop, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).stop;
);

(
);

{ SinOsc.ar(200) ! 2 * 0.1}.play;
Pdef(\violin).clear

//////////////////////////////////////////////////

(
SynthDef(\pigeon, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env1;
	freq = [freq, freq/2];
	env1 = EnvGen.kr( Env([1,10,0.4],[0.1,2.8]), gate );
	freq = freq * ( 1 + ( SinOsc.ar(1 * env1) * 314 ));
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
	sig = LPF.ar(sig, 30 * env1) + BPF.ar(sig, [70,80,200,500,1140,799] * 2,0.4,2).mean ;
	sig = HPF.ar(sig, 80);
	//sig = CombL.ar(sig, 0.1, 1/1000) + sig;
	//sig = sig / 500;
	sig = sig * EnvGen.ar(Env.adsr(0.001,0.1,0.8,0.8,1,-2),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).flop;
	Out.ar(out, sig);
}).add;
);
