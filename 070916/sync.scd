// as a leader:
m = MandelHub.start(\benoit, 135/60);

// as a follower:
MandelHub.join(\benoit2, action:{ |instance| m = instance });

// communicating:
m.chat("hi there");
m.shout("I said HELLO!");

TempoClock.default = m.clock;

// gui tools
m.gui;
m.shoutWindow;

// changing tempo:
m.changeTempo(280/60);       // instant change
m.changeTempo(2.5);       // instant change
m.changeTempo(120/60, 30); // changes to 2 bps in 30 seconds

// use the MandelSpace
x = m.space;

// Finish!
MandelHub.clear;

<<<<<<< HEAD
Pdef(\t1).quant =1;

Pdef(\t1).stop;



SynthDef(\t1kick,{arg out = 0,rel = 0.6,pitch=0.1 ,fader =1 ,snd,mix=0.1,rev=0.1;
	var enva = EnvGen.ar(Env([1,1,0],[rel,0.2]),doneAction:2);
	var envf = EnvGen.ar(Env([20000,30,00,4],[0.02,0.1,1,1]));
	var sig = SinOsc.ar(envf+50*pitch,0,enva);
	//sig = PitchShift.ar(sig,0.001,pitch,0.1);
	sig = sig.distort;
	sig = HPF.ar(FreeVerb.ar(sig,mix,rev),1000)+sig;
	Out.ar(out,sig*fader*enva);
	//Out.ar(snd,sig);
}).add;

Pdefn(\seqt1,Pseq([
		1,0,0,1,0,0,1,0
	],inf));


////



Pdef(\t1).stop;



SynthDef(\dist,{arg amp =0.1,pitch=1;
	var freqs;
	var sig = CrossoverDistortion.ar( InFeedback.ar(0,1),1,1);
	sig = CombN.ar(sig,0.1,0.01,0.01)+sig;
	sig = CombN.ar(sig,0.1,0.04,0.01)+sig;
	sig = CombL.ar(sig,0.1,0.01,0.01)+sig;
	sig = CombL.ar(sig,0.1,0.05,0.01)+sig;
	sig = (sig*4).tanh;
	sig  = PitchShift.ar(sig,0.2,pitch);
	sig = Limiter.ar(sig,0.8);
	sig = CompanderD.ar(sig,0.5,1,0.5,mul:2);
	Out.ar(6,[sig,DelayL.ar(sig*(-1),0.1,SinOsc.kr(0.1,0,0.05,0.1))]*amp);
}).add(s);
~dist.free;
~dist = Synth(\dist);
Pdef(\snare).stop;


/// partie 0

Pdef(\snare).stop;
Pdefn(\seqt1,Pseq([
		1,0,1,0
	],inf));
Pdef(\snare,Pbind(\instrument,\snare2,\out,1,\dur,Pseq([Pseq([1/2],24),Pseq([1/4],16)],inf),\amp,Pseq([0,0,0,1,0,0,0.5,0],inf),\isRest,Pseq([0,0,0,1,0,0,1,0],inf).coin.not)).play;
Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;




/// partie 1
Pdef(\t1).quant= 4;
Pdef(\snare).quant= 4;
Pdef(\t1).stop;
Pdefn(\seqt1,Pseq([
		1,0,0,1,0,0,1,0
	],inf));
Pdef(\snare,Pbind(\instrument,\snare2,\out,1,\dur,2,\amp,1,\isRest,Pseq([Pseq([0,1],15),Pseq([0,1],1)],inf).coin.not)).play;
Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;
SynthDef(\snare2,{arg gate = 1, amp=1, out=0;
	var env = EnvGen.ar(Env.perc(0.001,0.2),gate,doneAction:2);
	var freq = EnvGen.ar(Env([12000,100,12000],[0.01,0.01]));
	var sig = WhiteNoise.ar(env);
	sig = LPF.ar(sig,freq);
	sig = sig.tanh;
	Out.ar(out,sig*amp );
}).add;


////part 2
Pdefn(\seqt1,Pseq([
		1,0,1,1,0,0,1,0
	],inf));
Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;

Pdef(\noise).stop;

Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,1/2,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([0.01],28),Prand([0.01,0.01,0.001,0.001],1)],inf).coin.not,
\isRest,Pseq([0,0,0,0,1],inf).coin.not)).play;


s.makeGui;
s.meter;
=======
TempoClock.default.tempo
>>>>>>> 5efc78ec6be878d1a5ef3fb081e8d5a01e7024f0
