
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

//////////////// fx

Tdef(\effect1,{loop{
	Ndef(\noise,{
		var in = In.ar(0,2);
		var sig = in;
		sig = Ringz.ar(sig,geom(20,31.midicps,1.2)*Line.kr(2,1,1)).mean;
		sig = LPF.ar(sig,14029);
		sig = HPF.ar(sig,100);
		sig = Limiter.ar(sig,0.6);
		sig!2*0.1;
	}).play;
	2.wait;
	Ndef(\noise).stop(2);
	2.wait;
	Ndef(\noise,{
		var in = In.ar(0,2);
		var sig = in;
		sig = Ringz.ar(sig,geom(20,34.midicps,1.2)).mean;
		sig = LPF.ar(sig,15000);
		sig = HPF.ar(sig,500);
		sig = Limiter.ar(sig,0.6);
		sig!2*0.1;
	}).play;

	2.wait;
	Ndef(\noise).stop(2);
	2.wait;

	Ndef(\noise,{
		var in = In.ar(0,2);
		var sig = in;
		sig = Ringz.ar(sig,geom(20,23.midicps,1.2)*Line.kr(2,1,2)).mean;
		sig = LPF.ar(sig,15000);
		sig = HPF.ar(sig,500);
		sig = Limiter.ar(sig,0.6);
		sig!2*0.1;
	}).play;


	2.wait;
	Ndef(\noise).stop(2);
	2.wait;

	Ndef(\noise,{
		var in = In.ar(0,2);
		var sig = in;
		sig = Ringz.ar(sig,geom(100,14.midicps,1.223)).mean;
		sig = LPF.ar(sig,15000);
		sig= HPF.ar(sig,500);
		sig = Limiter.ar(sig,0.6);
		sig!2*0.1;
	}).play;

	2.wait;
	Ndef(\noise).stop(2);
	2.wait;
}});



)
s.meter;
FreqScope.new;

(
	////////////////////// MAIN LAUNCH !!!!!!!!!!! ///////////////////////////////
s.volume = -15;

Tdef(\effect2,{
	4.do{
		Ndef(\noise2,{
			var in = In.ar(0,2);
			var sig = in;
			sig = sig + WhiteNoise.ar(2);
			sig = Ringz.ar(sig,geom(20,31.midicps,1.2)*Line.kr(1,2,1)).mean;
			sig = LPF.ar(sig,14029);
			sig = HPF.ar(sig,100);
			sig = Limiter.ar(sig,0.6);
			sig!2*0.1;
		}).play;
		4.wait;
		Ndef(\noise2,{
			var in = In.ar(0,2);
			var sig = in;
			sig = sig + WhiteNoise.ar(2);
			sig = Ringz.ar(sig,geom(20,31.midicps,1.2)*Line.kr(2,1/2,1)).mean;
			sig = LPF.ar(sig,14029);
			sig = HPF.ar(sig,100);
			sig = Limiter.ar(sig,0.6);
			sig!2*0.1;
		}).play;
		4.wait
	};
	Ndef(\noise2).stop
});



Pdef(\mainx,
	Pseq([

		//// only bass

		//Pfset({
		//	Task({
		//		5.wait;
		//		Tdef(\effect1).play;
		//		3.wait;
		//		Tdef(\effect1).stop;
		//	}).play
		//}),
		//Pfindur(8,
		//	//Ppar([
		//		Pdef(\yobass)
		//	//])
		//),

		// intro

		Pfset({
			Task({
				24.wait;
				Tdef(\effect1).play;
				8.wait;
				Tdef(\effect1).stop;
			}).play
		}),



		Pfindur(16 * 2,
			Pdef(\part1)
		),
		// refrain
		//

		Pfset({
			Task({
				24.wait;
				Tdef(\effect1).play;
				8.wait;
				Tdef(\effect1).stop;
			}).play
		}),
		Pfindur(16 * 2,
			Pdef(\part2)
		),

		///////// break
		Pfset({
			Task({
				4.wait;
				Tdef(\effect2).play;
				16.wait;
				Tdef(\effect2).stop;
				Ndef(\noise2).stop;
			}).play
		}),

		Pfindur(7,
			Pdef(\part3)
		),
		Rest(1),

		/////// var 1
		/*
		Pfset({
			Task({
				8.wait;
				Tdef(\effect1).play;
				8.wait;
				Tdef(\effect1).stop;
			}).play
		}),
		*/
		Pfset({
			Task({
				16.wait;
				Tdef(\effect2).play;
				16.wait;
				Tdef(\effect2).stop;
				Ndef(\noise2).stop;
			}).play
		}),
		Pfindur(16 * 2,
			Pdef(\part5)
		),

		//////// only bass

		Pfset({
			Task({
				0.wait;
				Tdef(\effect2).play;
				8.wait;
				Tdef(\effect2).stop;
				Ndef(\noise2).stop;
			}).play
		}),
		Pfset({
			Task({
				4.wait;
				Tdef(\effect1).play;
				4.wait;
				Tdef(\effect1).stop;
			}).play
		}),
		Pfindur(8,
			//Ppar([
				Pdef(\yobass)
			//])
		),

		// var 2

		Pfset({
			Task({
				16.wait;
				Tdef(\effect1).play;
				16.wait;
				Tdef(\effect1).stop;
			}).play
		}),

		Pfindur(32 * 1,
			Pdef(\part4)
		),

		// repeat


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

Pdef(\part3).play

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
