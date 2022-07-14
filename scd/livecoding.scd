s.boot
(
Ndef(\az, {|freq=444, pan=0|
	var sig = LFTri.ar(freq);
	sig = Pan2.ar(sig, pan);

}).play.fadeTime = 2;
)

Ndef(\az).set(\freq, rrand(80,500))

Ndef(\az).fadeTime = 2

s.scope