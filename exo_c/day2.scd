
Pdef(\clap).stop;


(
Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/8,
	\amp,0.2,
	\freq,Pseq([120,50,110,30],inf),
	\tu,1,
	\isRest,Pseq([
//Pseq([Pseq([1,0,0,1,0,0,1,0],15),Pseq([0,0,1,1,0,0,0,1],1)],1),
//Pseq([Pseq([1,0,1,1,0,0,1,1],15),Pseq([0,1,0,1,0,1,1,1],1)],1),
Pseq([Pseq([1,0,0,0,0,0,1,0],1),Pseq([0,0,1,0,0,0,0,1],1)],1),
//Pseq([Pseq([1,0,0,0,0,0,1,1],1),Pseq([0,0,0,0,0,0,1,0],1)],1)
],inf).coin.not)).play;

 Pdef(\clap,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([38], inf),\isRest,
	Pseq([
		// Pseq([0,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0],1),
		 Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;



 Pdef(\ch,Pbind(\type, \midi, \dur,1/8,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([42], inf),
	\amp,Pseq([0.4,0.2,0.1],inf),
	\isRest,Pseq([
	 Pseq([0,0,0,0,0,0,0,0],7),Pseq([0,0,1,0,0,1,1,1],1),
///	1,0,0,1,0,0,1,0
],inf).coin.not)).play;




Pdef(\z,Pbind(\type, \midi, \dur,Pseq([Pseq([1/8],120),Pseq([1/16],16)],inf),\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,
	\midinote,Pseq([48,47], inf),
	//\amp,1,
	\amp,Prand([0.2,0.01,0.3],inf),
	\isRest,Pseq([
	//Pseq([0,1,0,1,1,0,0,1],3),Pseq([1,0,1,1,0,1,1,1],1),
	Pseq([1,0,1,0,1,1,1,0],15),Pseq([1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1],1)
],inf).coin.not)).play;



 Pdef(\w,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([51], inf),\amp,0.5,
	\isRest,
	Pxrand([
		 Pseq([0,0,0,0,1,0,0,0],1),
		 Pseq([0,0,1,0,0,0,0,0],1),
		 Pseq([0,0,0,0,0,1,0,0],1),
		 Pseq([0,0,0,0,0,0,1,0],1),
	],inf).coin.not
)).play;

)

//////////////////NORD 2
(
Pdef(\x,
Ppar([

	Pbind(\type, \midi,
	\dur,1/4,
	\chan, 0,
	\lag,0.01,
	\midicmd, \noteOn,
	\amp,Pseq([0.5,0.5,0.2],inf),
	\midiout, m,
	\midinote, Pseq([38], inf),
	\isRest,
	Pseq([
		// Pseq([0,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0],1),
		 Pseq([0,0,0,1,1,1,1,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
	),
Pbind(\type, \midi, \chan, 0, \midicmd, \control, \midiout, m,
\ctlNum,Pwhite(0,127, inf), \control, Pwhite(0,127, inf), \dur, 1/256)
])
).play;
)

Pdef(\x).stop;


//////////////:



Pdef(\kick).stop;

SynthDef(\kick, {
	arg outBus=0,tu = 1,amp=1,freq=120,rel=0.26;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 0.3, 0], [0.01, 0.2, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([freq, 31, 33], [0.001, 0.29], [-4, -5]));
	env1m = env1.midicps;
   out = LFPulse.ar(env1m*tu, 0, 0.5, 1, -0.5);
	out = out + WhiteNoise.ar(1);
	out = LPF.ar(out, env1m*tu, env0);
	out = out + SinOsc.ar(env1m*tu, 0.5, env0*4);
	out = out * amp;
	out = out.clip2(1);
	Out.ar(outBus, out.dup);
}).send(s);


Pdef(\bass,Pbind(\instrument,\bass,\dur,4,\amp,0.7,\rel,2,\freq,Pseq([70,80]/2,inf))).play

Ndef(\noise).free;

SynthDef(\bass, {
	arg outBus=0,tu = 1,amp=1,freq=120,rel=2;
	var env0, env1, env1m, out;
env0 =  EnvGen.ar(Env.new([0.5, 1, 0.3, 0], [0.5, 2, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([70, 70, freq], [0.01, 0.29], [-4, -5]));
    out = LFSaw.ar(env1*tu, 0, 0.5, 1, -0.5);
	out = out + LFPar.ar(env1*tu, 0.5, env0*4);
	out = LPF.ar(out, env1*5, env0);
	out = (out * amp).tanh.clip2(1);
	Out.ar(4, out.dup);
}).send(s);


SynthDef(\son2, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([0.3, 0.7, 0.3, 0], [0.004, 0.1, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([15000,300], [0.001, 0.29], [-4, -5]));
	out = SinOsc.ar(env1,0,env0);
	out = out.clip2(1)*amp;
	Out.ar(outBus, out.dup);
}).send(s);


SynthDef(\hh, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06,pan = 0;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 0.7, 0.3, 0], [0.004, 0.01, rel], [-4, -2, -4]), doneAction:2);
	out = WhiteNoise.ar(env0);
	out = out.clip2(1)*amp;
	out = Pan2.ar(out,pan);
	Out.ar(outBus, out);
}).send(s);

Pdef(\hh).stop;
Pdef(\hh,Pbind(\instrument,\hh,\amp,0.7,\pan,Pseq([0],inf))).play;

Pdef(\sn).stop;

Pdef(\sn,
	Pbind(\instrument,\son2,
		\outBus,2,
		\dur,1/8,
		\amp,0.4,
		\isRest,Pseq([
			Pseq([
		Pseq(0!16,1),Pseq([0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0],1),
		Pseq(0!16,1),Pseq([0,0,0,0,1,1,0,1,0,0,0,1,0,1,1,0],1)
			],3),
			Pseq([
		Pseq(0!16,1),Pseq([0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0],1),
		Pseq(0!16,1),Pseq([0,0,0,0,1,1,1,1,0,0,1,1,0,0,0,0],1)
			],1)
		],inf).coin.not;
)).play;

(
Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/8,
	\amp,0.2,
	\freq,
	Pseq([
		Pseq([
			Pseq([Pseq([120,0,0,0,0,0,80,0],3),Pseq([0,0,120,0,0,0,0,50],1)],1),
			],16),
	Pseq([
		Pseq([
			Pseq([120,0,0,50,0,0,80,0],3),Pseq([0,0,120,80,0,0,0,30],1)],1)
			],16)
],inf),
	\tu,	Pseq([
		Pseq([
			Pseq([Pseq([1,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0.5],1)],1),
			],16),
	Pseq([
		Pseq([
			Pseq([1,0,0,1,0,0,1,0],3),Pseq([0,0,1,1,0,0,0,0.5],1)],1)
			],16)
],inf),
	\isRest,
	Pseq([
		Pseq([
			Pseq([Pseq([1,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,1],1)],1),
			],16),
	Pseq([
		Pseq([
			Pseq([1,0,0,1,0,0,1,0],3),Pseq([0,0,1,1,0,0,0,1],1)],1)
			],16)
],inf).coin.not
)).play;

)
Pdef(\kick).stop;
Pdef(\y).stop;
Pdef(\x).stop;
Pdef(\w).stop;
Pdef(\sn).stop;
Pdef(\hh).stop

