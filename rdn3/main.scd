
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

Ndef(\noise).set(\freq,10000);
(
Tdef(\effect,{loop{
Ndef(\noise,{
	var in = In.ar(0,2);
	var sig = in;
	sig = Ringz.ar(sig,geom(100,100,1.2231)).mean;
	sig = LPF.ar(sig,5000);
	sig*0.4;
}).play;
	4.wait;
Ndef(\noise,{
	var in = In.ar(0,2);
	var sig = in;
	sig = Ringz.ar(sig,geom(100,1000,1.2231)).mean;
	sig = LPF.ar(sig,5000);
	sig*0.4;
}).play;
	4.wait;
	Ndef(\noise,{
	var in = In.ar(0,2);
	var sig = in;
	sig = Ringz.ar(sig,geom(100,500,1.2231)).mean;
	sig = LPF.ar(sig,5000);
	sig*0.4;
}).play;
	4.wait;
	Ndef(\noise,{
	var in = In.ar(0,2);
	var sig = in;
	sig = Ringz.ar(sig,geom(100,1200,1.2231)).mean;
	sig = LPF.ar(sig,5000);
	sig*0.4;
}).play;
	4.wait;
}}).play;
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
		Pfindur(16,
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
