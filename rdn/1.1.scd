
	// generate new random delay network each time
	
	Veco(~namex).response_mode = \exec;
	Fdef(\gen, {

	~tree = ~gentree.(5, ~transform);
	~tree.debug("TREE");
	Ndef(\echo2).put(10, \filter -> { arg in;
		var sig;
		var del, shi;
		var del2, shi2;
		var distamp;
		sig = in;
		del = \delay.kr(1,0.1);
		del2 = \delay2.kr(1,0.1);
		shi = \shift.kr(1);
		shi2 = \shift2.kr(1);
		distamp = \distamp.kr(1);

		sig = LPF.ar(sig, \lpf.kr(17000));
		sig = HPF.ar(sig, \hpf.kr(17));
		sig = ~interpret.(sig, ~tree, ~dict);
		sig = Limiter.ar(sig) * 2;
		sig = sig.softclip / 4.1;
		sig = LPF.ar(sig, \plpf.kr(17000));
		sig = HPF.ar(sig, \phpf.kr(17));
		sig = sig * \poamp.kr(1);
		sig.debug("end sig");
		sig;
	});
	}).value
