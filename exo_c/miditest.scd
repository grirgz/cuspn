//FRAMES 256
//SR 44100
//Periods 2
//start delay 0
//MIDI Dr : RAW
//Latency 11.6 msec
// TR707 :: \lag,0.01,
// Tempo : 60/60

s.meter;
Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1,
	\amp,0.2,
	\freq,Pseq([120,50,110,30],inf),
	\tu,1,
	\isRest,Pseq([1
],inf).coin.not)).play;

 Pdef(\y,Pbind(\type, \midi, \dur,1,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([45], inf),\isRest,
	Pseq([
1
	],inf).coin.not
)).play;

MIDIIn.connectAll;

MIDIClient.init;
MIDIClient.destinations;
m = MIDIOut(0);

~i =0;
~chan =0;
Tdef(\seq,{loop{
	~i =(~i+36)%52;
m.noteOn(9, ~i, 127);
	~i.postln;
	0.1.wait;
}}).play;

m.start;
m.stop;

m.noteOn(9, 38, 127);




SynthDef(\kick, {
	arg outBus=0,tu = 1,amp=1,freq=120,rel=0.26;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 0.3, 0], [0.01, 0.5, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([freq, 31, 33], [0.01, 0.29], [-4, -5]));
	env1m = env1.midicps;
	out = LFPulse.ar(env1m*tu, 0, 0.5, 1, -0.5);
	out = out + WhiteNoise.ar(1);
	out = LPF.ar(out, env1m*tu, env0);
	out = out + SinOsc.ar(env1m*tu, 0.5, env0*4);
	out = out * amp;
	out = out.clip2(1);
	Out.ar(outBus, out.dup);
}).send(s);



t = TempoClock.default;
t.tempo = 60/60;

SynthDef("kick", {
	arg outBus=0,tu = 1,amp=1;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([1, 1, 1, 0], [0, 0, 0], [-4, -2, -4]), doneAction:2);
	out = Impulse.ar(1)*env0;
	Out.ar(outBus, out.dup);
}).send(s);

s.meter;
Pdef(\kick).stop;
Pdef(\x).stop;
Pdef(\y).stop;
Pdef(\z).stop;
Pdef(\w).stop;

Pdef(\kick).quant= 4;
Pdef(\x).quant=4;
Pdef(\z).quant=4;
Pdef(\y).quant=4;
Pdef(\w).quant=4;

/*
    35,BD
	36,BD2
	37,RIM
	38,SD1
	39,HCP
	40,SD2
	41,LTOM
	42,CH
	43,LTOM
	44,CH
	45,MTOM
	46,OH
	47,MTOM
	48,HTOM
	49,Crash
	50,HTOM
	51,Ride
	52,
	53,
	54 TAMB
    55
    56, COW
*/

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

 Pdef(\tamb,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([54], inf),\isRest,
	Pseq([
		// Pseq([0,0,0,0,0,0,1,0],3),Pseq([0,0,1,0,0,0,0,0],1),
		 Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;



 Pdef(\ltom,Pbind(\type, \midi, \dur,1/8,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([43], inf),
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










SynthDef(\noise,{arg rel  = 0.25,a=4;
var env0 =  EnvGen.ar(Env.new([0.1, 0.1, 0.3, 0], [0.01, rel], [-4, -2, -4]), doneAction:2);
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
	Out.ar(2,sig*env0);
}).add;

Pdef(\noise).stop;

Pdef(\noise,Pbind(\instrument,\noise,
	\dur,Pseq([Pseq([1/8],28),Pseq([1/2],8)],inf),
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([1],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;
Ndef(\noise,{
	var sig =SinOsc.ar([55.5,55]);
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,0.1);
	sig*1;
}).playN(4,2);

Ndef(\noise).clear;
Pdef(\kick).stop;
Ndef(\noise).free;
Ndef(\noise).fadeTime =10;
Ndef(\noise).quant= 4;
Pdef(\kick).play;
Pbindef(\kick,\dur,1/2,	\freq,Pseq([100],inf),\rel,0.1);
Ndef(\noise,{arg freq=55,amp=1;
	var sig =SinOsc.ar([freq+0.5,freq],SinOsc.kr([0.1,0.2]));
	//sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,0.1);
	sig*amp*LFPulse.kr(0.5/4);
}).playN(4,2);
Ndef(\noise).unset(\amp);
Ndef(\noise).unset(\freq);
Ndef(\noise)[3] = \set->Pbind(\dur,8,\freq,Pseq([55,53],inf),\amp,Pseq([1,1,1,0],inf));
Pdef(\kick).stop;
Pdef(\y).stop;
Pdef(\y).quant = 4;

Pdef(\kick).play;

Pdef(\kick,
	Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/2,
	\amp,0.2,
	\freq,Pseq([120,50,110,30],inf),
	\tu,1,
	\isRest,
		Pseq([1,0,0,0,0,0,1,0],inf).coin.not)).play;


 Pdef(\y,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([45], inf),\isRest,
	Pseq([
		 Pseq([0,0,0,0,0,0,0,0],1),	 Pseq([0,0,0,0,0,0,1,0],1),
		 Pseq([0,0,0,0,1,0,0,0],1),	 Pseq([0,0,0,0,0,0,0,0],1),
		 Pseq([0,0,0,0,1,0,0,0],1),	 Pseq([0,0,0,0,0,0,1,0],1),
	],inf).coin.not
)).play;