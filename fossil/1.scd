
SynthDef(\fossil1, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	var bpfreqtab;
	var rqtab = 0.1;
	var asize = 8;

	sig = LFSaw.ar(freq);
	bpfreqtab = Array.series(asize,1,1.1 * SinOsc.kr(1).range(0.5,1.5));
	sig = BPF.ar(sig, 100*bpfreqtab, rqtab);
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp).flop;
	Out.ar(out, sig);
}).add;
