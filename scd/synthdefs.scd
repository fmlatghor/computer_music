(
SynthDef(\sin, { |out|
	Out.ar(out,
		SinOsc.ar()
	)
}).add
);
