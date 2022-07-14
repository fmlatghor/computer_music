s.boot;

(
s.meter;
s.plotTree;
s.scope;
)

b = Buffer.read(s, "/home/lcoogan/Tidal/scd/samples/8train/plosh.wav");
b.play;
b.free;

(
{
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar({ExpRand(60,60.5)}!12),
		0.02,
		b,
		0.5,
		(
			Phasor.ar(0, 1 * BufRateScale.ir(b), 0, BufSamples.ir(b)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		0.23,
		0,
		0,
		-1,
		512,
	);
	sig = sig * 0.5;
}.play
)