Pdef(\z).stop;


Pdef(\kick).play;
Pdef(\y).play;
Pdef(\x).play;
Pdef(\z).play;
Pdef(\sn).play
Pdef(\hh).play

Pdef(\w).play;

(
Pdef(\x,
	Pbind(\type, \midi,
	\dur,1/4,
	\chan, 1,
	\lag,0.01,
	\midicmd, \noteOn,
	\amp,Pseq([1,0.3],inf),
	\midiout, m,
	\midinote, Pseq([ Pseq([50], 8),Pseq([60], 8),Pseq([55], 8),Pseq([58], 8)],inf),
	\isRest,
	Pseq([
		 Pseq([0,0,0,0,0,0,1,0],7),Pseq([0,0,0,1,1,0,0,0],1),
	],inf).coin.not
	)
).play;
)


(
Pdef(\y,
Ppar([
	Pbind(\type, \midi,
	\dur,1/8,
	\chan, 1,
	\lag,0.01,
	\midicmd, \noteOn,
	\amp,Pseq([0.6,0.3],inf),
	\midiout, m,
	\midinote, Pseq([38,37], inf),
	\isRest,
	Pseq([
		 Pseq([0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0],1),Pseq([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],1),

		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
	)
])
).play;
)



(
Pdef(\z,
Ppar([
	Pbind(\type, \midi,
	\dur,1/4,
	\chan, 2,
	\lag,0.01,
	\midicmd, \noteOn,
	\amp,Pseq([1,0.3],inf),
	\midiout, m,
	\midinote, Pseq([38,37], inf),
	\isRest,
	Pseq([
		 Pseq([1,0,0,1,0,0,0,0],1),Pseq([0,0,1,0,0,0,0,0],1),
	],inf).coin.not
	)
])
).play;
)

Pdef(\sn).quant= 4;
Pdef(\x).quant=4;
Pdef(\z).quant=4;
Pdef(\y).quant=4;
Pdef(\w).quant=4;




(
Pdef(\w,
Ppar([
	Pbind(\type, \midi,
	\dur,1/8,
	\chan, 0,
	\lag,0.01,
	\midicmd, \noteOn,
	\amp,Pseq([1,0.3],inf),
	\midiout, m,
	\midinote, Pseq([38,37], inf),
	\isRest,
	Pseq([
		 Pseq([1,0,1,1,0,1,0,0],3),Pseq([0,1,1,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
	)
])
).play;
)
Pdef.clear;


Ndef(\noise).fadeTime =8;

Ndef(\noise,{arg freq=55,amp=1;
	var sig =LFSaw.ar([freq+0.5,freq],LFSaw.kr([0.1,0.2]),SinOsc.kr(0.1));
	//sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,0.1);
	sig*amp*LFPulse.kr(0.1)*0.1;
}).playN(4,2);

