s.boot;
s.reboot;

(
s.meter;
s.plotTree;
s.scope;
)

{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;

s.record

buf /home/lcoogan/.local/share/SuperCollider/Recordings/SC_220709_154352.aiff

b = Buffer.read(s, "/home/lcoogan/Tidal/scd/samples/8train/plosh.wav");


b = Buffer.read(s, "/home/lcoogan/.local/share/SuperCollider/Recordings/SC_220709_154352.aiff");
b.play



// THe actual SHST

(
Pdef(
	\rhythm,
	Pbind(
		\degree, Pseq([0,1,3,2,8,3]),
		\dur, 0.05,
		\rate, 1,
		\amp, 0.5,
	);
).play;
)