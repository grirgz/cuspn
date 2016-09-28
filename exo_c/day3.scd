Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/8,
	\amp,0.2,
	\freq,Pseq([120,50,110,30],inf),
	\tu,1,
	\isRest,Pseq([
Pseq([Pseq([1,0,0,1,0,0,1,0],31),Pseq([0,0,1,1,0,0,0,1],1)],1),
Pseq([Pseq([1,0,1,1,0,0,1,1],31),Pseq([0,1,0,1,0,1,1,1],1)],1),
Pseq([Pseq([1,0,0,0,0,0,1,0],31),Pseq([0,0,1,0,0,0,0,1],1)],1),
Pseq([Pseq([1,0,0,0,0,0,1,1],31),Pseq([0,0,0,0,0,0,1,0],1)],1)
],inf).coin.not)).play;


Pdef(\kick).quant= 4;


SynthDef(\kick, {
	arg outBus=0,tu = 1,amp=1,freq=120,rel=0.26;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 0.3, 0], [0.01, 0.2, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([freq, 31, 33], [0.001, 0.29], [-4, -5]));
	env1m = env1.midicps;
   //  out = LFPulse.ar(env1m*tu, 0, 0.5, 1, -0.5);
	out = WhiteNoise.ar(1);
	out = LPF.ar(out, env1m*tu, env0);
	out = out + SinOsc.ar(env1m*tu, 0.5, env0*4);
	out = out * amp;
	out = out.clip2(1);
	Out.ar(outBus, out.dup);
}).send(s);





SynthDef(\hh, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06,pan = 0;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 0.7, 0.3, 0], [0.004, 0.01, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([1200, 3100, 3300], [0.001, 0.29], [-4, -5]));
	out = WhiteNoise.ar(env0);
	out = HPF.ar(out, env1, env0);
	out = out.clip2(1)*amp;
	out = Pan2.ar(out,pan);
	Out.ar(outBus, out);
}).send(s);

Pdef(\hh).stop;
Pdef(\kick).stop;
Pdef(\sn).stop;

Pdef(\sn).play;
Pdef(\kick).play;
Pdef(\hh,Pbind(\instrument,\hh,\dur,1/8,\amp,0.7,\pan,Pseq([0],inf),\isRest,Pseq([1,0,1,0,0,1,0,0],inf).coin.not)).play;


SynthDef(\son2, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([0.3, 0.7, 0.3, 0], [0.004, 0.1, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([15000,freq], [0.001, 0.29], [-4, -5]));
	out = SinOsc.ar(env1,0,env0);
	out = out.clip2(1)*amp;
	Out.ar(4, out.dup);
}).send(s);


s.meter;

Pdef(\sn,
	Pbind(\instrument,\son2,
		\outBus,4,
		\freq,Pseq([800,300],inf),
		\dur,1/4,
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



////////////////////////////////////////



SynthDef(\kick, {
	arg outBus=0,tu = 1,amp=1,freq=120,rel=0.26;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 0.3, 0], [0.01, 0.2, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([freq, 31, 113,33,120,33], [0.001, 0.001,0.001,0.001], [-4, -5]));
	env1m = env1.midicps;
   //  out = LFPulse.ar(env1m*tu, 0, 0.5, 1, -0.5);
	out = WhiteNoise.ar(1);
	out = LPF.ar(out, env1m*tu, env0);
	out = out + SinOsc.ar(env1m*tu, 0.5, env0*4);
	out = out * amp;
	out = out.clip2(1);
	Out.ar(outBus, out.dup);
}).send(s);


Pdef(\kick).stop;
Pdef(\hh).stop;
Pdef(\snare).stop;



Pdef(\kick).play;
Pdef(\hh).play;
Pdef(\snare).play;


Pdef(\kick).quant =4;
Pdef(\hh).quant =4 ;
Pdef(\snare).quant =4 ;


Pdef(\kick).stop;


Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,
		Pseq([
			Pseq([1/8],256),
			Pseq([1/16],512),
			Pseq([1/64],32),
		],inf),
	\amp,0.2,
	\freq,Pseq([80,50,60,30],inf),
	\tu,1,
	\isRest,
		Pseq([		Pseq([
Pseq([Pseq([1,0,0,1,0,0,1,0],7),Pseq([0,0,1,0,0,0,1,0],1)],1),
],32),
			Pseq([
Pseq([Pseq([1,0,0,1,0,0,1,0],7),Pseq([0,0,1,0,0,0,1,0],1)],1),
],32)
		],inf).coin.not)).play;



