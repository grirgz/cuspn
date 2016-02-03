
///////////////////////////////////////////// main

Pdef(\kick2).play
Pdef(\kick2_var2).play

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

Pdef(\part2).play

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
	[
		Pdef(\violin),

		Pdef(\yobass),
		Pdef(\hat3),
		//Pdef(\kick2),
		//Pdef(\snare_hat),
	].collect(_.play)
)

Pdef(\kick).stop
Pdef(\kick2).stop
Pdef(\snare_hat).stop

(
)
Pdef(\yobass).stop;

(
)
Pdef(\kick2).stop
