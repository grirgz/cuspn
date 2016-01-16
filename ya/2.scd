
(
Ndef(\plop, { arg freq=200, pan=0, amp=0.1;
	var sig;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	freq = freq * ( 1 + ( SinOsc.ar(43 * ( 1 + ( SinOsc.kr(1/34) * 40 )) * (1..6)) * 1 ));
	sig = SinOsc.ar(freq);
	sig1 = LFSaw.ar(freq);
	sig = SelectX.ar( SinOsc.kr(1/3).range(0,1), [sig, sig1]);
	sig = RLPF.ar(sig, \lpf.kr(1000), \rq.kr(0.5));
	sig = FreqShift.ar(sig, SinOsc.kr(1/54).range(0,100));
	sig = Splay.ar(sig, 0.3, amp, pan) * 0.3;
}).play;
);

(
Pdef(\cari, Pbind(
	\instrument, \dr_oscsampler,
	\sustain, 0.01,
	\pos, Pseq([0.1,0.11],inf),
	\isRest, Pseq([
		1,1,0,0, 1,1,1,1,
	],inf).coin.not,
	\timeScale, 5,
	\timeScale, Ndef(\lfo1, { SinOsc.kr(1/36).range(15,3)  }),
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\dur, PdurStutter(Pseq([1,4, 8, 16],inf), 1),
	\amp, 0.1 * 2,
)).play;
);

Pdef(\cari).asParamGroup.edit
TracksGroup(\ber, [Pdef(\cari)]).edit
Track
Ndef(\plop).edit


(
SynthDef(\vroum, { arg out=0, amp=0.1, gate=1, pan=0, freq=200, fspread=0.1;
	var sig;
	sig = LFPulse.ar(freq * ((0..7)/7 - 0.5 * fspread + 1));
	sig = RLPF.ar(sig, \lpf.kr(1000), \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.adsr(0.01,0.1,0.8,0.1),gate,doneAction:2);
	sig = Splay.ar(sig, 0.3, amp, pan);
	Out.ar(out, sig);
}).add;
);

(
Pdef(\vroum, Pbind(
	\instrument, \vroum,
	\degree, Pseq([0],inf),
	\degree, Pwhite(0,37.0),
	\sustain, 0.1,
	\octave, 4,
	\dur, 1,
	\amp, 0.1
)).play;
);

(
	Ndef(\vroumlfo1, { SinOsc.kr(1).range(50,10000)  });
	Pdef(\vroum, 

		Ppar(
			10.collect({ arg x;
				Ndef(\vroumlfo3+++x, { SinOsc.kr(1.3 + x).range(0.03,1) });
				Pbind(
					\instrument, \vroum,
					\lpf, Ndef(\vroumlfo1+++x, { SinOsc.kr(1.2 + x).range(50,10000)  }),
					\fspread, Ndef(\vroumlfo2+++x, { SinOsc.kr(1.1 + x).exprange(0.0001,1)  }),
					\degree, Pwhite(0,37.0),
					\degree, Pseq([x],inf),
					\sustain, Pfunc({ Ndef(\vroumlfo3+++x).asBus.getSynchronous }),
					\octave, 3,
					\dur, 4/1 * (x*0.1+1),
					\amp, 0.1  
				)

			})
		)
	).play;
);

Pdef(\vroum).stop
