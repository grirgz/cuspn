SynthDef(\kick,{arg freq ,rel=1,tu=1,amp;
	var env = EnvGen.ar(Env([0,1,0],[0,rel],-8),doneAction:2);
	var enf  = EnvGen.ar(Env([1000,20,20],[0.001,0.001,0.001],-4));
	var sig = SinOsc.ar(tu*(enf+40))*env;
	sig = sig + LPF.ar(SinOsc.ar(SinOsc.ar(100,0,50,100*tu),0,0.2)*env,1000);
	sig = Pan2.ar(sig);
	Out.ar(0,sig*env*0.5*amp);
}).add;



SynthDef(\snare, { arg out=0,tu=1, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var env = EnvGen.ar(Env.perc(0.01,1));
	var enf = EnvGen.ar(Env([600,177,230],[0.01,0.01],-4));
	sig = SinOsc.ar(tu*enf+127,0,0.5)*env;
	sig = WhiteNoise.ar+sig;
	sig = RHPF.ar(sig, \hpf.kr(170)*tu, \rq.kr(0.5));
	sig = sig + Mix.ar(BPF.ar(sig,[127,430],[0.5,0.5])*0.1);
	sig = RLPF.ar(sig, \lpf.kr(11100)*tu, \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.perc(0.01,\rel.kr(0.1),-4),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;



SynthDef(\hat, { arg out=0,tu=1, amp=0.1, gate=1, pan=0;
	var sig;
	var env = EnvGen.ar(Env.perc(0.01,0.01),doneAction:2);
	sig = Saw.ar((1..9)*1000.23*env*tu);
	sig = RHPF.ar(sig, \hpf.kr(5700), \rq.kr(0.5));
	sig = sig * (1+EnvGen.ar(Env.perc((-0.1),\rel.kr(0.1),-4),gate))*tu;
	sig = Ringz.ar(sig,(10..15)*1000.234,1).mean;
	sig = RHPF.ar(sig, \lpf.kr(2000)*env*tu, \rq.kr(0.5));
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;


SynthDef(\cow, { arg out=0,tu=1, amp=0.01, pan=0,gate=1,rel=1;
	var sig;
	var env = EnvGen.ar(Env.adsr(0.001,0.01,0.1,rel),gate,doneAction:2);
	sig = LFPulse.ar(550*tu)+LFPulse.ar(tu*400*(env+250));
	sig = Ringz.ar(sig,(30..35)*10.234*tu,1).mean;
	sig = Pan2.ar(sig*env, pan, amp);
	Out.ar(out, sig*0.5);
}).add;

SynthDef(\cym, { arg out=0,tu=1, amp=0.01, pan=0,rel=1;
	var sig;
	var env = EnvGen.ar(Env.perc(0,rel,1,-8),doneAction:2);
	var
	freqs= geom(100,50,1.3434)*10.234567*tu;
	sig = WhiteNoise.ar;
	sig = Ringz.ar(sig,freqs,1).mean;
	sig = Pan2.ar(sig*env, pan, amp);
	Out.ar(out, sig*0.5);
}).add;

SynthDef(\rim, { arg out=0,tu=1, amp=0.01, pan=0,gate=1,rel=1;
	var sig;
	var env = EnvGen.ar(Env.perc(0.001,rel),doneAction:2);
	sig = SinOsc.ar(tu*400)*env;
	sig = Ringz.ar(sig,(30..35)*10.234*tu,1).mean;
	sig = Pan2.ar(sig*env, pan, amp);
	Out.ar(out, sig*0.5);
}).add;

Pdef(\ri,Pbind(\instrument,\rim,\tu,2.2,\dur,1/8,\rel,0.01,\amp,0.05,\isRest,Pseq([
	1,0,0,1,0,0,1,0,
],inf).coin.not)).play;



Pdef(\cy,Pbind(\instrument,\cym,\tu,1,\dur,8,\rel,4,\amp,0.05,\isRest,Pseq([
	1
],inf).coin.not)).play;



Pdef(\co,Pbind(\instrument,\cow,\tu,1,\dur,1/8,\rel,0.3,\amp,0.02,\isRest,Pseq([
	1,1,0,0,1,0,0,0,
	1,0,0,1,0,0,1,0
],inf).coin.not)).play;

Pdef(\hat,Pbind(\instrument,\hat,\tu,0.3,\dur,1/8,\amp,1,\isRest,Pseq([
	1,1,0,0,1,0,0,0,
	1,0,0,1,0,0,1,0
],inf).coin.not)).play;

Pdef(\kik,Pbind(\instrument,\kick,\amp,1,\tu,0.85,\dur,1/4,\isRest,Pseq([
	1,1,0,1,0,0,0,0,1,0,0,1,0,0,0,0,
	1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0
],inf).coin.not)).play;

Pdef(\snare,Pbind(\instrument,\snare,\dur,1/4,\tu,1,\rel,0.1,\isRest,Pseq([
	0,0,0,0,1,0,0,0,
],inf).coin.not)).play;


Pdef(\hitom,Pbind(\instrument,\kick,\tu,7,\amp,0.2,\dur,1/8,\isRest,Pseq([
	1,0,0,1,0,0,1,0
],inf).coin.not)).play;


Pdef(\lotom,Pbind(\instrument,\kick,\tu,2.5,\dur,1/4,\isRest,Pseq([
	1,1,0,0,1,0,0,0,
	1,0,0,1,0,0,1,0
],inf).coin.not)).play;


Pdef(\tom,Pbind(\instrument,\kick,\tu,2.3,\dur,1/8,\isRest,Pseq([
	1,1,0,0,1,0,0,0,
	1,0,0,1,0,0,1,0
],inf).coin.not)).play;





