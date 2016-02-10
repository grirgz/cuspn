

TempoClock.default.tempo = 70/60;
Pdef.defaultQuant = 4;
Ndef.defaultQuant = 4;

(

SynthDef(\dr_kick1, { |out=0, amp=0.1, pan=0, fratio=1.5, freqpan=0.01, spread=0.08, timeScale=1|
	var env0, env1, env1m, son;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.105, 0.16, 00.2], [-4, -2, -4]));
	env1 = \env1.kr(Env.new([110, 32, 29], [0.105, 0.29], [-4, -5]));

	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = EnvGen.ar(env1, timeScale:timeScale);
	env1m = env1.midicps;

	son = LFPulse.ar(env1m * freqpan, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, env1m*fratio, env0);
	son = son + SinOsc.ar(env1m, 0.5, env0);

	//son = son * 1.2;
	//son = son.clip2(1);

	son = son * amp;
	son = Splay.ar(son, spread, amp, pan);

	OffsetOut.ar(out, son);
}, metadata:(specs:(
	env0: EnvSpec( ControlSpec(0,9,\lin)!4, ControlSpec(0,2,\lin)!4 ),
	env1: EnvSpec( ControlSpec(0,127,\lin)!3, ControlSpec(0,2,\lin)!3 ),
	timeScale: ControlSpec(0.001,4,\lin, 0, 1),
))).store;
SynthDef(\bass, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env1;
	//freq = [freq, freq/2];
	freq = freq ! 2;
	env1 = EnvGen.kr( Env([1,10,0.4],[0.1,2.8]), gate );
	sig = SinOsc.ar(freq);
	sig = (sig * 1).tanh;
	//sig1 = LFSaw.ar(freq);
	//sig2 = LFPulse.ar(freq);
	//sig3 = SinOsc.ar(freq);
	//sig = sig3;
	//sig = SelectX.ar( EnvGen.kr(Env([0,0.5,1],[0.01,3.8]), 1), [sig1, sig2, sig3]);
	//sig4 = SelectX.ar( EnvGen.kr(Env([1,0.5,1],[1.41,3.8]), 1), [sig1, sig2, sig3]);
	//sig = RLPF.ar(sig, \lpf.kr(200), \rq.kr(0.5));
	//sig = sig.wrap2(0.3 * SinOsc.kr(1/10 * ~t).range(4,1)) * 5;
	//sig = sig.fold2(0.3 * SinOsc.kr(1/13 * ~t).range(4,1)) * 5;
	//sig = (sig * 1 * env1**2).tanh;
	//sig = sig + ( sig * BPF.ar(LFSaw.ar(freq), 400) );
	//sig = LPF.ar(sig, 130 * env1) + BPF.ar(sig, [70,80,200,500,1140,799] / 2,0.4,2).mean ;
	//sig = HPF.ar(sig, 80);
	//sig = CombL.ar(sig, 0.1, 1/1000) + sig;
	//sig = sig / 500;
	sig = sig * EnvGen.ar(Env.adsr(0.001,0.1,0.8,0.1,1,-2),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).flop;
	Out.ar(out, sig);
}).add;

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

SynthDef(\violin, { arg out=0, amp=0.1, gate=1, pan=0, freq=200, velocity=0.5, doneAction=2;
	var sig;
	var env1, env2, env3, env4, env5, env6, env7, env8;

	var xfreq = [1/4,1/2,1,2,4];
	var lfo1, lfo2, lfo3, lfo4, lfo5, lfo6, lfo7, lfo8;
	var ifreq;
	//freq.poll;
	//sig = WhiteNoise.ar(1!2);
	//sig = LFNoise1.ar(10000!4 * Rand(1/100,1) * Rand(1,1.1!4));
	sig = LFNoise1.ar(10000!2  * SinOsc.kr(2).range(2,1));
	sig = CombL.ar(sig, 0.1, 1/freq,1.51) + sig;
	//sig = sig.wrap2(1.8)*1 + sig;
	sig = CombL.ar(sig, 0.1, 1/freq,0.19) + sig;
	//sig = SinOsc.ar(freq ! 2);
	//sig = CombL.ar(sig, 0.1, 1/freq,1) + sig;
	//sig = CombL.ar(sig, 0.1, 1/freq + [[1,2,3]*100],1) + sig;
	//sig = RLPF.ar(sig, 9000, \rq.kr(0.5));
	sig = sig/10;
	sig = sig * EnvGen.kr(\adsr.kr(Env.adsr(0.8,0.4,0.31,0.9,1,4)), gate, doneAction:doneAction, timeScale:\timeScale.kr(1/2));
	//sig = sig * EnvGen.kr(\adsr.kr(Env.adsr(0.8,0.4,0.31,0.1,1,4)), Trig1.kr(\itrig.tr(1), 1), doneAction:0, timeScale:\timeScale.kr(1/2));
	sig = Pan2.ar(sig, SinOsc.kr((1..sig.size)/10, { Rand(0,2) } ! sig.size) * 0.4, amp).flop;
	sig.debug("sig");
	Out.ar(out, sig);
}).add;

