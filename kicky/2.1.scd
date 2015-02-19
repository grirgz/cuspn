
(
SynthDef(\kick2, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, son;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env1 = \env1.kr(Env.new([100, 58, 25], [0.005, 0.29], [-4, -5]));
	
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = EnvGen.ar(env1, timeScale:timeScale);
	env1m = env1.midicps;
	
	son = SinOsc.ar(env1m * freqpan, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, fratio);
	son = son + SinOsc.ar(env1m, 0.5);
	
	son = son * 1.2;
	son = son + DelayL.ar(son,0.1,0.000001 * [1,2,3,4,100] );
	son = son * SinOsc.ar(10);

	son = son * amp;
	son = son * env0;
	son = Splay.ar(son, spread, amp, pan);
	
	OffsetOut.ar(out, son);
}).add;
);

(
Pdef(\kick2, Pbind(
	\instrument, \kick2,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.4
)).play;
);

(
Pdef(\kick2, Pbind(
	\env0, [ Env.new([0.5, 9, 0.5, 0], [0.005, 0.16, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
	\instrument, \kick2,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);

