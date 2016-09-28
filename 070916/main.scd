
///////// init
(
Pdef.defaultQuant = 4;

)



//////////////////////
(
Tdef(\main, {

	// PART 0
		"PART0".postln;

	Ndef(\fx1).play;
/*
	RandDelayNetwork('default').make('fx1', "5-6EMA-T6S4");
Ndef('fx1').put(100, \pset -> Pbind(
	'wet10', 0.388889,
	'fb', 0.003279,
	'delay', 0.000100,
	'delay2', 0.000100,
	'shift', 0.000000,
	'shift2', 0.000000,
	'distamp', 0.449841,
	'pitchlag', 0.125000,
	'pitchmix', 0.500000,
	'prelpf', 17000,
	'prehpf', 17,
	'lpf', 17000,
	'hpf', 17,
	'fbdistamp', 0.476190,
	'fbdistmix', 0.805556,
	'postlpf', 17000,
	'posthpf', 17,
	'wetamp', 1,
	'wet20', 1.000000,
	'mamp', 2.625553,
).keep(1));
	*/


	Pdef(\kick_dpart, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\kick)).play;
	Pdef(\snare_dpart, Pbind(
	\isRest, Pseq([	Pdef(\yep1, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\kick)).play;
	Pdef(\yep2, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0.5,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;






	Pdefn(\seqt1,Pseq([
		1,0,1,0
	],inf));
	Pdef(\snare_ypart,Pbind(\instrument,\snare2,\out,1,\dur,Pseq([Pseq([1/2],24),Pseq([1/4],16)],inf),\amp,Pseq([0,0,0,1,0,0,0.5,0],inf),\isRest,Pseq([0,0,0,1,0,0,1,0],inf).coin.not)).play;
	Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1,
		\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
		\isRest,Pdefn(\seqt1).coin.not,
		\fader,2,
		\mix,Pseq((1..8)/10,inf),
		\rev,Pseq((1..10)/10,inf),
		\pitch,1,
		\amp,1,
	)).play;

	32.wait;
	"PART1".postln;
	///////// PART 1


	RandDelayNetwork('default').make('fx1', "5-93ET-BA74");
Ndef('fx1').put(100, \pset -> Pbind(
	'wet10', 0.388889,
	'fb', 0.009487,
	'delay', 0.000100,
	'delay2', 0.204697,
	'shift', 0.000000,
	'shift2', 0.000000,
	'distamp', 0.177131,
	'pitchlag', 1.000000,
	'pitchmix', 0.883333,
	'prelpf', 17000,
	'prehpf', 17,
	'lpf', 17000,
	'hpf', 17,
	'fbdistamp', 7.259265,
	'fbdistmix', 0.805556,
	'postlpf', 17000,
	'posthpf', 17,
	'wetamp', 1,
	'wet20', 1.000000,
	'mamp', 2.625553,
).keep(1));

		Pdef(\kick_dpart, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\kick)).play;
	Pdef(\snare_dpart, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;

	Pdefn(\seqt1,Pseq([
		1,0,0,1,0,0,1,0
	],inf));
Pdef(\snare_ypart,Pbind(\instrument,\snare2,\out,0,\dur,2,\amp,1,\isRest,Pseq([Pseq([0,1],15),Pseq([0,1],1)],inf).coin.not)).play;
Pdef(\kick_ypart,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;

	32.wait;
	"PART2".postln;
	////////// PART 2


RandDelayNetwork('default').make('fx1', "5-MKS9-KPGR");
Ndef('fx1').put(100, \pset -> Pbind(
	'wet10', 0.388889,
	'fb', 0.000505,
	'delay', 0.002929,
	'delay2', 0.014307,
	'shift', 0.000000,
	'shift2', 0.000000,
	'distamp', 20.000000,
	'pitchlag', 1.000000,
	'pitchmix', 0.405556,
	'prelpf', 17000,
	'prehpf', 17,
	'lpf', 17000,
	'hpf', 17,
	'fbdistamp', 1.340696,
	'fbdistmix', 0.438889,
	'postlpf', 17000,
	'posthpf', 17,
	'wetamp', 1,
	'wet20', 1.000000,
	'mamp', 2.625553,
).keep(1));

	Pdef(\kick_dpart, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,1, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,1, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	)	<>Pdef(\kick)).play;
	Pdef(\snare_dpart, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;
	Pdef(\hat_dpart, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,1,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0, 1,0, 0,0, 0,0,
		0,0, 0,0, 1,0, 1,0,
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		0,0,1,0, 0,1,0,0,
		1,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/4, \amp, 0.051)	<>Pdef(\hat)).play;

	Pdef(\snare_ypart).stop;

	Pdefn(\seqt1,Pseq([
		1,0,1,1,0,0,1,0
	],inf));
Pdef(\kick_ypart,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,1,
)).play;

}).play;
)

