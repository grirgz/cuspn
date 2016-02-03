t = TempoClock.default;
t.tempo = 75/60;


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

Pdef(\beat,Pfindur(inf,
Ppar([
Pdef(\hat),
Pdef(\kick),
Pdef(\snare),
Pdef(\hsnare),
Pdef(\carla),
//Pdef(\bob),
Pdef(\tuf),
Pdef(\tar),
]))).play;




Pdef(\main,Pseq([
	Pfindur(4,Pdef(\hat)),
	Pfindur(4,Ppar([Pdef(\hsnare),Pdef(\hat)])),
	Pfindur(inf,Pdef(\beat))
],inf)).play;
