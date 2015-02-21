
(
SynthDef(\kick7, { arg gate=1;
		var daNoise,daOsc,env1,env2,env3;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,80,-20);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		daNoise=LPF.ar(WhiteNoise.ar(1),EnvGen.kr(env1,gate)+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
		daOsc=LPF.ar(SinOsc.ar(EnvGen.kr(env3,gate)+20),200);

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([daNoise,daOsc]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)/3
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),EnvGen.kr(env1,gate)+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = SinOsc.ar(freq) + LFTri.ar(freq);
	sig = sig /4;
		sig=LPF.ar(sig,200);

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),EnvGen.kr(env1,gate)+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = SinOsc.ar(freq) + LFSaw.ar(freq,mul:0.2);
		sig=LPF.ar(sig,200);

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),EnvGen.kr(env1,gate)+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = SinOsc.ar(freq) + LFCub.ar(freq,mul:1);
		sig=LPF.ar(sig,200);
		sig = sig /4;

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),EnvGen.kr(env1,gate)+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = SinOsc.ar(freq) + LFCub.ar(freq,mul:1);
		sig=LPF.ar(sig,200);
		sig1 = HPF.ar(sig, 40);
		sig1 = ( sig1 ).tanh;
		sig = sig +sig1 /6 ;

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),env1+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = SinOsc.ar(freq) + LFCub.ar(freq,mul:1);
		sig=LPF.ar(sig,200);
		sig1 = HPF.ar(sig, 14 * env1+30);
		sig1 = ( sig1 * 10).tanh;
		sig = sig +sig1 /6 ;

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		//controlls cutoff pitch...0 to 80 Hz
		env1=Env.perc(0.001,1,100,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		//controlls overall amplitude...0 to 1
		env2=Env.perc(0.001,1,1,-8);
		//osc-pitch envelope
		//controlls pitch of the oscillator...0 to 80 Hz
		env3=Env.perc(0.001,1,80,-8);
	   
		//Attack noise portion of the sound
		//filter cutoff controlled by env1
		//+20 to move it into the audible
		//spectrum
		noise=LPF.ar(WhiteNoise.ar(1),env1+20);
	//VCO portion of the sound
	//Osc pitch controlled by env3
	//+20 to move the pitch into the
	//audible spectrum
	freq = EnvGen.kr(env3,gate)+20;
	sig = [
		SinOsc.ar(freq), LFCub.ar(freq,mul:1), LFTri.ar(freq), LFPulse.ar(freq,mul:0.1)
	].mean;
	sig8 = sig;
		sig=LPF.ar(sig,200);
		sig1 = HPF.ar(sig, 10);
		sig1 = ( sig1 * Line.ar(1000,1,0.4)).tanh;
		sig2 = RLPF.ar(sig1, 270 * Line.kr(0.3,3.1,0.2));
		sig3 = RLPF.ar(sig8, 72 * Line.kr(3,1.1,0.2),0.1);
		sig3 = sig8;
		sig = sig +sig2 + sig3 /6 ;

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		env1=Env.perc(0.001,1,100,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		env2=Env.perc(0.001,0.51,1,-9);
		//osc-pitch envelope
		env3=Env.perc(0.001,1,80,-8);
	   
		noise=LPF.ar(WhiteNoise.ar(1),env1+20);

		freq = EnvGen.kr(env3,gate)+20;
		sig = [
			SinOsc.ar(freq), LFCub.ar(freq,mul:1), LFTri.ar(freq), LFPulse.ar(freq,mul:0.1)
		].mean;
		sig8 = sig;
		sig=LPF.ar(sig,500);
		sig1 = HPF.ar(sig, 10);
		sig1 = ( sig1 * Line.ar(100,1,0.4)).tanh;
		sig2 = RLPF.ar(sig1, 70 * Line.kr(0.3,3.1,0.2));
		sig3 = RLPF.ar(sig8, 72 * Line.kr(3,1.1,0.2),0.1);
		sig3 = sig8;
		sig = sig +sig2 + sig3 /6 ;

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		env1=Env.perc(0.001,1,100,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		env2=Env.perc(0.001,0.51,1,-9);
		//osc-pitch envelope
		env3=Env.perc(0.001,1,80,-8);
	   
		noise=LPF.ar(WhiteNoise.ar(1),env1+20);

		freq = EnvGen.kr(env3,gate)+20;
		sig = SinOsc.ar(freq * ( 1 + ( LFTri.ar(40) * 10 )));
		sig8 = sig;
		sig=LPF.ar(sig,150);
		sig=LPF.ar(sig,150);

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		env1=Env.perc(0.001,1,100,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		env2=Env.perc(0.001,0.51,1,-9);
		//osc-pitch envelope
		env3=Env.perc(0.001,1,80,-8);
	   
		noise=LPF.ar(WhiteNoise.ar(1),env1+20);

		freq = EnvGen.kr(env3,gate)+20;
		sig = SinOsc.ar(freq * ( 1 + ( LFTri.ar(740) * 10 )));
		sig8 = sig;
		sig=LPF.ar(sig,150);
		sig=RLPF.ar(sig,55,0.1);

		//output
		Out.ar(0,Pan2.ar(
								Mix.ar([noise,sig]),
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
SynthDef(\kick7, { arg gate=1;
		var noise,sig,env1,env2,env3;
		var freq;
		var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	   
		//noise filter cutoff envelope
		env1=Env.perc(0.001,1,480,-20);
		env1 = EnvGen.kr(env1,gate);
		//mix-amp envelope
		env2=Env.perc(0.001,0.51,1,-9);
		//osc-pitch envelope
		env3=Env.perc(0.001,1,80,-8);
	   
		noise=LPF.ar(LFNoise1.ar(4201),env1+20) / 18;

		freq = EnvGen.kr(env3,gate)+20;
		sig = SinOsc.ar(freq * ( 1 + ( LFTri.ar(100) * 0.51 )));
		sig8 = sig;
		sig=LPF.ar(sig,250);


		sig = Mix.ar([noise,sig]);
		sig = sig / 2;

		//output
		Out.ar(0,Pan2.ar(
								sig,
								0, //position
								//level controlled by env2
								EnvGen.kr(env2,gate,doneAction: 2)
						);
				  );
}).add;
);

(
Pdef(\kick7, Pbind(
	\lprq, 0.8,
	\instrument, \kick7,
	\degree, Pseq([0],inf),
	\dur, 1,
	\amp, 0.3
)).play;
);

Synth("kickDrum",[\gate,1]);
