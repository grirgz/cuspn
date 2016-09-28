SynthDef(\click,{

	var sig =WhiteNoise.ar(EnvGen.ar(Env([0,1,0],[0.001,0]),doneAction:2));
	Out.ar(2,sig*10);
	}).add
Pdef(\click,Pbind(\instrument,\click)).play;
Pdef.clear;
Ndef(\click).clear;
s.meter;

Ndef(\start).clear;
Ndef(\start,{

	WhiteNoise.ar

}).playN(0);




(
// allocate a Buffer
s = Server.local;
b = Buffer.alloc(s, 44100 * 0.5, 1); // a four second 1 channel Buffer
)

// record for four seconds


~hollow = Buffer.read(s, "/home/xtr/Desktop/syncmfb.wav");
~hollow = Buffer.read(s, "/home/xtr/Desktop/syncmfb2.wav");
~hollow = Buffer.read(s, "/home/xtr/Desktop/syncmfb3.wav");

~hollow = Buffer.read(s, "/home/xtr/Desktop/syncmfb4.wav");

Pdef(\sample).quant=0;
Pdef(\t1).quant = 4;


Pdef(\t1).stop;

Pdef(\sample).stop;


	Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\level,1,\dur,1/12));

SynthDef(\playbuf, {| out = 0, bufnum = 0 ,pos=0,gate=1,speed=1,len=4.3,rel=0.1,pitch=1,level=1|
	var env = EnvGen.ar(Env([0,1,1,0],[0,1,1,0]),gate,doneAction:2);
	var sig = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum),1,pos, doneAction:2);
	Out.ar([2,3], sig*level);
}).add;

y= Task({
Ndef(\pulse,{
	LFPulse.ar(24,pi,0.35);
}).play(2);
}).play(quant:4);
z.stop;
Ndef(\pulse).clear;

Ndef(\pulse).clear;
(
z = Task({
Ndef(\pulse,{
	LFPulse.ar(24,0,0.35);
}).play(2);
}).play(quant:4);


x = Task({
Ndef(\impulse,{
	Impulse.ar(1)
}).play(3);
}).play(quant:4);
)
Pdef(\t1).play;

Pdef(\t1).quant=4;
Pdef(\t1).stop;




t = TempoClock.default;
t.tempo =60/60;

Pdef(\sample).play;
Pdef(\t1).play;

Pdef(\t1).quant = 4;
Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1,
	\isRest,1,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;

Ndef(\pulse).clear;
s.meter;
/// restart
(
TempoClock.default.play({
 Ndef(\start,{
		LFPulse.ar(1,pi/2.05,0.1)*EnvGen.ar(Env([0,1,0],[0,1,0]))*2;
}).play(0);
    },4);
)

s.scope;
// pulse  sync
SynthDef(\pulse,{arg out = 0,rel = 0.6,pitch=0.1 ,fader =1 ,snd,mix=0.1,rev=0.1;
	var env = EnvGen.ar(Env.linen(0,1/10000,0, 0.8),doneAction:2);
	var sig = LFPulse.ar(24,0)*env;
	Out.ar(2,sig);
}).add;

// impulse
SynthDef(\impulse,{arg out = 0,del =0.4,rel = 0.6,pitch=0.1 ,fader =1 ,snd,mix=0.1,rev=0.1;
	var env = EnvGen.ar(Env.linen(0,1/24,0, 0.8),doneAction:2);
	var sig = Impulse.ar(1)*env;
	/*
	sig = CombL.ar(sig,0.2,del,2)+sig;
	 sig = CombN.ar(sig,0.3,del+0.1,1)+sig;
	 sig = CombL.ar(sig,0.4,del+0.1,2)+sig;
	 sig = CombL.ar(sig,0.1,del+0.05,2)+sig;
	 sig = CombL.ar(sig,0.1,del+0.04,1)+sig;
		sig = CombL.ar(sig,0.1,del+0.04,1)+sig;
	 sig = CombL.ar(sig,0.1,del+0.04,1)+sig;
	 sig = CombL.ar(sig,0.1,del+0.04,1)+sig;
	 sig = CombL.ar(sig,0.1,del+0.04,1)+sig;
*/
	Out.ar(3,sig*1);
}).add;

Pdef(\dfs).stop;
Pdef(\sdf).stop;

Pdef(\dfs).quant=4;
Pdef(\sdf,Pbind(\instrument,\impulse,\isRest,Pseq([1],inf).coin.not,\del,Pseq([0.01,0.1,0.3,0.04],inf),\dur,1/4)).play;

Pdef(\dfs).quant=4;
Pdef(\dfs,Pbind(\instrument,\pulse,\dur,1/48)).play;

t = TempoClock.default;
t.tempo =1;
s.plotTree;

SynthDef(\t1kick,{arg out = 0,rel = 0.6,pitch=0.1 ,fader =1 ,snd,mix=0.1,rev=0.1;
	var enva = EnvGen.ar(Env([1,1,0],[0.01,0.2]),doneAction:2);
	var envf = EnvGen.ar(Env([20000,30,00,4],[0.01,0.1,1,1]));
	var sig = SinOsc.ar(envf+50*pitch,0,enva);
	//sig = PitchShift.ar(sig,0.001,pitch,0.1);
	sig = sig.distort;
	sig = HPF.ar(FreeVerb.ar(sig,mix,rev),1000)+sig;
	Out.ar(4,sig*fader*enva);
	//Out.ar(snd,sig);
}).add;

Pdef(\t1).play;
Pdef(\t1).stop;
