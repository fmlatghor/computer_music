(
SynthDef(\sin, { |out, sustain = 1, freq = 440, speed = 1, begin=0, end=1, pan, accelerate|
	var env, sound, rate, phase, amp;
	amp = AmpCompA.kr(freq);
	env = EnvGen.ar(Env.perc(0.002, sustain, 1, -1), doneAction:2);
	phase = Line.ar(begin, end, sustain);
	rate = speed + Sweep.kr(1, accelerate);
	sound = SinOsc.ar(freq);
	Out.ar(out,
		DirtPan.ar(sound, ~dirt.numChannels, pan, env)
	)
}).add
);