SynthDef(\sfsq,{arg freq =30, amp=0.1;
	var env = EnvGen.ar(Env.perc(\at.kr(1.5),\rel.kr(1)),doneAction:2);
	var sig = WhiteNoise.ar(1);
	sig = CombL.ar(sig,0.1,1/freq,1)+sig;
	sig = CombL.ar(sig,0.1,[1/freq,1/freq+0.5]+10,2)+sig;
	sig = RLPF.ar(sig,1000+SinOsc.kr(35/60,0,200));
	//sig = Compander.ar(sig,SoundIn.ar(2),0.6,0.3,0.0001,0.001,2,2);
	sig = sig * amp;
	Out.ar(0,sig*env);
}).add;

);

FreqScope.new

(

////////////////////////////////// kick

Pdef(\kick, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([80, 30, 22], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 2,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 4,
	\amp, 0.5
));

Pdef(\kick2, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		//[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
		[ Env.new([80, 30, 22], [0.055, 0.29], [-4, -5]) ],
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
	\amp, 0.5
));

Pdef(\kick2_var2, Pbind(
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
	\amp, 0.5
));

////////////////////////////////// snare_hat

Pdef(\snare_hat_noreg,
	Ppar([

		Pbind(
			\instrument, \hat,
			\degree, Pseq([0],inf),
			\dur, 1/8,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
			\amp, 0.05,
			//\amp, 0,
		),

		Pbind(
			\instrument, \snare,
			\degree, Pseq([0],inf),
			\dur, 1/4,
			//\lag, 0.01,
			\amp, 0.1/3,
			\degree, Pseq([0],inf),
			\dur, 1/8,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
		)
	])
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0.01,0.2) ],
		],inf),
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
			0,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,1,0,
			0,0,0,0, 0,0,0,0,

			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,1, 0,0,1,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		//\env1scale, Pseq([1,1.0],inf),
		//\env2scale, Pseq([1,[0.4,0.8]],inf),
		//\lag, Pseq([0, Ptuple([0,Pwhite(0.01,0.071,1)])],inf),
	).stutter(2)

);

Pdef(\snare_hat,
	Ppar([

		Pbind(
			\instrument, \hat,
			\degree, Pseq([0],inf),
			\dur, 1/8,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
			\amp, 0.05,
			//\amp, 0,
		),

		Pbind(
			\instrument, \snare,
			\degree, Pseq([0],inf),
			\dur, 1/4,
			//\lag, 0.01,
			\amp, 0.1/3,
			\degree, Pseq([0],inf),
			\dur, 1/8,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
		)
	])
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0.01,0.2) ],
		],inf),
		\isRest, Pseq([
			0,0,0,0, 0,0,0,0,
			1,0,1,1, 0,0,1,0,
			0,0,1,1, 0,0,1,1,
			1,0,0,0, 0,0,0,0,

			0,0,0,0, 0,0,0,0,
			1,0,1,1, 0,0,1,0,
			0,1,1,0, 0,1,1,1,
			1,0,0,0, 0,0,0,0,

			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,1,
			0,0,1,0, 0,1,0,0,
			1,0,0,0, 0,0,0,0,

			//0,0,0,0, 0,0,0,0,
			//0,0,0,0, 0,0,0,0,
			//0,1,1,1, 0,1,1,1,
			//0,0,0,1, 0,0,1,0,
			//Pn(1,inf),

			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,1,1, 0,1,1,0,
			1,0,0,0, 0,0,0,0,


		],inf).coin.not,
		//\env1scale, Pseq([1,1.0],inf),
		//\env2scale, Pseq([1,[0.4,0.8]],inf),
		//\lag, Pseq([0, Ptuple([0,Pwhite(0.01,0.071,1)])],inf),
	).stutter(2)

);

