
///////////////////////////////////////////// main

(

	////////////////////////////////// PARTS DEFINE /////////////////


	// intro
	Pdef(\part1,
		Ppar([
			Pdef(\yobass),
			Pdef(\kick),
			Pdef(\kick2),
			Pdef(\snare_hat),
		])
	);
	// refrain
	Pdef(\part2,
		Ppar([
			Pdef(\violin),

			Pdef(\yobass_var2),
			Pdef(\kick),
			Pdef(\kick2_var2),
			Pdef(\snare_hat),
		])
	);
	// refrain sans beat
	Pdef(\part3,
		Ppar([
			Pdef(\violin),

			Pdef(\yobass_var2),
		])
	);

	// variation 1
	Pdef(\part4,
		Ppar([
			Pdef(\violin4),

			Pdef(\yobass_var2),
			Pdef(\kick),
			Pdef(\kick2_var3),
			Pdef(\snare_hat),
			Pdef(\hat3),
		])
	);

	// variation 2
	Pdef(\part5,
			Ppar([
				Pdef(\violin2),
				Pdef(\yobass2),
				Pdef(\kick),
				Pdef(\kick2),
				Pdef(\snare_hat),
			])
	);

)



(
	////////////////////// MAIN LAUNCH !!!!!!!!!!! ///////////////////////////////

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

Pdef(\mainx,
	Pseq([
		Pfindur(16/2,
			//Ppar([
				Pdef(\yobass)
			//])
		),
		Pfindur(16 * 2,
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
		),
		//Pfindur(16 * 2,
		//	Pdef(\part2)
		//),
		Pfindur(8,
			//Ppar([
				Pdef(\yobass)
			//])
		),
		Pfindur(16 * 1,
			Pdef(\part4)
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


////////////////////////////////////////////////////////////////////////: draft

Pdef(\part2).play

Ndef(\noise).set(\freq,10000);

(
Pdef(\mainx, 
	Pdef(\part5)
).play
)

Pdef(\kick2).play
Pdef(\kick2_var2).play


(
Pdef(\mainx2, Pseq([
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


{ SinOsc.ar(200) ! 2 * 0.1}.play;

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
