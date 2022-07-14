s.boot;

(
SynthDef.new(\sine, {
	arg freq=440, atk=0.005, rel=0.2, amp=1, pan=0;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.new([0,1,0],[atk,rel],[1,-1]),doneAction:2);
	sig = Pan2.ar(sig, pan, amp);
	sig = sig* env;
	Out.ar(0, sig);
}).add;
)

(
p = Pbind(
	\instrument, \sine,
	\dur, Pseq([0.6, 0.15, 0.15], inf),
	\freq, Pseq([330, 247, 370, 220], inf),
).play
)

s.plotTree;