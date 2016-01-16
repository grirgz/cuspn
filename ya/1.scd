
~t = 1
(
Ndef(\honk, { arg freq=200, pan=0, amp=0.1;
	var sig;
	var intrig, in;
	var env1, env2, env3, env4, env5, env6, env7, env8;

	in = SoundIn.ar(0,2) * 10;
	intrig = Amplitude.ar(in) > 0.1;

	env1 = EnvGen.kr( Env([1,4,1/4],[0.001,0.8]), intrig, doneAction:0);
	freq = freq * ( 1 + ( SinOsc.ar(freq) * 1 ));
	sig = SinOsc.ar(freq * env1);
	sig = sig.wrap2( SinOsc.kr(1/7).range(0.2,1) );
	//sig = sig + LFSaw.ar(freq * 1/2 * [1,1.02,1.03]);
	intrig.poll;
	sig = sig * EnvGen.kr( Env([0,1,0],[0.01,0.01]), intrig, doneAction:0);
	sig = HPF.ar(sig, 100);
	sig = LPF.ar(sig, 4000);
	sig = CombL.ar(sig, 4/~t, SinOsc.kr(1/23).range(1/2,1/70)/~t,4/~t) + sig;
	sig = CombL.ar(sig, 4/~t, SinOsc.kr(1/20).range(1/2,1/80)/~t,4/~t) + sig;
	sig = sig * 0.5;
	//sig = Pan2.ar(sig, pan, amp).mean;
	sig = Splay.ar(sig, 0.1, amp, SinOsc.kr(8).range(-1,1));
}).play;
);

{ SinOsc.ar(200) ! 2 * 0.1}.play;

(
Ndef(\honk, { arg freq=200, pan=0, amp=0.1;
	var sig;
	var intrig, in;
	var env1, env2, env3, env4, env5, env6, env7, env8;

	in = SoundIn.ar(0,2) * 10;
	intrig = Amplitude.ar(in) > 0.1;

	env1 = EnvGen.kr( Env([0,4,1/4],[0.001,0.1]), intrig, doneAction:0);
	freq = freq * ( 1 + ( SinOsc.ar(freq) * 1 ));
	sig = SinOsc.ar(freq * env1);
	sig = sig + LFSaw.ar(freq * env1);
	sig = sig.wrap2( SinOsc.kr(1/7).range(0.2,1) );
	//sig = sig + LFSaw.ar(freq * 1/2 * [1,1.02,1.03]);
	intrig.poll;
	sig = sig * EnvGen.kr( Env([0,1,0],[0.01,0.07]), intrig, doneAction:0);
	sig = HPF.ar(sig, 100);
	sig = LPF.ar(sig, 4000);
	sig = CombL.ar(sig, 4/~t, 1/2/~t,4/~t) + sig;
	sig = CombL.ar(sig, 4/~t, 1/8/~t,1/2/~t) + sig;
	sig = sig * 0.5;
	//sig = Pan2.ar(sig, pan, amp).mean;
	sig = Splay.ar(sig, 0.1, amp, SinOsc.kr(8).range(-1,1));
}).play;
);
Ndef(\honk).edit
Ndef(\honk).stop

~t = 1;
(
Ndef(\bari).put(0, { arg freq=100, pan=0, amp=0.1;
	var sig;
	var in;
	sig = LFSaw.ar(freq * ( 1 + ( SinOsc.ar(freq * SinOsc.kr(1/8 * [1,\fmdec.kr(1.1)]).range(4,1)) * SinOsc.kr(\fmlfof.kr(1/4)).range(0,\fmlfoamp.kr(100)) )));
	in = SoundIn.ar(0,2);
	//in = SinOsc.ar(freq)  * LFPulse.ar(1/2).range(0,1);
	sig = LFPulse.ar(freq * [1,1.01]) + sig;
	sig = RLPF.ar(sig, \lpf.kr(200), \rq.kr(0.5));
	sig = SinOsc.ar(freq) + sig; 
	//sig = sig * Duty.kr(1/8/~t, 0, Dseq([
	//	1,0,1,0,
	//	1,0,1,0,
	//	1,1,1,1,
	//	1,1,1,1,
	//],inf)).lag(0.01);
	sig = Compander.ar(sig, in, \compt.kr(0.4), \complo.kr(1.001), \comphi.kr(0.9), clampTime:\clamp.kr(1), relaxTime:\relax.kr(0.01));
	//sig = Pan2.ar(sig, pan, amp);
	sig = Splay.ar(sig, 0.1, amp, SinOsc.kr(1/5).range(-1,1) * SinOsc.kr(1/12).range(0,1));
}).play;
Ndef(\bari).unset(\freq);
Ndef(\bari).unset(\lpf);
Ndef(\bari).put(1, \set -> Pbind(
	\lpf, Pseq([100,400,200,Pwhite(100,1000,1)],inf),
	\dur, 4,
));

);
(
Ndef(\bari).put(1, \set -> Pbind(
	\lpf, Pseq([100,80,120,Pwhite(10,200,1)],inf),
	\dur, 4/1,
));
)

Ndef(\bari).edit


(
Ndef(\comp, { arg freq=200, pan=0, amp=0.1;
	var sig;
	var in;
	//in = InFeedback.ar(\inbus.kr(BusDef(\zero, \audio)), 2); 
	in = SoundIn.ar([0,1]);
	in.debug("in");
	sig = in;
	sig = sig * 4;
	sig;
}).play;
);
Ndef(\comp).clear

(
Ndef(\honk, { arg freq=200, pan=0, amp=0.1;
	var sig;
	var intrig, in;
	var env1, env2, env3, env4, env5, env6, env7, env8;

	in = SoundIn.ar(0,2) * 10;
	intrig = Amplitude.ar(in) > 0.1;

	env1 = EnvGen.kr( Env([0,4,1/4],[0.001,0.1]), intrig, doneAction:0);
	freq = freq * ( 1 + ( SinOsc.ar(freq) * 1 ));
	sig = SinOsc.ar(freq * env1);
	sig = sig + LFSaw.ar(freq * env1);
	sig = sig.wrap2( SinOsc.kr(1/7).range(0.2,1) );
	//sig = sig + LFSaw.ar(freq * 1/2 * [1,1.02,1.03]);
	intrig.poll;
	sig = sig * EnvGen.kr( Env([0,1,0],[0.01,0.07]), intrig, doneAction:0);
	sig = HPF.ar(sig, 100);
	sig = LPF.ar(sig, 4000);
	sig = CombL.ar(sig, 4/~t, 1/2/~t,4/~t) + sig;
	sig = CombL.ar(sig, 4/~t, 1/8/~t,1/2/~t) + sig;
	sig = sig * 0.5;
	//sig = Pan2.ar(sig, pan, amp).mean;
	sig = Splay.ar(sig, 0.1, amp, SinOsc.kr(8).range(-1,1));
}).play;
);

Ndef(\honk).stop

(
Ndef(\plop, { arg freq=200, pan=0, amp=0.1;
	var sig;
	sig = SinOsc.ar(freq * LFSaw.ar(1/2*~t).range(0.4,1)) * LFPulse.ar(1/2*~t,0,0.1);
	sig = Pan2.ar(sig, pan, amp);
}).play;
);

TempoClock.default.tempo = ~t = 180/60
Ndef.defaultQuant = 1;
