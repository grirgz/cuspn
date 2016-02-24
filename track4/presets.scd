
(

TempoClock.default.tempo = 70/60;
~t = TempoClock.default.tempo;
Pdef.defaultQuant = 4;
//Ndef.defaultQuant = 4;


Spec.add(\fb, ControlSpec(0.0001,0.9,\exp));
Spec.add(\lpf, \freq.asSpec);
Spec.add(\hpf, \freq.asSpec);
Spec.add(\plpf, \freq.asSpec);
Spec.add(\phpf, \freq.asSpec);
Spec.add(\prelpf, \freq.asSpec);
Spec.add(\prehpf, \freq.asSpec);
Spec.add(\delay2, \delay.asSpec);
Spec.add(\shift, ControlSpec(-5,5,\lin));
Spec.add(\shift2, \shift.asSpec);
Spec.add(\pitchmix, \unipolar.asSpec);
Spec.add(\pitchlag, ControlSpec(0.001,1,\exp));

Spec.add(\wet10, \unipolar.asSpec);
Spec.add(\wet20, \unipolar.asSpec);

SynthDef(\dr_kick1, { |out=0, amp=0.1, pan=0, fratio=1.5, freqpan=0.01, spread=0.08, timeScale=1|
	var env0, env1, env1m, son;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0, 0.16, 00.2], [-4, -2, -4]));
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
	env1 = EnvGen.kr( Env([1,10,0.4],[0.1,2.8]), gate );
	sig = LFSaw.ar(freq)*LFSaw.ar(freq+700,0,0.01,0.6);
	sig = CombC.ar(sig,0.1,0.01,1);
	sig = (sig * 1);
	sig = sig * EnvGen.ar(Env.adsr(0.001,0.1,0.8,0.1,1,-2),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;

SynthDef(\hat, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = WhiteNoise.ar;
	sig = RLPF.ar(sig, \lpf.kr(15100), \rq.kr(0.5));
	sig = RHPF.ar(sig, \hpf.kr(10000), \rq.kr(0.5));
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
	env1 = EnvGen.kr(Env([4000,14400,10700],[0.04,1],-4), 1) * \env1scale.kr(1);
	sig1 = RHPF.ar(sig, env1 , \rq.kr(0.5) * [1,0.5]) * [1,0.7];
	env2 = EnvGen.kr(Env([1000,1440,1070],[0.01,1],-4), 1) * \env2scale.kr(1);
	sig2 = RHPF.ar(sig, env2 , \rq.kr(0.5) * [1,0.5]) * [1,0.7];
	sig = [sig1, sig2];
	//sig = [FreqShift.ar(sig, -220) , sig];
	sig = DelayL.ar(sig, 0.1, [ 1/8000, 1/7000 ]) + sig;
	sig = DelayL.ar(sig, 0.1, [ 1/8000, 1/7000 ] * 4.11) + sig;
	sig = 4.collect { arg x;
		var isig = DelayL.ar(sig, 0.1,0.01 * ( x/40 )) + sig;
		isig = DelayL.ar(isig, 0.1, [ 1/800, 1/700 ] * 0.98 * ( x/10 )) + sig;
	};
	sig = sig.mean;
	sig.debug("sig");
	sig = sig * EnvGen.ar(\env.kr(Env.perc(0.01,2,1)),gate,doneAction:2);
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

s.volume = -8;


Pdef(\kick2, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([120, 31, 31], [0.001 , 0.029,1], [-4, -5]) ]
	,	[ Env.new([120, 30, 32], [0.001 , 0.029,1], [-4, -5]) ],
		[ Env.new([120, 30, 31.4], [0.001 , 0.029,1], [-4, -5]) ]

	],inf),
	\timeScale, 1,
	\isRest, Pseq([
		1,0,0,1,0,0,1,0,
		0,1,0,0,1,0,1,0,
	],inf).coin.not,
	\fratio, 0.2,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\amp, 1
)).play;
Pdef(\bass, Pbind(
	\instrument, \bass,
	\degree, Pseq([0],inf),
	\octave, 2,
	\sustain, Pseq([
		4,0,0,0, 0,0,0,0,
	],inf)/5 / ~t,
	\oscmix, 0.2,
	\isRest, Pseq([
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.1
)).play;


s.meter;



Pdef(\hat, Pbind(
	\instrument, \hat,
	\sustain, 0.05,
	\isRest, Pseq([
		1,0,1,0,
	],inf).coin.not,
	\rel, 0.05,
	\dur, 1/8,
	//\dur, (1 + (0.09 * Pseq([-1,1],inf))).stutter(2) / 4,
	\amp, 0.01
)).play;
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
	\dur, 1/16,
	\dur, (1 + (0.06 * Pseq([1,-1],inf).stutter(2))) / 16,
	\amp, 0.4
)).play;

Pdef(\snare,
	Pbind(
		\instrument, \snare,
		\degree, Pseq([0],inf),
		\dur, 1/4,
		\isRest, Pseq([
			0,0,0,0, 1,0,0,0,
			0,0,0,0, 1,0,0,0,
			0,0,0,0, 1,0,0,0,
			0,1,0,0, 1,0,0,0,
		],inf).coin.not,
		\amp, Pkey(\amp) * 0.1
	)
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0.01,2) ],
		],inf),
		\env1scale, 2,
		\env2scale, 2,
		\lag, Pseq([0,0.1],inf),
	).stutter(8)
).play;

)
 5-NDNC-MPQ4
Ndef(\fx1).ed
Ndef(\fx1).asParamGroup.getPbindCompileString
RandDelayNetwork(\default).make(\fx1, "5--", BusDef(\fx1, \audio)).play;
(
RandDelayNetwork(\default).make(\fx1, "5-3JV8-T84", BusDef(\fx1, \audio)).play;
Pdef(\main,
	Ppar([




		Pdef(\hat),
			Pdef(\snare),
		Pdef(\bass),
Pdef(\kick2),


			Pdef(\bass2),




	])
).play
)
Ndef(\fx1).put(100, nil)
(
RandDelayNetwork(\default).make(\fx1, "5-NDNC-MPQ4", BusDef(\fx1, \audio)).play;
Ndef(\fx1).put(100, \pset ->

	Pbind(

	'wet10', 0.648744,
	'pitchlag', 0.023900,
	'delay', 0.308240,
	'delay2', 0.045248,
	'shift', 2.999469,
	'shift2', 1.000000,
	'distamp', 0.057121,
	'prelpf', 17000,
	'prehpf', 17,
	'fb', 0.000571,
	'lpf', 17000,
	'hpf', 17,
	'pitchmix', 0.025000,
	'plpf', 17000,
	'phpf', 17,
	'poamp', 0.904966,
	'wet20', 1.000000,
	'mamp', 0.935596,
)
)
)



(
RandDelayNetwork(\default).make(\fx1, "5-3JV8-T84", BusDef(\fx1, \audio)).play;

Ndef(\fx1).put(100, \pset ->

Pbind(
	'inbus', Bus('audio', 20, 2, s),
	'wet10', 1.000000,
	'pitchlag', 1.000000,
	'delay', 0.041901,
	'delay2', 0.037825,
	'shift', -0.611111,
	'shift2', 1.277778,
	'distamp', 0.050000,
	'prelpf', 17000,
	'prehpf', 48.346310,
	'fb', 0.012851,
	'lpf', 17000,
	'hpf', 261.635495,
	'pitchmix', 0.000000,
	'plpf', 10023.744673,
	'phpf', 20.000000,
	'poamp', 2.456456,
	'wet20', 1.000000,
	'mamp', 1.142414,
)
)
)