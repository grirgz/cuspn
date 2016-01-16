(
	16+27
SynthDef(\imp, { arg out=0, amp=0.1, gate=1, pan=0, freq=200;
	var sig;
	sig = Impulse.ar(1);
	sig = sig * 48;
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
);

(
Pdef(\imp, Pbind(
	\instrument, \imp,
	\freq, 100,
	\sustain, 0.4,
)).play;
)

{ SinOsc.ar(200) ! 2 * 0.1}.play;