Pbindef(\kick,\dur,1/4);


Pdef(\hh,Pbind(\instrument,\hh,\dur,1/16,\amp,0.2,	\pan,Pwhite(-1,1,inf),
	\isRest,
	Pseq([
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,0,0,1,1,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,1,0,0,0,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,0,0,1,1,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,1,1,1,1,1,1,1],1),
	],inf).coin.not
)).play;


Pdef(\snare).stop;
Pdef(\hh).stop;

Pdef(\kick).stop;



Pdef(\kick).play;




SynthDef(\snare, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06,pan = 0;
	var env0, env1, env1m, out;
	env0 = EnvGen.ar(Env.new([1, 1, 1, 1], [0.004, rel, 0.1], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([1200, 3100, 3300], [0.001, 0.29], [-4, -5]));
	out = WhiteNoise.ar(env0);
	out = HPF.ar(out, env1, env0) + BrownNoise.ar(env0);
	out = out.clip2(1)*amp*0.5;
Out.ar(4, out.dup);
}).send(s);

Pdef(\snare,Pbind(
	\instrument,\snare,
	\dur,1/4,
	\amp,1,
	\rel, 1,
    \isRest,Pseq([Pseq([0,0,0,0,0,0,1,0],7),Pseq([0,0,0,0,1,0,0,0],1)],inf).coin.not,
)).play;



/////////




FreqScope.new;



Pdef(\kick).stop;

SynthDef(\kick, {
	arg outBus=0,tu = 1,amp=1,freq=120,freq2= 33,rel=0.26;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 0.3, 0], [0.01, 0.5, 0.1], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([60, 31, 33], [0.05, 0.29], [-4, -5]));
	env1m = env1.midicps;
	out = LFPulse.ar(env1m*tu, 0, 0.5, 1, -0.5);
	out = out + WhiteNoise.ar(1);
	out = LPF.ar(out, env1m*tu, env0);
	out = out + SinOsc.ar(env1m*tu, 0.5, env0*4);
	out = out * amp;
	out = out.clip2(1);
	Out.ar(outBus, out.dup);
}).send(s);

Pdef(\kick).stop;
Pdef(\clap).stop;
Pdef(\snare).stop;


