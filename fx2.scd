Ndef(\pitchshift,{
	var sig = PitchShift.ar(In.ar(2,2),0.2,0.5);
	Out.ar(6,sig*2);
});

(
// allocate a Buffer
s = Server.local;
b = Buffer.alloc(s, 44100 * 4.0, 1); // a four second 1 channel Buffer
)

// record for four seconds
(
SynthDef(\help_RecordBuf, { arg out = 0, bufnum = 0;
    var formant;
	    formant = SoundIn.ar(2,1);
    RecordBuf.ar(formant, bufnum, doneAction: 2, loop: 0);
}).play(s,[\out, 0, \bufnum, b]);
)


(
SynthDef(\help_RecordBuf_overdub, { arg out = 0, bufnum = 0;
    var playbuf;
    var env = EnvGen.ar(Env.perc(0.1,1);
	playbuf = PlayBuf.ar(1,bufnum);
    Out.ar(out, playbuf);
}).add;
)