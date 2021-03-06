MIDIdef.noteOn(\part1,{"part1".postln; Pdef(\main, Pdef(\part1)).play;},32);
MIDIdef.noteOn(\part2,{"part2".postln; Pdef(\main, Pdef(\part2)).play;},24);
MIDIdef.noteOn(\part3,{"part3".postln; Pdef(\main, Pdef(\part3)).play;},16);
MIDIdef.noteOn(\part4,{"part4".postln; Pdef(\main, Pdef(\part4)).play;},8);
MIDIdef.noteOn(\part5,{"part5".postln; Pdef(\main, Pdef(\part5)).play;},0);
Pdef(\main, Pdef(\part1)).play;Pdef(\main, Pdef(\part1)).play;
Pdef(\main, Pdef(\part1)).play;
MIDIIn.connectAll
///////////////////////////////////////////// main

~out1 = Bus.audio(s, 1);
~out2 = Bus.audio(s, 1);
~out3 = Bus.audio(s, 1);
~out4 = Bus.audio(s, 1);

~out56 = Bus.audio(s, 2);
~out78 = Bus.audio(s, 2);

~out3 = Bus.audio(s, 1);
~out4 = Bus.audio(s, 1);
Pdef(\kick).set(\out, ~out1)
Pdef(\kick2).set(\out, ~out1)


Pdef(\yobass).set(\out, 6);
Pdef(\yobass_var2).set(\out, 6);
Pdef(\snare_hat).set(\out, 2);
Pdef(\violin).set(\out, 2);
Pdef(\violin4).set(\out, 2);
Pdef(\violin2).set(\out, 2);
Pdef(\kick2_var3).set(\out, 4);
Pdef(\kick2_var2).set(\out, 4);

Pdef(\kick).set(\out, 0);
Pdef(\kick2).set(\out, 1);

			Pdef(\kick).play;
			Pdef(\kick2).play;
			Pdef(\snare_hat).play;


s.meter
s.volume = -10

(
	Pdef(\all, Ppar([
			Pdef(\yobass),
			Pdef(\kick),
			Pdef(\kick2),
			Pdef(\snare_hat),
			Pdef(\violin),
	])).play;
	)
Ndef(\fx1).clear
(
Ndef(\fx1, {
	var in = SoundIn.ar(1);
	//in * LFSaw.ar(130&0);
	in= FreeVerb.ar(in,1,1,1);
in !2;
}).play;
)




s.meter;
(

	////////////////////////////////// PARTS DEFINE /////////////////
TempoClock.default.tempo = 70/60;

	Pdef(\all, Ppar([
			Pdef(\yobass),
			Pdef(\kick),
			Pdef(\kick2),
			Pdef(\snare_hat),
			Pdef(\violin),
	]));

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
s.makeGui;
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

s.meter;

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
	],inf)
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
