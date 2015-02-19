
(
SynthDef(\kick4, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.42], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Line.ar(1,0,0.4);
	env2 = \env2.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env2 = EnvGen.ar(env2,1,doneAction:0);
	
	sig2 = LFSaw.ar(env1.linlin(1,0,80,20) * (1 + LFSaw.ar(500 * env1)));
	sig2 = sig2 * env2 / 44;
	sig1 = Decay.ar(Impulse.ar(1), 0.87) * LFNoise2.ar(450);
	sig1 = sig1 + (0.2* sig2 );
	sig = sig1;
	sig = sig * 35;
	sig = RLPF.ar(sig, \lpftab.kr([60,50,40,80]),\lprq.kr(0.1));
	sig = HPF.ar(sig,80);
	sig = (sig < 1) * sig;
	sig = RLPF.ar(sig, 1200);
	//sig = sig.tanh;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, spread, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
SynthDef(\kick4, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.42], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Line.ar(1,0,0.4);
	env2 = \env2.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env2 = EnvGen.ar(env2,1,doneAction:0);
	
	sig2 = LFSaw.ar(env1.linlin(1,0,80,20) * (1 + LFSaw.ar(500 * env1)));
	sig2 = sig2 * env2 / 44;
	sig1 = Decay.ar(Impulse.ar(1), 0.87) * LFNoise2.ar(9450);
	sig1 = sig1 + (0.2* sig2 );
	sig = sig1;
	sig = sig * 35;
	sig = RLPF.ar(sig, \lpftab.kr(( 80!4 )),1);
	sig = HPF.ar(sig,80);
	//sig = sig.tanh;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, spread, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
SynthDef(\kick4, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.42], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Line.ar(1,0,0.4);
	env2 = \env2.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env2 = EnvGen.ar(env2,1,doneAction:0);
	
	sig2 = LFSaw.ar(env1.linlin(1,0,80,20) * (1 + LFSaw.ar(500 * env1)));
	sig2 = sig2 * env2 / 44;
	sig1 = Decay.ar(Impulse.ar(1), 0.87) * LFNoise2.ar(9450);
	sig1 = sig1 + (0.2* sig2 );
	sig = sig1;
	sig = sig * 05;
	sig = RLPF.ar(sig, env1*800,1);
	sig = HPF.ar(sig,80);
	//sig = sig.tanh;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, spread, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
SynthDef(\kick4, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.42], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Line.ar(1,0,0.1);
	env2 = \env2.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env2 = EnvGen.ar(env2,1,doneAction:0);
	
	sig2 = LFSaw.ar(env1.linlin(1,0,80,20) * (1 + LFSaw.ar(500 * env1)));
	sig2 = sig2 * env2 / 44;
	sig1 = Decay.ar(Impulse.ar(1), 0.87) * LFNoise2.ar(450);
	sig1 = sig1 + (0.2* sig2 );
	sig = sig1;
	sig = sig * 05;
	sig = RLPF.ar(sig, env1.linlin(1,0,100,60),0.7);
	sig = HPF.ar(sig,80);
	//sig = sig.tanh;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, spread, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
SynthDef(\kick4, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.46, 00.42], [-4, -2, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = Line.ar(1,0,0.1);
	env2 = \env2.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env2 = EnvGen.ar(env2,1,doneAction:0);
	env3 = \env3.kr(Env.new([3800, 50, 40.5, 70], [0.005, 0.16, 00.02], [-4, -2, -4]));
	env3 = EnvGen.ar(env3,1,doneAction:0);
	
	sig2 = LFSaw.ar(env1.linlin(1,0,80,20) * (1 + LFSaw.ar(500 * env1)));
	sig2 = SinOsc.ar(env3);
	sig2 = sig2 * env2 * 7;
	sig1 = Decay.ar(Impulse.ar(1), 0.87) * LFNoise2.ar(9450 * [1/10,1/4,1,2]);
	sig1 = sig1 + (0.2* sig2 );
	sig = sig1;
	sig = sig * 05;
	sig = RLPF.ar(sig, env1*800,1);
	sig = HPF.ar(sig,80);
	//sig = sig.tanh;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	OffsetOut.ar(out, sig);
}).add;
);

(
Pdef(\kick4, Pbind(
	\env0, [ Env.new([0.5, 9, 0.5, 0], [0.005, 0.46, 0.01], [-4, -2, -4]) ],
	\env1, [ Env.new([110, 53, 29], [0.015, 0.29], [-4, -5]) ],
	\lprq, 0.8,
	\instrument, \kick4,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).play;
);

