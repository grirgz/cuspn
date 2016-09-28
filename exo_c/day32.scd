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


// clavier / break + synth
// pad sample + break
// uc 33


t.tempo = 120/60

Pdef(\kick).quant= 4;
Pdef(\clap).quant= 4;
Pdef(\hh).quant= 4;
Pdef(\tamb).quant= 4;
Pdef(\bass).quant=4;

Pdef(\kick,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([35], inf),
	\amp,1,
	\isRest,
	Pseq([
 Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,0,0,0,0,0,0],1)
	],inf).coin.not
)).play;

Pdef(\clap,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([38], inf),
	\amp,1,
	\isRest,
	Pseq([
		Pseq([0,0,0,0,1,0,0,0],1), Pseq([0,0,0,0,0,0,0,0],1)
	],inf).coin.not
)).play;

Pdef(\hh).clear

Pdef(\hh,Pbind(\type, \midi, \dur,1/8,\chan, 9, \lag,0.01,
	\amp,1,
	\midicmd, \noteOn, \midiout, m,\midinote, Pseq([44], inf),\isRest,
	Pseq([
		 Pseq([0,1,0,1,0,1,0,1],8)
	],inf).coin.not
)).play;

t = TempoClock.default;
t.tempo = 70/60;

 Pdef(\tamb,Pbind(\type, \midi, \dur,1/4,\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,\midinote, Pseq([54], inf),
		\amp,1,
	\isRest,
	Pseq([
		 Pseq([0,0,0,0,0,0,1,0],1)
		// Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0,1,0,0,0],1),
		// Pseq([1,0,0,1,0,0,1,0],1),Pseq([1,0,0,0,0,0,0,1],1)
	],inf).coin.not
)).play;



Pdef(\bass).play;


s.scope




SynthDef(\bass, { arg freq = 423, amp = 0.5, gate = 1,lrate=52;
	var snd, env, oscfreq, output;
	var lfo;
	lfo = { SinOsc.kr({ 1/lrate }) };
	env = Env.adsr(0.07, 1, 0.9, 0.1).kr(doneAction:2, gate: gate);
	output = LFSaw.ar( SinOsc.kr(100,0,50,freq),[0,0.5],mul: lfo.value.range(0,1))*LFSaw.ar(freq*2,[0.5,0],0.8);
	output = RLPF.ar(output, (env) + 1*freq, lfo.value.range(0.1,1));
	output = output.tanh.distort;
	output = output * env * amp;
	Out.ar(0, output);
	}).add;
Pdef.clear;

Pdef(\bass, Pbind(
	\instrument, \bass,
	\ctranspose, Pseq([-26,-25],inf),
	\degree,1,
	\dur, 4,
	\legato, 1.0,
	\amp, 1,
)).play;


Pdef(\mtom,Pbind(\type, \midi, \dur,Pseq([Pseq([1/8],120),Pseq([1/16],16)],inf),\chan, 9, \lag,0.01,\midicmd, \noteOn, \midiout, m,
	\midinote,Pseq([48,47], inf),
	//\amp,1,
	\amp,Prand([0.2,0.01,0.3],inf),
	\isRest,Pseq([
	//Pseq([0,1,0,1,1,0,0,1],3),Pseq([1,0,1,1,0,1,1,1],1),
	Pseq([1,0,1,0,1,1,1,0],15),Pseq([1,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1],1)
],inf).coin.not)).play;



Ndef(\noise,{arg freq=55,amp=1;
	var sig =SinOsc.ar([freq+0.5,freq],SinOsc.kr([0.1,0.2]));
	//sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,0.1);
	sig*amp*LFPulse.kr(0.5/4);
}).playN(4,2);


Ndef(\noise).unset(\amp);
Ndef(\noise).unset(\freq);
Ndef(\noise)[3] = \set->Pbind(\dur,8,\freq,Pseq([55,53],inf),\amp,Pseq([1,1,1,1],inf));


SynthDef(\noise,{arg rel  = 0.01,a=4;
var env0 =  EnvGen.ar(Env.new([0.1, 1, 0.3, 0], [0.01, rel], [-4, -2, -4]), doneAction:2);
var sig = CuspN.ar(
		SampleRate.ir/a,
		LFNoise2.kr([4,4],1.5,1.5),
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
	//\rel,Pseq([Pseq([2],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;



Pdef(\noise,Pbind(\instrument,\noise,
	\dur,1/4,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([0.01],28),Prand([0.01,0.01,0.001,0.001],1)],inf).coin.not,
	\isRest,Pseq([Pseq([0,0,1],28),1,0.1,0.5,1],inf).coin.not)).play;


t = TempoClock.default;
t.tempo = 60/60;

SynthDef(\son2, {
	arg outBus=2,tu = 1,amp=1,freq=3000,rel=0.06;
	var env0, env1, env1m, out;
	env0 =  EnvGen.ar(Env.new([0.3, 0.7, 0.3, 0], [0.004, 0.1, rel], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([15000,freq], [0.001, 0.29], [-4, -5]));
	out = SinOsc.ar(env1,0,env0);
	out = CombL.ar(out,0.02,0.001,1)+out;
	out = DelayL.ar(out,0.02,0.001,1)+out;
	out = CombL.ar(out,0.02,0.01,1)+out;
	out = CombL.ar(out,0.02,0.001,1)+out;
	out = out.clip2(1)*amp;
	Out.ar(outBus, out.dup/4);
}).send(s);

Pdef(\son2).stop;
Pdef(\son2).quant =0;

(
Pdef(\son2,Pbind(
	\instrument,\son2,
	\amp,0.1,
	\dur,Pseq([1/4],inf),
	\isRest,Prand([0.5,0.05,0.1,0.2],inf).coin.not,   \freq,Pseq([Pseq([1700],4),Pseq([2200],4),Pseq([3600],4),Pseq([2500],4)],inf)
)).play;
)