////////////////////////////////// violin

Pdef(\violin, Pbind(
	\instrument, \violin,
	\degree, [0,2,4],
	//\degree, 0,
	\ctranspose, Pseq([
		//-4,-5,-2,-4,
		//0,3,1,5,
		0,3,1,-3,
	],inf),
	\scale, Scale.minor,
	\octave, Prand([6],inf),
	\legato, 1/4,
	\lag, Ptuple([Pwhite(0,0.1,inf),0,Pwhite(0,0.1,inf)]),
	\dur, 2,
	\timeScale, Pkey(\dur),
	\amp, 0.1
));

Pdef(\violin2, Pbind(
	\instrument, \violin,
	\degree, [0,2,4],
	\mtranspose, Pseq([
		//-4,-5,-2,-4,
		0,\r,\r,0,
		0,\r,0,\r,
		\r,\r,\r,\r,
		\r,\r,\r,\r,
	],inf),
	\scale, Scale.minor,
	\octave, Prand([6],inf),
	\legato, 1/4,
	\legato, Pseq([
		1,\r,\r,1,
		1,\r,4,\r,
		\r,\r,\r,\r,
		\r,\r,\r,\r,

	],inf)/4,
	\lag, Ptuple([Pwhite(0,0.1,inf),0,Pwhite(0,0.1,inf)]),
	\dur, 1/4,
	\timeScale, Pkey(\dur),
	\timeScale, Pseq([
		1,\r,\r,1,
		1,\r,4,\r,
		\r,\r,\r,\r,
		\r,\r,\r,\r,

	],inf)/8,
	\amp, 0.1/2
));

////////////////////////////////// yobass

Pdef(\yobass,Pbind(
	\instrument,\sfsq,\octave,3,\degree,0,\ctranspose,Pseq([0],inf),\note,Pseq([0,1],inf),\dur,4,\scale,Scale.minor,\isRest,Pseq([1],inf).coin.not,
	\amp, 0.1/1.5;
));


Pdef(\yobass2,Pbind(\instrument,\sfsq,\octave,3,\degree,0,\ctranspose,Pseq([0],inf),\note,Pseq([1,0],inf),\dur,8,\scale,Scale.minor,\isRest,Pseq([1],inf).coin.not));

Pdef(\yobass_var2,Pbind(
	\instrument,
	\sfsq,
	\octave,3,
	\ctranspose,Pseq([3],inf),
	\note,Pseq([0,0,1,1],inf).stutter(2),
	\dur,1,
	\legato, 0.3,
	\rel, 1.5,
	\at, 0.1,
	\isRest, Pseq([
		1,0,0,0, 1,0,1,1,
		1,0,0,0, 0,0,1,1,

		1,0,0,0, 0,0,1,0,
		1,0,0,0, 0,0,1,1,
	],inf).coin.not,
	\scale,Scale.minor,
	//\isRest,Pseq([1],inf).coin.not
));

)


/////////////////////// part2

Pdef(\violin, Pbind(
	\instrument, \violin,
	\degree, [0,2,4],
	//\degree, 0,
	\ctranspose, Pseq([
		//-4,-5,-2,-4,
		//0,3,1,5,
		0,3,1,-3,
	],inf),
	\scale, Scale.minor,
	\octave, Prand([6],inf),
	\legato, 1/4,
	\lag, Ptuple([Pwhite(0,0.1,inf),0,Pwhite(0,0.1,inf)]),
	\dur, 2,
	\timeScale, Pkey(\dur),
	\amp, 0.1
));

(
Pdef(\hat3, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/8,
	\sustain, 0.05,
	\isRest, Pseq([
		0,0,1,0, 1,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,1,0, 1,0,1,0,
		1,1,1,0, 1,1,1,1,
	],inf).coin.not,
	\rel, Pseq([
		0.1,0.4, 0.1, 0.1,
		0.1, 0.1, 0.1, 0.1,
	],inf).stutter(2),
	\amp, 0.05
)).play;
)

(
Pdef(\kicku, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).stop;
);
