
SynthDef(\dr_kick, { |out=0, amp=0.1, pan=0, fratio=1.5, freqpan=0.01, spread=0.08, timeScale=1|
	var env0, env1, env1m, son;

	//freqpan = [-1,0,1] * freqpan;
	freqpan = [1,0,-1] * freqpan;
	env0 = \env0.kr(Env.new([0, 1, 0.5, 0], [0.105, 0.16, 00.2], [-4, -2, -4]));
	env1 = \env1.kr(Env.new([110, 32, 29], [0.105, 0.29], [-4, -5]));
	
	env0 =  EnvGen.ar(env0, doneAction:2, timeScale:timeScale);
	env1 = EnvGen.ar(env1, timeScale:timeScale);
	env1m = env1.midicps;
	
	son = LFPulse.ar(env1m * freqpan, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, env1m*fratio, env0);
	son = son + SinOsc.ar(env1m, 0.5, env0);
	
	son = son * 1.2;
	son = son.clip2(1);

	son = son * amp;
	son = Splay.ar(son, spread, amp, pan);
	
	OffsetOut.ar(out, son);
}, metadata:(specs:(
	//env0: XEnvSpec( ControlSpec(0,9,\lin)!4, ControlSpec(0,2,\lin)!4 ),
	//env1: XEnvSpec( ControlSpec(0,127,\lin)!3, ControlSpec(0,2,\lin)!3 ),
	timeScale: ControlSpec(0.001,4,\lin, 0, 1),
))).store;


Pdef(\piano, Pbind(
	\instrument, \default,
	\degree, Prand((1..8),inf),
	\octave, Prand((3..6),inf),
	\isRest, Pseq([
		1,0.4
	],inf).coin.not,
	\dur, 1/8,
	\amp, 0.1
));

Pdef(\drkik1,Pbind(
	\instrument, \dr_kick,
	\freq, 200,
	\amp, 0.5,
	\dur, 1,
));

Pdef(\drkik2,Pbind(
	\instrument, \dr_kick,
	\freq, 200,
	\amp, 0.5,
	\dur, 1/2,
));


//////// fx

Spec.add(\lpf, \freq.asSpec);
Spec.add(\hpf, \freq.asSpec);
Spec.add(\plpf, \freq.asSpec);
Spec.add(\phpf, \freq.asSpec);
Spec.add(\delay2, \delay.asSpec);

Spec.add(\wet10, \unipolar.asSpec);

Ndef(\echo2).put(0, { DC.ar(0!2) });
Ndef(\echo2).put(20, \filter -> { arg in;
	// master volume
	in * \mamp.kr(1)
});

////////////// ugen generation

	~transform = { 
		var block, algo;
		block = [
			\delay, \delay, \delay, \bpf, \shift
		].choose;
		algo = [
			\par, \seq
		].choose;
		if(algo == \par) {
			\par -> [2,4].choose.collect({
				\seq -> [ block, \end ]
			})
		} {
			\seq -> (block ! [1,4].choose) ++ [\end ]
		}
	};

	~seqcollect = { arg in, fun;
		if(in.isKindOf(Association)) {
			in.key -> in.value.collect(fun)
		} {
			in;
		}
	};

	~transcollect = { arg in;

		~seqcollect.(in, { arg el;
			if(el == \end) {
				~transform.()
			} {
				~transcollect.(el)
			}
		})
	};

	~interpret = { arg sig, in, dict, envir;
		if(in.isKindOf(Association)) {
			switch(in.key, 
				\par, {
					in.value.collect({ arg el;
						~interpret.(sig, el, dict)
					}).mean
				},
				\seq, {
					in.value.do({ arg el;
						sig = ~interpret.(sig, el, dict)
					});
					sig;
				}
			)
		} {
			dict[in].value(sig, envir)
		}
	};

	~gentree = { arg count, trans;
		var acc, ini;
		ini = \seq -> [\end];
		acc = ini;
		count.do {
			acc = ~transcollect.(acc, trans);
		};
		acc;
	};

	/////// to customize

	~dict = IdentityDictionary.newFrom([
		\delay, { arg si;
			DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
		},
		\delay2, { arg si;
			DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay2.kr) + si;
		},
		\flanger, { arg si;
			DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si;
		},
		\shift, { arg si;
			FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + si / 1.2;
		},
		\shift2, { arg si;
			FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift2.kr) + si / 1.2;
		},
		\bpf, { arg si;
			BPF.ar(si, exprand(100,10000), 0.5.rand + 0.01) + ( si / 4 );
		},
		\brf, { arg si;
			BRF.ar(si, exprand(100,10000), 0.5.rand + 0.01) + ( si / 4 );
		},
		\dist, { arg si;
			(si * 10.rand * \distamp.kr).tanh / 2;
		},
		\end, { arg si;
			si;
		}
	]);

	~transform = { 
		var block, algo;
		block = [
			\flanger!4,
			\delay!8,
			\delay2!8,
			\bpf!2, 
			\brf!2,
			\shift!4,
			\shift2!4,
			\dist!2,
		].flatten.choose;
		algo = [
			\par, \seq
		].wchoose([0.1,0.9].normalizeSum);
		if(algo == \par) {
			\par -> [2,4].choose.collect({
				\seq -> [ block, \end ]
			})
		} {
			\seq -> ([block] ++ (\end ! [1,2].choose))
		}
	};

	////////

	Ndef(\echo2).quant = 2;
	Ndef(\lfo1).quant = 2;
	Ndef(\echo2).fadeTime = 0.2;
