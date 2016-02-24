
(
Ndef(\mixer, {
	8.do { arg x;

		var in = InFeedback.ar(
			(\inbus++x).asSymbol.kr(BusDef((\mixer++x).asSymbol, \audio)),2
		);
		var sig;
		Spec.add((\send++x++"_1").asSymbol, \unipolar);
		Spec.add((\mamp++x).asSymbol, ControlSpec(0,1,\lin));

		sig = in;
		Out.ar(
			(\outbus1).asSymbol.kr(BusDef((\fx1).asSymbol, \audio)),
			sig * (\send++x++"_1").asSymbol.kr(1)
		);
		Out.ar(
			0,
			in * (\mamp++x).asSymbol.kr(1)
		);

	}
}).play
)

5-3JV8-T84

(
Pdef(\kick2).set(\out, BusDef(\mixer0));
Pdef(\snare).set(\out, BusDef(\mixer1));
Pdef(\hat).set(\out, BusDef(\mixer2));
Pdef(\bass).set(\out, BusDef(\mixer3));
Pdef(\bass2).set(\out, BusDef(\mixer4));
//Ndef(\mixer).set(\inbus0, BusDef(\mixer0));
//Ndef(\mixer).set(\outbus1, BusDef(\fx1));
Ndef(\fx1).set(\inbus, BusDef(\fx1));
)




Ndef(\mixer).edit;


(
Ndef(\bits, {
    var t = PulseCount.ar(Impulse.ar(8e3));
    var sig = HPF.ar(
        (
            ((t * 1) & (t >> 5)) |
            ((t * 5) & (t >> [3, 4])) |
            ((t * 2) & (t >> 1)) |
            ((t *2) & (t >> 1))
            - 3 % 346
        ) / 127-1 * 3
        , 20
    ).distort * 0.2;
	sig
    //sig = Greyhole.ar(sig, sig, 0.5, sig);
}).play;
)
