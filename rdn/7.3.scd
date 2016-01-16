
(
	~tree = ~gentree.(5, ~transform);
	~tree.debug("TREE");
	Veco(~namex).response_mode = \exec;
	Ndef(~name+++\fx).put(0, { arg amp=0.1;
		var sig;
		var del, shi;
		var del2, shi2;
		var distamp;
		var in;
		in = InFeedback.ar(\inbus.kr(BusDef(\zero, \audio)), 2); 
		sig = in;
		del = \delay.kr(1,0.1);
		del2 = \delay2.kr(1,0.1);
		shi = \shift.kr(1);
		shi2 = \shift2.kr(1);
		distamp = \distamp.kr(1);
		in.debug("in");

		sig = LPF.ar(sig, \lpf.kr(17000));
		sig = HPF.ar(sig, \hpf.kr(17));
		sig = ~interpret.(sig, ~tree, ~dict);
		sig = Limiter.ar(sig) * 2;
		sig = sig.softclip / 4.1;
		sig = LPF.ar(sig, \plpf.kr(17000));
		sig = HPF.ar(sig, \phpf.kr(17));
		sig = sig * \poamp.kr(1);
		sig = BPF.ar(sig, \bpf.kr(1000), \bprq.kr(0.3)) + (sig * \ibpamp.kr(0.3));
		sig = SelectX.ar(\mix.kr(0.5), [in, sig]);
		sig = sig * \gain.kr(1);
		sig = sig * \mamp.kr(1);
		sig.debug("end sig");
		sig;
	});
)

// END

BusDef(\in1).getSynchronous
BusDef(\in1).set(0)

~t = 1;

Ndef(~name+++\fx).set(\lpf, 100)
Ndef(~name+++\fx).clear
Ndef(~name+++\fx).edit
Veco(~name).lib.macros.do(_.postln);
ParamGroupDef(~name).save(\p1)
ParamGroupDef(~name).save(\p2)
ParamGroupDef(~name).getArchive
ParamGroupDef(~name).
Archive.write
~pm = ParamMorpher(~name, [\p1, \p2])
MIDIMap(\k9, ~pm)
Ar
