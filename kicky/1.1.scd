
(
SynthDef(\kick1, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env1 = \env1.kr(Env.new([100, 58, 25], [0.005, 0.29], [-4, -5]));
	
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = EnvGen.ar(env1, timeScale:timeScale);
	env1m = env1.midicps;
	
	sig = LFPulse.ar(env1m * freqpan, 0, 0.5, 1, -0.5);
	sig = sig + WhiteNoise.ar(1);
	sig = LPF.ar(sig, env1m*fratio);
	sig = sig + SinOsc.ar(env1m, 0.5);
	
	sig = sig * \distpreamp.kr(1.2);
	sig1 = sig.clip2(1);
	sig = SelectX.ar(\mix.kr(1.0), [sig, sig1]);


	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, spread, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.3
)).play;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\mix, 0,
	\dur, 1,
	\amp, 0.3
)).play;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\env0, [ Env.new([0, 1, 1.5, 0], [0.005, 0.06, 0.11], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 50, 22], [0.015, 0.49], [-4, -5]) ],
	\degree, Pseq([0],inf),
	\mix, 0,
	\dur, 1,
	\amp, 0.15
)).play;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\env0, [ Env.new([0, 1, 1.5, 0], [0.005, 0.06, 0.11], [-4, -2, -4]) ],
	\env1, [ Env.new([080, 45, 27], [0.015, 0.19], [-4, -5]) ],
	\degree, Pseq([0],inf),
	\mix, 0,
	\dur, 1,
	\amp, 0.35
)).play;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\env0, [ Env.new([0, 1, 9.5, 0], [0.015, 0.96, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 40, 30], [0.015, 0.29], [-4, -5]) ],
	\degree, Pseq([0],inf),
	\mix, 1,
	\dur, 1,
	\amp, 0.15
)).play;
);

(
Pdef(\kick1, Pbind(
	\instrument, \kick1,
	\env0, [ Env.new([0, 1, 9.5, 0], [0.015, 0.36, 0.11], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 40, 25], [0.015, 0.29], [-4, -5]) ],
	\degree, Pseq([0],inf),
	\mix, 0,
	\dur, 1,
	\amp, 0.15
)).play;
);

(
Pdef(\kick1, Pbind(
	\env0, [ Env.new([0.5, 9, 0.5, 0], [0.005, 0.16, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);

(
Pdef(\kick1, Pbind(
	\env0, [ Env.new([0.5, 9, 9.5, 0], [0.005, 0.46, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);

(
Pdef(\kick1, Pbind(
	\env0, [ Env.new([0.5, 9, 9.5, 0], [0.005, 0.46, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\isRest, Pseq([
		1,1,1,1, 1,1,1,1,
	],inf).coin.not,
	\dur, 1/2,
	\amp, 0.1
)).play;
);

(
Pdef(\kick1, Pbind(
	\env0, [ Env.new([0.5, 9, 9.5, 0], [0.005, 0.46, 0.01], [-4, -2, -4]) ],
	\env1, 
	Pseq([
		[ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
		[ Env.new([110, 53, 23], [0.015, 0.29], [-4, -5]) ],
	],inf),
	\instrument, \kick1,
	\degree, Pseq([0],inf),
	\isRest, Pseq([
		1,0,1,1, 0,0,1,1,
	],inf).coin.not,
	\dur, 1/4,
	\amp, 0.1
)).play;
);

Pdef(\kick1).stop
