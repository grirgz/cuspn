~tempo = TempoClock.default;
~t = 75/60;
~tempo.tempo = ~t;



(
[
Pdef(\hat),
Pdef(\kick),
Pdef(\snare),
Pdef(\hsnare),
Pdef(\carla),
Pdef(\bob),
Pdef(\tuf),
Pdef(\tar),
].collect(_.play)
)

(
Pdef(\beat,
	Ppar([
		Pdef(\hat),
		Pdef(\kick),
		Pdef(\snare),
		//Pdef(\bob),
	])
).play;
)

(
Pdef(\beat2,
	Ppar([
		Pdef(\hat),
		Pdef(\kick),
		Pdef(\snare),
		Pdef(\hsnare),
		Pdef(\carla),
		//Pdef(\bob),
		Pdef(\tuf),
		Pdef(\tar),

	])
).play;
)

Pdef(\beat).stop;

(

Tdef(\effect,{loop{
	Ndef(\onepole).set(\pole,0);
	28.wait;
	Ndef(\onepole).set(\pole,0.5);
	4.wait;
}}).play;
Pdef(\main,Pseq([
	Pfindur(8,Pdef(\hat)),
	Pfindur(16,Ppar([Pdef(\hsnare)])),
	Pfindur(32,Ppar([Pdef(\beat)])),
	Pfindur(32,Pdef(\beat2)),
	Pfindur(32,Ppar([Pdef(\subman),	Pdef(\beat2)],inf)),
	Pfindur(32,Ppar([Pdef(\subman),	Pdef(\beat2),Pdef(\bassman_wo),Pdef(\bassman_lfo)],inf)),
	Pfindur(28,Ppar([Pdef(\beat),Pdef(\cy)],inf)),
	Pfindur(4,Ppar([Pdef(\hsnare)]),inf),
	Pfindur(32,Ppar([Pdef(\subman),	Pdef(\beat2),Pdef(\cy)],inf)),//808lib
	Pfindur(32,Ppar([Pdef(\subman),	Pdef(\beat2),Pdef(\bassman_wo),Pdef(\bassman_lfo)],inf)),
]),inf).play;
)


Ndef(\rev).free;

Ndef(\rev,{
	var in = In.ar(0,2)*0.5;
	LPF.ar(Limiter.ar(FreeVerb.ar(in,0.5,0.6,1),0.6),10000);
}).play;



Ndef(\onepole,{arg freq = 100,b=1,pole =(-0.59);
	var sig = (In.ar(10,2)+LocalIn.ar(1))*pole;
	sig = (AllpassL.ar(sig,0.2,~t/4)*b)+sig;
	LocalOut.ar(sig);
	Out.ar(0,sig!2);
}).play;


//////////////////////////

(
Ndef(\anal).put(0, { arg freq=100;
	LPCAnalyzer.ar(SoundIn.ar(2), LFSaw.ar(freq), 1024, 90,0,0.5) * 2 ! 2
}).play;
Ndef(\anal).put(10, \set -> Pbind(
	\degree, Pseq([0,2,0,4],inf)
))
)

(
MIDIdef.noteOn(\piano, { arg ... args;
	args.postln;
	Ndef(\anal).set(\freq, args[1].midicps)
})
)

MIDI.ini

s.meter

{LPCAnalyzer.ar(SoundIn.ar(2),Impulse.ar(240,0,0.2), 256, 50)*4}.play