Tdef(\main).quant = 4

Pdef.defaultQuant = 0


RandDelayNetwork(\default).make(\fx1, "5--", BusDef(\fx1, \audio, 2))
RandDelayNetwork(\default).getPresetCompileString(\fx1)
RandDelayNetwork(\default).dict[\delay2].asCompileString
RandDelayNetwork(\default).dict[\shift].asCompileString
RandDelayNetwork(\default).dict[\brf].asCompileString
RandDelayNetwork(\default).dict[\flanger].asCompileString
RandDelayNetwork(\default).dict[\dist].asCompileString
RandDelayNetwork(\default).tree

(
~printtree = { arg tree, level=0;
	var xret = "";
	"%% -v \n%".format(
		level.do { xret = xret ++ "\t" }; xret,
		tree.key, tree.value.collect({ arg x;
		if(x.isKindOf(Association)) {
			~printtree.(x, level+1)
		} {
			var ret = "";
				(level+1).do { ret = ret ++ "\t" };
			ret = ret ++ x.asString;
			ret
		}
	}).join("\n")).postln

};
~printtree.(RandDelayNetwork(\default).tree)
)

{ SinOsc.ar(200) }.draw

Ndef(\fx1).clear
(
Ndef(\fx1, {
	var in = InFeedback.ar(BusDef(\fx1), 2);
	var sig = in;
	var si, sig1;
	var end = 0;
	var pitchmix;
		var hasFreq, afreq;
					var pitchlag = \pitchlag.kr(0.1) / TempoClock.default.tempo;
				pitchmix = \pitchmix.kr(0.5);


					sig = sig + (LocalIn.ar(2) * \fb.kr(0.01));
si = sig;
	/*
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + si / 1.2;
	si = BRF.ar(si, exprand(100,10000), 0.5.rand + 0.01) + ( si / 4 );
	si = BRF.ar(si, exprand(100,10000), 0.5.rand + 0.01) + ( si / 4 );
	si = BRF.ar(si, exprand(100,10000), 0.5.rand + 0.01) + ( si / 4 );

	sig = [
		DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si,
		DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si,
		DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si,
		DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si,
	].mean;

	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = (si * 10.rand * \distamp.kr).tanh / 2;

	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = (si * 10.rand * \distamp.kr).tanh / 2;

	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si;
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = (si * 10.rand * \distamp.kr).tanh / 2;

	si = [
		{ arg xsi;

			xsi = BRF.ar(xsi, exprand(100,10000), 0.5.rand + 0.01) + ( xsi / 4 );
			xsi = FreqShift.ar(xsi, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + xsi / 1.2;
		}.value(si),
		{ arg xsi;

			xsi = BRF.ar(xsi, exprand(100,10000), 0.5.rand + 0.01) + ( xsi / 4 );
			xsi = DelayL.ar(xsi, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + xsi;

		}.value(si),
		{ arg xsi;

			xsi = BRF.ar(xsi, exprand(100,10000), 0.5.rand + 0.01) + ( xsi / 4 );
			xsi = [
				FreqShift.ar(xsi, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + xsi / 1.2,
				FreqShift.ar(xsi, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + xsi / 1.2,
			].mean;
		}.value(si),
		{ arg xsi;

			xsi = BRF.ar(xsi, exprand(100,10000), 0.5.rand + 0.01) + ( xsi / 4 );
			xsi = DelayL.ar(xsi, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + xsi;
		}.value(si),

	].mean;
	*/
	si = FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + si / 1.2;
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = (si * 10.rand * \distamp.kr).tanh / 2;
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * SinOsc.kr(0.5.rand).range(1,1.1) * \delay2.kr) + si;
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;
	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;

	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;

	si = DelayL.ar(si, 0.8, rrand(0.01,0.8) * [1, 1+0.01.rand] * \delay.kr) + si;

	si = [
		FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + si / 1.2,
		FreqShift.ar(si, 100.0.rand * [1, 1+0.01.rand] * [1,-1].choose * \shift.kr) + si / 1.2,
	].mean;



sig = si;

					sig1 = sig.tanh * \fbdistamp.kr(1/2.1);
				sig = SelectX.ar(\fbdistmix.kr(1), [sig, sig1]);

				sig = Limiter.ar(sig);

				sig1 = sig;
				#afreq, hasFreq = Pitch.kr(sig1).flop;
				sig1 = BRF.ar(sig1, afreq.lag(pitchlag));
				#afreq, hasFreq = Pitch.kr(sig1).flop;
				sig1 = BRF.ar(sig1, afreq.lag(pitchlag));
				sig = SelectX.ar(pitchmix, [sig, sig1]);

				LocalOut.ar(sig);
				sig = LPF.ar(sig, \postlpf.kr(17000));
				sig = HPF.ar(sig, \posthpf.kr(17));
				sig = Limiter.ar(sig);
				sig = sig * \wetamp.kr(1);

	sig = SelectX.ar(\mix.kr(0.5), [in, sig]);


});
)
s.volume = 0
(
Pdef(\kick_dpart).set(\out, BusDef(\fx1));
Pdef(\snare_dpart).set(\out, BusDef(\fx1));
Pdef(\hat_dpart).set(\out, BusDef(\fx1));
Pdef(\kick_ypart).set(\out, BusDef(\fx1));
Pdef(\snare_ypart).set(\out, BusDef(\fx1));
)
(
Pdef(\kick_dpart).set(\out, 0);
Pdef(\snare_dpart).set(\out, 0);
Pdef(\hat_dpart).set(\out, 0);
Pdef(\kick_ypart).set(\out, 0);
Pdef(\snare_ypart).set(\out, 0);
)
s.meter
Ndef(\fx1).edit
s.plotTree
(
Ndef(\fx1).play;




		Pdef(\kick_dpart, Pbind(
		\isRest, Pseq([
			1,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
			0,0,0,0, 0,0,0,0,
		],inf).coin.not,
		\dur, 1/8,
	\amp, 0.1,
	)	<>Pdef(\kick)).play;
	Pdef(\snare_dpart, Pbind(
	\isRest, Pseq([
		0,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
		1,0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0,0,
	],inf).coin.not,
	//\dur, 1/8, \amp, 0.3)	<>Pdef(\bsnare)).play;
	\dur, 1/8, \amp, 0.3)	<>Pdef(\snare)).play;

	Pdefn(\seqt1,Pseq([
		1,0,0,1,0,0,1,0
	],inf));
Pdef(\snare_ypart,Pbind(\instrument,\snare2,\dur,2,\amp,0.2,\isRest,Pseq([Pseq([0,1],15),Pseq([0,1],1)],inf).coin.not)).play;
Pdef(\kick_ypart,Pbind(\instrument,\t1kick,\dur,1,
	\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\fader,2,
	\mix,Pseq((1..8)/10,inf),
	\rev,Pseq((1..10)/10,inf),
	\pitch,1,
	\amp,0.2,
)).play;
)

