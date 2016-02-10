
(
Pdef(\hat3, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\sustain, 0.05,
	\isRest, Pseq([
		Pser([
			Prand([
				Pseq([
					1,0,1,0,
					1,1,1,1,
				],1),
				Pseq([
					0,0,0,0,
					1,0,0,1,
				],1),
			],1),
		],12),
		Pser([
			Prand([
				Pseq([
					0,1,
				],1),
				Pseq([
					1,1,
				],1),
				Pseq([
					1,0,
				],1),
			],1),
		],4),
	],inf).coin.not,
	\rel, Pseq([ 
		Pser([
			0.051,
		],12),
		Pser([
			Prand([
				Pseq([
					0.1,
				],1),
				Pseq([
					0.2,0.1,
				],1),
			],1),
		],4)*1,
	],inf),
	\amp, 0.05
));
)

(
Pdef(\kick2_var3, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		//[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
		[ Env.new([80, 30, 22], [0.055, 0.29], [-4, -5]) ],
		[ Env.new([40, 30, 32], [0.055, 0.29], [-4, -5]) ],
		[ Env.new([80, 30, 22], [0.055, 0.29], [-4, -5]) ],
		[ Env.new([80, 30, 22], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 1,
	\isRest, Pseq([
		0,1,1,0.4, 1,0,0,0,
	],inf).coin.not,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\amp, 0.5
));
)

(
Pdef(\violin4, Pbind(
	\instrument, \violin,
	\degree, [0,2,4],
	//\degree, 0,
	\ctranspose, Pstep(Pseq([
		//-4,-5,-2,-4,
		//0,3,1,5,
		0,3,1,-3,
	],inf),2),
	\scale, Scale.minor,
	\octave, Prand([6],inf),
	\legato, 1/18,
	\lag, Ptuple([Pwhite(0,0.01,inf),0,Pwhite(0,0.01,inf)]),
	\dur, Pseq([1/4,1/8,1/4,1/2,1/4,1/8,1/2],inf),
	\dur, Pseq([1,2,1, 1,1,1,1],inf),
	\isRest, Pseq([
		0,0,1,0, 0,1,0,0,
		0,1,0,0, 1,0,0,1,
	],inf).coin.not,
	\dur, 1/4,
	\timeScale, Pkey(\dur)/13,
	\amp, 0.1
));
)

(
Pdef(\mainx2, Pseq([
		Pfindur(16 * 8,
			Ppar([
				Pdef(\violin2),
				Pdef(\yobass2),

				Pdef(\kick),
				Pdef(\kick2),
				//Pdef(\snare_hat),
				//Pdef(\snare_hat),
				Pdef(\hat3),
			])
		),

])).play
)

Pdef(\mainx2).clear
(
Pdef(\mainx2, Pseq([
	Pdef(\part4,
		Ppar([
			Pdef(\violin4),

			Pdef(\yobass_var4),
			Pdef(\kick),
			Pdef(\kick2_var3),
			Pdef(\snare_hat),
			Pdef(\hat3),
		])
	);
])).play
)

(
Pdef(\yobass_var4,Pbind(
	\instrument, \sfsq,
	\octave,[2,3],
	\ctranspose,Pseq([3],inf),
	\note,Pstep(Pseq([0,0,1,1],inf),1),
	\dur,1/2,
	\legato, 0.7,
	\rel, 1.0,
	\amp, 0.1,
	\at, 0.01,
	\legato, Pseq([
		1,0,1,0, 1,0,1,1,
		3,0,0,0, 0,0,1,1,

		3,0,0,0, 0,0,1,0,
		1,0,0,0, 0,0,1,1,
	] * 4.0,inf),
	\rel, Pkey(\legato) * Pseq([[ 1,2 ]/3],inf),
	\isRest, Pfunc({ arg ev; ev[\legato] <= 0 }),

	\scale,Scale.minor,
	//\isRest,Pseq([1],inf).coin.not
));
)

/////////////////////// part2

Pdef(\violin, Pbind(
	\instrument, \violin,
	\degree, [0,2,4],
	//\degree, 0,
	\ctranspose, Pseq([
		//-4,-5,-2,-4,
		//0,3,1,5,
		0,3,1,-3,
	],inf),
	\scale, Scale.minor,
	\octave, Prand([6],inf),
	\legato, 1/4,
	\lag, Ptuple([Pwhite(0,0.1,inf),0,Pwhite(0,0.1,inf)]),
	\dur, 2,
	\timeScale, Pkey(\dur),
	\amp, 0.1
));

(
Pdef(\hat3, Pbind(
	\instrument, \hat,
	\degree, Pseq([0],inf),
	\dur, 1/8,
	\sustain, 0.05,
	\isRest, Pseq([
		0,0,1,0, 1,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,1,0, 1,0,1,0,
		1,1,1,0, 1,1,1,1,
	],inf).coin.not,
	\rel, Pseq([
		0.1,0.4, 0.1, 0.1,
		0.1, 0.1, 0.1, 0.1,
	],inf).stutter(2),
	\amp, 0.05
)).play;
)

(
Pdef(\kicku, Pbind(
	\instrument, \default,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.1
)).stop;
);
