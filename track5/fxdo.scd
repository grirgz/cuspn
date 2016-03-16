
(
RandDelayNetwork(\default).make(\fx1, "5--");
Ndef(\fx1).put(0, {
	var in = SoundIn.ar(2);
	in ! 2;
});
)
Ndef(\fx1).play;

(
Ndef(\fx2, {
	var in = SoundIn.ar(3);
	var sig;
	//in = in.sum.debug("in") ! 2;
	in = in ! 2;
	sig = Greyhole.ar(in, \delayTime.kr(2) / ~t, \damp.kr(2), \size.kr(1), \diff.kr(0.5), \feedback.kr(0.9), \modDepth.kr(0.1), \modFreq.kr(2));
	sig = sig * \mamp.kr(1);
}).play;
)
Ndef(\fx2).edit
Ndef(\fx2).clear
Ndef(\fx2).set(\delayTime, 1/4)
~t = 1
TempoClock.default.tempo = 1;