Ndef(\fx1).edit
Quarks.gui

(
RandDelayNetwork('default').make('fx1', "5-6EMA-T6S4");
Ndef('fx1').put(100, \pset -> Pbind(
	'wet10', 0.388889,
	'fb', 0.003279,
	'delay', 0.000100,
	'delay2', 0.000100,
	'shift', 0.000000,
	'shift2', 0.000000,
	'distamp', 0.449841,
	'pitchlag', 0.125000,
	'pitchmix', 0.500000,
	'prelpf', 17000,
	'prehpf', 17,
	'lpf', 17000,
	'hpf', 17,
	'fbdistamp', 0.476190,
	'fbdistmix', 0.805556,
	'postlpf', 17000,
	'posthpf', 17,
	'wetamp', 1,
	'wet20', 1.000000,
	'mamp', 2.625553,
).keep(1));
);


(
RandDelayNetwork('default').make('fx1', "5-93ET-BA74");
Ndef('fx1').put(100, \pset -> Pbind(
	'wet10', 0.388889,
	'fb', 0.009487,
	'delay', 0.000100,
	'delay2', 0.204697,
	'shift', 0.000000,
	'shift2', 0.000000,

	'distamp', 0.177131,
	'pitchlag', 1.000000,
	'pitchmix', 0.883333,
	'prelpf', 17000,
	'prehpf', 17,
	'lpf', 17000,
	'hpf', 17,
	'fbdistamp', 7.259265,
	'fbdistmix', 0.805556,
	'postlpf', 17000,
	'posthpf', 17,
	'wetamp', 1,
	'wet20', 1.000000,
	'mamp', 2.625553,
).keep(1));
);