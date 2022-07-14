s.boot;

(
s.scope;
s.meter;
s.plotTree;
)

(
SynthDef(\fmbell, { arg out=0, amp=0.01, gate=0.5, pan=0, freq=300;
	var sig, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
	freq = freq * EnvGen.kr(Env([1,1.002,0.998,1],[0.1,0.8]), 1);
	sig1 = SinOsc.ar(freq * 2.6706 + 0.13) * 2 + 1;
	sig2 = SinOsc.ar(freq * 0.9998 * sig1);
	sig3 = SinOsc.ar(freq * 2.6629 * sig1 + 2.04);
	sig4 = LFCub.ar(freq * 0.9991 * sig1 + 2.14);
	sig5 = SinOsc.ar(freq * 2.6656 * sig1 - 2);
	sig6 = SinOsc.ar(freq * 1 * sig1 + 1.84);
	//sig = sig2 + sig3 + sig4 + sig5 + sig6;
	sig = [sig1, sig2, sig3, sig4, sig5, sig6] * DC.ar([0.5,0.3,0, 0.5,0.2,0.2]);
	//sig.debug("sig");
	//sig = sig /34;
	sig = sig * EnvGen.ar(\adsr.kr( Env.adsr(0.01,0,1,2.1,1,-1) ),gate,doneAction:2);
	sig = Pan2.ar(sig, pan + [ 0, -0.5, -0.5, 0.5, 0.5, 0], amp).sum;
	Out.ar(out, sig);
}).add;
)

(
~reps = Pseries(1,1,inf).asStream;

p = Pbind (
	\instrument, \fmbell,
	\midinote, Pseq([
		Pxrand([41, 53, 30, 58], ~reps),
		Pxrand([80, 60, 70, 79]),
		Pxrand([50, 40, 0, 80]),
	],inf),
	\sustain, 0.05,
	\dur, 0.15,
	//\amp, 1,
);

q = p.play;
)
q.stop;

s.record