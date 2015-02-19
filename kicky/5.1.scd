
(
SynthDef(\kick5, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.12], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Env.new([800, 70, 20.5, 20], [0.005, 0.16, 00.12], [-4, -2, -4]);
	env1 = EnvGen.ar(env1,1,doneAction:0, levelScale:[1,2,3,4]/2+1);
	
	sig = SinOsc.ar(env1);

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	Out.ar(out, sig);
}).add;
);

(
SynthDef(\kick5, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.10, 00.02], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Env.new([2800, 20, 20.5, 20], [0.005, 0.16, 00.12], [-4, -2, -4]);
	env1 = EnvGen.ar(env1,1,doneAction:0, levelScale:[1,2,3,4]/2+1);
	
	sig = SinOsc.ar(env1);
	sig = sig + SinOsc.ar(70 * env0);

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	Out.ar(out, sig);
}).add;
);

(
Pdef(\kick5, Pbind(
	\lprq, 0.8,
	\instrument, \kick5,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.3
)).play;
);

