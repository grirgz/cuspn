
s.boot
Quarks.gui
Quarks.install("JITLibExtensions")

RandDelayNetwork(\default).make(\fx1, "5--");
Ndef(\fx1).play;
Ndef(\fx1).edit;
RandDelayNetwork(\default).make(\fx1, "5-T1KJ-J6JA5", BusDef(\fx1, \audio)); // cool distobass


MIDIMap(\k1, Param(Ndef(\fx1), \fb));
MIDIMap(\k2, Param(Ndef(\fx1), \delay));
MIDIMap(\k3, Param(Ndef(\fx1), \delay2));
MIDIMap(\k4, Param(Ndef(\fx1), \shift));
MIDIMap(\k4, Param(Ndef(\fx1), \shift));
(
[
	\fb,
	\delay,
	\delay2,
	\distamp,

	\pitchmix,
	\pitchlag,
	\shift,
	\shift2,

	\mamp,

	\prelpf,
	\prehpf,
	\lpf,
	\hpf,

	\postlpf,
	\posthpf,
	\fbdistamp,
	\fbdistmix,
].collect({ arg key, x; 
	var tt = (1..9).collect({ arg x; (\k++x).asSymbol }) ++ (1..9).collect({ arg x; (\s++x).asSymbol });
	MIDIMap(tt[x].debug("fdf"), Param(Ndef(~name+++\fx1), key));
});

MIDIMap(\a1, { Ndef(\fx1).set(\shift, 0, \shift2, 0) });
MIDIMap(\a2, { Pdef(\main, Pdef(\part1_dry)).play; });
MIDIMap(\a3, {
	Ndef(\fx1).play;
	Pdef(\main, Pdef(\part2_wet)).play;
});
MIDIMap(\a4, {
	Pdef(\main, Ppar([Pdef(\part1_dry), Pdef(\part2_wet)])).play;
});
MIDIMap(\a5, {
	Pdef(\main, Ppar([Pdef(\part1_wet), Pdef(\part2_dry)])).play;
});
MIDIMap(\a6, {
	Pdef(\main, Ppar([Pdef(\part3_dry), Pdef(\part2_wet)])).play;
});
MIDIMap(\a7, {
	Pdef(\main, Ppar([Pdef(\part3_wet), Pdef(\part2_dry)])).play;
});
//MIDIMap(\loop, {
//	RandDelayNetwork(\default).make(\fx1, "5--", BusDef(\fx1, \audio));
//});
//MIDIMap(\c1, {
//	RandDelayNetwork(\default).make(\fx1, "5-FIN-A7H1", BusDef(\fx1, \audio));
//});
//MIDIMap(\c2, {
//	RandDelayNetwork(\default).make(\fx1, "5-33RR-LVPC", BusDef(\fx1, \audio));
//});
//MIDIMap(\c3, {
//	RandDelayNetwork(\default).make(\fx1, "5-7F1H-7PLR", BusDef(\fx1, \audio));
//});
	
)
MIDIMap(\a1, { "hello" })
RandDelayNetwork(\default).code
Ndef(\fx1).set(\delay, 0)
Param(Ndef(\fx1), \delay).set(1)

MIDIdef.cc(\m1, { arg x; x.debug("hello") })
MIDIdef.cc(\test3, {arg ...args; args.postln}, (1..100)); // match cc 1-10

Pdef(\part1).stop
Pdef(\part1).stop

