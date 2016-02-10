(
Ndef(\vocoder).put(0,
	    { var input,sig, kernel;

		var deg = { arg x, oct=3;

			261.626 * (2**(x/12 * oct))
		};
		input=SoundIn.ar(2);
		input= HPF.ar(input,200);

		kernel= Mix.ar(LFSaw.ar(\freq.kr([20,400,230,4050]).poll *.t [1,1.01,0.032]).mean);
		sig  =Convolution.ar(kernel,input, 2048, 0.5);
		sig = HPF.ar(sig,300);
		sig = LPF.ar(sig,15000);
		sig = Limiter.ar(sig,0.9,0.01);
		    Out.ar(0,sig!2*0.6);
     }).play;



Ndef(\vocoder).put(10, \set -> Pbind(
	\dur,1/2,
	\freq, Pseq([
		~deg.([0,0,12,24],2),
		~deg.([2,2,12,24],2),

	],inf).trace
))
)

261.626 * (2**(0/12)) * 1/4


Pdef(\plop, Pbind(\degree, 0, \instrument, \bassman_lfo2)).play

(
~deg = { arg x, oct=3;
	[261.626 * (2**(x/12 + (oct -2)))]
};
)

s.makeGui;
s.meter;