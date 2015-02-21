
(
SynthDef(\kick6, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.06, 00.12], [4, 8, -4]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	
	sig = Impulse.ar(1);
	sig = Klank.ar(Ref([ [50,30,40],3,4.4 ]), sig);
	//sig = sig.clip2(0.7);
	sig = RLPF.ar(sig, 500);

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	Out.ar(out, sig);
}).add;
);

(
SynthDef(\kick6, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.009, 0.10, 00.04], [0, 0, 0]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	
	sig = Impulse.ar(1);
	sig = Klank.ar(Ref([ [60,065,70,50],0.8!4,0.8!4 ]), sig)/1;
	sig.debug("plop");
	//sig = sig.clip2(0.7);
	sig = RLPF.ar(sig, 200);
	sig = CompanderD.ar(sig, thresh: -20.dbamp, slopeBelow: 1, slopeAbove: 0.3, clampTime: 0.003, relaxTime: 0.08);
	sig = sig * 18;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	Out.ar(out, sig);
}).add;
);

(
SynthDef(\kick6, { |out=0, amp=0.1, pan=0, release=0.26, fratio=1.0, freqpan=0.01, spread=0.8, timeScale=1|
	var env0, env1, env1m, sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	var env2, env3;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.005, 0.10, 00.04], [4, 8, -8]));
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	
	sig = Impulse.ar(1);
	sig = Klank.ar(Ref([ [60,065,70,50],0.8!4,0.8!4 ]), sig)/1;
	sig.debug("plop");
	//sig = sig.clip2(0.7);
	sig = RLPF.ar(sig, 200);
	sig = CompanderD.ar(sig, thresh: -20.dbamp, slopeBelow: 1, slopeAbove: 0.3, clampTime: 0.003, relaxTime: 0.08);
	sig = sig * 6;

	sig = sig * amp;
	sig = sig * env0;
	sig = Splay.ar(sig, 0.1, amp, pan);
	
	Out.ar(out, sig);
}).add;
);

(
Pdef(\kick6, Pbind(
	\lprq, 0.8,
	\instrument, \kick6,
	\degree, Pseq([0],inf),
	\dur, 1/2,
	\amp, 0.3
)).play;
);
(
Pdef(\kick6, Pbind(
	\lprq, 0.8,
	\instrument, \kick6,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.3
)).play;
);


{ LPF.ar( Ringz.ar( Impulse.ar(1), 60, 0.5  ), 500  ) * 0.25  }.play; 




a = { (LPF.ar( Ringz.ar( Impulse.ar(1), 60, 0.5 ), 500 ) * 0.25) ! 2 }.play;

a.free;


(
a = {
		var sig = LPF.ar( Ringz.ar( Impulse.ar(1), 60, 0.5 ), 500 ),
				cmp = CompanderD.ar(sig, thresh: -20.dbamp, slopeBelow: 1, slopeAbove: 0.3, clampTime: 0.003, relaxTime: 0.08);
		(cmp * (10.dbamp * 0.25)) ! 2
}.play;
)

a.free; 







