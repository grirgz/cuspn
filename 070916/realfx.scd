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