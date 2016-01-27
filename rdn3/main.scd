
///////////////////////////////////////////// main

(
	Pdef(\part1,
		Ppar([
			Pdef(\yobass),
			Pdef(\kick),
			Pdef(\kick2),
			Pdef(\snare_hat),
		])
	);
	Pdef(\part2,
		Ppar([
			Pdef(\violin),

			Pdef(\yobass_var2),
			Pdef(\kick),
			Pdef(\kick2_var2),
			Pdef(\snare_hat),
		])
	);
	Pdef(\part3,
		Ppar([
			Pdef(\violin),

			Pdef(\yobass_var2),
		])
	);
)

(
Pdef(\mainx,
	Pseq([
		Pfindur(16/2,
			//Ppar([
				Pdef(\yobass)
			//])
		),
		Pfindur(16 * 1,
			Pdef(\part1)
		),
		Pfindur(16 * 2,
			Pdef(\part2)
		),
		Pfindur(7,
			Pdef(\part3)
		),
		Rest(1),
		Pfindur(16 * 1,
			Ppar([
				Pdef(\violin2),
				Pdef(\yobass2),

				Pdef(\kick),
				Pdef(\kick2),
				Pdef(\snare_hat),
			])
		),
		Pfindur(16 * 2,
			Pdef(\part2)
		),
		Pfindur(8,
			//Ppar([
				Pdef(\yobass)
			//])
		),
	])
).play
)

(
Pdef(\mainx, Pseq([
		Pfindur(7,
			Pdef(\part3)
		),
		Pbind(
			\instrument, \hat,
			\dur, 1/4,
		),
		Pfindur(16 * 1,
			Ppar([
				Pdef(\violin2),
				Pdef(\yobass2),

				Pdef(\kick),
				Pdef(\kick2),
				Pdef(\snare_hat),
			])
		),

])).play
)



(
	[
		Pdef(\violin),

		Pdef(\yobass),
		Pdef(\kick),
		Pdef(\kick2),
		Pdef(\snare_hat),
	].collect(_.play)
)

(
Pdef(\yobass_var2,Pbind(
	\instrument,
	\sfsq,
	\octave,3,
	\ctranspose,Pseq([3],inf),
	\note,Pseq([0,0,1,1],inf).stutter(2),
	\dur,1,
	\legato, 0.3,
	\rel, 1.5,
	\at, 0.1,
	\isRest, Pseq([
		1,0,0,0, 1,0,1,1,
		1,0,0,0, 0,0,1,1,

		1,0,0,0, 0,0,1,0,
		1,0,0,0, 0,0,1,1,
	],inf).coin.not,
	\scale,Scale.minor,
	//\isRest,Pseq([1],inf).coin.not
));
)
Pdef(\yobass).stop;

(
Pdef(\kick2_var2, Pbind(
	\instrument, \dr_kick,
	\env1, Pseq([
		[ Env.new([80, 32, 29], [0.055, 0.29], [-4, -5]) ],
	],inf),
	\timeScale, 1,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,

		0,0,1,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,

		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,

		0,0,0,1, 0,0,1,0,
		0,0,1,0, 0,1,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,0,1,0,
	],inf).coin.not,
	\fratio, 1,
	\degree, Pseq([0],inf),
	\dur, 1/4,
	\amp, 0.8
)).play;
)
Pdef(\kick2).stop
