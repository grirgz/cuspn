////DRONE
Ndef(\saw).fadeTime = 1;
Ndef(\saw,{
	var sig = Mix.ar(SinOsc.ar([63,81,108,126]*SinOsc.kr(0.001)));
	sig = LPF.ar(sig,1000);
	sig = Splay.ar(sig,SinOsc.ar(0.1),1,SinOsc.ar(-0.1));

}).play;


Ndef(\saw).fadeTime = 16;
Ndef(\saw,{
	var sig = Mix.ar(SinOsc.ar([63,81,108,126]*SinOsc.kr(0.001,1,1,1),SinOsc.kr(0.001,0,1,0.001)));
	sig = LPF.ar(sig,1000);
	sig = Splay.ar(sig,SinOsc.ar(0.1),1,SinOsc.ar(-0.1));
	sig = sig.tanh *0.7;
	sig = Compander.ar(sig,
		SoundIn.ar(2,1),
		thresh: 0.1,
		slopeBelow: 0.3,
		slopeAbove: 0.4,
		clampTime: 0.01,
		relaxTime: 1,
		mul:0.002);
}).play;
///Reverb
Ndef(\rev).free;
Ndef(\rev2,{
	var sig = SoundIn.ar(1,1);
	sig  = FreeVerb.ar(sig,1,1);
	Out.ar(6,sig!2);
})


//
Ndef(\rev,{arg del=0.1;
	var sig = SoundIn.ar(2,1)+(LocalIn.ar(1)*0.3);
	sig = FreeVerb.ar(sig);
	LocalOut.ar(AllpassL.ar(sig,1/del));
	Out.ar(6,sig!2);
});

Pdef(\kick).play;

Pdef(\kick).set(\out, 2);
Pdef(\kick2).set(\out, 3);
Pdef(\kick2).play;

Pdef(\snare_hat).set(\out, 4);
Pdef(\snare_hat).play


Pdef(\snare_hat).set(\out, 2);

Ndef(\pitchshift,{
	var sig = PitchShift.ar(SoundIn.ar(2,2),0.2,0.3);
	sig =Splay.ar(sig);
	Out.ar(6,sig*2);
});


Pdef(\snare_hat,
	Ppar([

		Pbind(
			\instrument, \hat,
			\degree, Pseq([0],inf),
			\dur, 1,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
			\amp, 0.05,
			\fader,currentEnvironment[\uc2].value.asMap,

			//\amp, 0,
		),

		Pbind(
			\instrument, \snare,
			\degree, Pseq([0],inf),
			\dur, 1/4,
			//\lag, 0.01,
			\amp, 0.1/3,
			\degree, Pseq([0],inf),
			\dur, 1,
			\sustain, 0.05,
			\rel, Pseq([
				0.1,
			],inf).stutter(2),
				\fader,currentEnvironment[\uc2].value.asMap,

		)
	])
	<>
	Pbind(
		\env, Pseq([
			[ Env.perc(0,1) ],
		],inf),
		\isRest, Pseq([
		0,1

		],inf).coin.not,
		//\env1scale, Pseq([1,1.0],inf),
		//\env2scale, Pseq([1,[0.4,0.8]],inf),
		//\lag, Pseq([0, Ptuple([0,Pwhite(0.01,0.071,1)])],inf),
	).stutter(2)

);