Ndef(\noise).free;
Pdef(\kick,
	Pbind(
	\instrument,\kick,
	\outBus,0,
	\dur,1/8,
	\amp,0.2,
	\freq,Pseq([120,50,110,30],inf),
	\tu,Pseq([1,0.9],inf),
	\rel,2,
	\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not)).play;


 Pdef(\clap,Pbind(\type, \midi, \dur,1/8,\chan, 9, \lag,0.01,
	\amp,0.5,
	\midicmd, \noteOn, \midiout, m,\midinote, Pseq([38], inf),\isRest,
	Pseq([
		 Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;
Pdef(\snare,Pbind(
	\instrument,\snare,
	\dur,1/4,
	\amp,1,
	\rel, 1,
    \isRest,Pseq([
		 Pseq([0,0,0,0,1,0,0,0],1),
	],inf).coin.not,
)).play;

Pdef(\hh).stop;


SynthDef(\hh, {
	arg outBus=2,tu = 1,amp=1,freq=120,rel=0.06,pan = 0,del=0.01;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 0.7, 0.3, 0], [0.004, 0.01, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([1200, 13000,13300], [0.04, 0.09], [-4, -5]));
	out = WhiteNoise.ar(env0);
	out = HPF.ar(out, env1, env0);
	out = out.clip2(1)*amp;
	out = DelayL.ar(out,0.1,del)+out;
	out = DelayL.ar(out,0.1,del)+out;
	out = CombC.ar(out,0.1,del)+out;
	out = Pan2.ar(out/4,pan);
	Out.ar(2, out.dup);
}).send(s);



(
Pdef(\hh,Pbind(\instrument,\hh,\dur,1/8,\amp,0.2,\del, Pwhite(1,5,inf)/100,\pan,Pwhite(-1,1,inf),
	\isRest,
	Pseq([
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,0,0,1,0,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,0,0,0,0,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,0,1,0,0,1,1,1],1),
		Pseq([1,0,1,0,0,1,0,0],7),Pseq([1,1,1,1,1,1,1,1],1),
	],inf).coin.not
)).play;
)

Pdef(\noise).stop;

Pdef(\clap).play;
Pdef(\snare).play;
Pdef(\kick).play;
Pdef(\tamb).play;
Pdef(\mtom).play;
Pdef(\w).play;
Pdef(\hh).play;


Pbindef(\hh,\dur,1/4);

s.plotTree;

Pdef(\tamb).quant= 4;
Pdef(\kick).quant= 4;


Pdef(\kick).stop;
Pdef(\hh).stop;
Pdef(\clap).stop;
Pdef(\snare).stop;
Pdef(\tamb).stop;
Pdef(\mtom).stop;
Pdef(\w).stop;
Pdef(\ltom).stop;


Pdef(\kick).play;
Pdef(\tamb).play;

 Pdef(\tamb,
	Pbind(
	\type, \midi,
	\dur,1/4,
	\chan, 9,
	\lag,0.01,
	\amp,0.7,
	\midicmd, \noteOn,
	\midiout, m,
	\midinote, Pseq([54], inf),
	\isRest,
	Pseq([
 Pseq([0,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0],1),
 Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
 Pseq([1,0,0,1,0,0,1,0],15),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;

 Pdef(\ltom,Pbind(\type, \midi, \dur,1/8,\chan, 9, \lag,0.01,
	\amp,0.5,
	\midicmd, \noteOn, \midiout, m,\midinote, Pseq([43], inf),
	\amp,Pseq([0.4,0.2,0.1],inf),
	\isRest,Pseq([
	 Pseq([0,0,0,0,0,0,0,0],7),Pseq([0,0,1,0,0,1,1,1],1),
///	1,0,0,1,0,0,1,0
],inf).coin.not)).play;


Pdef(\mtom,Pbind(\type, \midi, \dur,Pseq([Pseq([1/8],120),Pseq([1/16],16)],inf),\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,
	\midinote,Pseq([48,47], inf),
	//\amp,1,
	\amp,Prand([0.2,0.01,0.3],inf),
	\isRest,Pseq([
	Pseq([0,0,0,0,0,0,0,0],3),Pseq([1,0,1,1,0,1,1,1],1),
	Pseq([0,0,0,0,0,0,0,0],15),Pseq([1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1],1)
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


 Pdef(\clap,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,
	\amp,0.7,
	\midicmd, \noteOn, \midiout, m,\midinote, Pseq([38], inf),\isRest,
	Pseq([
		 Pseq([0,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0],1),
		// Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;

Pdef(\kick).play;


Ndef(\noise,{arg freq=55,amp=1;
	var sig = SoundIn.ar(6);
	var sig2 = SoundIn.ar(7);
	sig = FreeVerb2.ar(sig,sig2,0.33,0.5);
	sig;
}).playN(6,2);




Pdef(\noise).stop;




SynthDef(\noise,{arg rel  = 0.25,a=4;
var env0 =  EnvGen.ar(Env.new([0.1, 1, 0.3, 0], [0.01, rel], [-4, -2, -4]), doneAction:2);
var sig = LatoocarfianL.ar(
		SampleRate.ir/a,
		LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5);
	);
	sig = HPF.ar(sig,1000);
	sig = Limiter.ar(sig,0.4);
	sig =	[sig ,DelayL.ar(sig,0.1,100/44100)];
	//sig = PitchShift.ar(sig,0.2,1*a);
	sig = Compander.ar(sig,In.ar(0,1),0.01,1,0.01,0.01,0.1);
	sig=  sig.tanh;
	Out.ar(6,sig*env0);
}).add;


Pdef(\noise,Pbind(\instrument,\noise,
	\dur,Pseq([Pseq([1/8],28),Pseq([1/2],8)],inf),
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([1],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;

Ndef(\noise).free;
Pdef(\kick).stop;

Ndef(\noise,{
	var sig =SinOsc.ar([55.5,55]-2);
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,0.1);
	sig.tanh;
}).playN(4,2);