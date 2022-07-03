s.boot;
a= RedSampler(s);
a.prepareForPlay(\snd1, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff");
a.play(\snd1);
a.free;

~sound = {Resonz.ar(Pulse.ar([4,5]), 1500, 0.005)};
~sound.play
~sound.stop

~a = {PinkNoise.ar(0.15)!2};
~a.play;
~a.stop(1);

~a.clear
~a.ar

~note.play;
~note.stop(3);

~note = {SinOscFB.ar(120*[1,1.01], 0.15)*0.05}

~noise = {Resonz.ar(WhiteNoise.ar(0.5), Array.exprand(4, 120, 2500), 0,1).sum !2};
~noise.play(FadeTime:2)

~freq = {LFClipNoise.kr(3,6)};
~sound.set(\freq, ~freq)
~sound.stop



~sound = {Resonz.ar(Pulse.ar(\freq.kr(4)), Array.exprand(4, 120, 2500), 0.005). sum !2};
~sound.play(fadeTime: 2)
~sound.stop(2.5)
~sound.fadeTime_(2.5);
~sound.set(\freq, 5)
~sound.xset(\freq, 1.5)
~sound.pause -sound.resume
~sound.play
~freq = {LFClipNoise.kr(3,1,3)};
~sound.set(\freq, ~freq)
~sound.stop(2.5);
~sine = {SinOsc.ar(200*[1,1.01]+\freq.kr(1))*0.07};
~sine.play(fadeTime:2);
~sine.xset(\freq, ~freq);



~sound.stop
~noise.stop
~sine.stop
s.reboot




p = ProxySpace.new.push;
~sig.play;
~sig = {SinOsc.ar([440,443] * -5.midiratio) * -20.dbamp}
~sig.free