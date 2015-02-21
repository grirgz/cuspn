(
SynthDef(\SinKick, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
SinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 1)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

SynthDef(\SawKick, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
Saw.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 1)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

SynthDef(\FSinKick, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 1)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

SynthDef(\SquareKick, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 1, 1)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//distortion

SynthDef(\FSinKick_dist, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 1).distort * Line.kr(2, 0, 0.9)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//+noise

SynthDef(\FSinKick_noise, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 1).distort * Line.kr(2, 0, 0.9)
+ LFNoise0.ar(freq * 6, 0.01, amp)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;


//+ saw

SynthDef(\FSinKick_saw, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 6, 0.01, amp)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;


//+ square

SynthDef(\FSinKick_square, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.5)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 6, 0.01, amp)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//+ high

SynthDef(\FSinKick_high, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.1)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 8, 0.01, 0.05)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//+ high++

SynthDef(\FSinKick_high_saw, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Saw.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.2, 2), 0.5, 0.05).distort * Line.kr(-2, 0, 0.5)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.1)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 8, 0.01, 0.05)
* EnvGen.kr(Env.perc(0, 0.1, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//+ release

SynthDef(\FSinKick_release, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Saw.ar(EnvGen.kr(Env.adsr(0, 0.5, 0, 0, 1, -20), gate, freq, 0, 0.2, 2), 0.5, 0.005).distort * Line.kr(-2, 0, 0.5)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.1)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 8, 0.01, 0.05)
* EnvGen.kr(Env.perc(0, 0.3, 1, 8));
);
Out.ar(0, source * amp);
}).add;

//+ noise

SynthDef(\FSinKick_noise2, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.5).distort * Line.kr(2, 0, 0.9)
+ Saw.ar(EnvGen.kr(Env.adsr(0, 0.5, 0, 0, 1, -20), gate, freq, 0, 0.2, 2), 0.5, 0.005).distort * Line.kr(-2, 0, 0.5)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.1)
+ LFNoise0.ar(EnvGen.kr(Env.perc(0, 20, 1, 100)), 1, 1)
* EnvGen.kr(Env.perc(0, 0.1, 1, 12));
);
Out.ar(0, source * amp);
}).add;

//+ Kick!!!!!!

SynthDef(\FSinKick_last, {
arg freq = 440, gate = 0.1, amp = 0.5, source, pan = 0.0;
source = Pan2.ar(
FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 1, 0.1).distort * Line.kr(2, 0, 0.9)
+ FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq / 2, 0, 0.5, 2), 1, 0.1).distort * Line.kr(2, 0, 0.9)
+ FSinOsc.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq * 2, 0, 0.5, 2), 1, 0.05).distort * Line.kr(2, 0, 0.9)
+ Saw.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.2, 2), 0.5, 0.05).distort * Line.kr(-2, 0, 0.5)
+ Pulse.ar(EnvGen.kr(Env.adsr(0, 1, 0, 0, 1, -20), gate, freq, 0, 0.5, 2), 0.5, 0.03, 0.1)
+ Saw.ar(freq * 2, 0.0025, 0.25)
+ LFNoise0.ar(freq * 8, 0.005, 0.05)
* EnvGen.kr(Env.perc(0, 0.12, 1, 8));
);
Out.ar(0, source * amp);
}).add;
)



(
Pdef(\kick8, Pbind(
	\instrument, Pseq([
		\SinKick, 
		\SawKick, 
		\FSinKick, 
		\SquareKick, 
		\FSinKick_dist, 
		\FSinKick_noise, 
		\FSinKick_saw, 
		\FSinKick_square, 
		\FSinKick_high, 
		\FSinKick_high_saw, 
		\FSinKick_release, 
		\FSinKick_noise2, 
		\FSinKick_last, 
	],inf),
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.2
)).play;
);

