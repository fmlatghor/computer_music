// bit of an afternoon playing random noises turned out to sound relatively IDM-ish

// I stole the kick & snare from the dubstep thing off the list a while ago... thanks

(
fork{
	loop{ | i |
		var time, trigtime;
		time = [1/8,1/4,1].wchoose([2,1,0.2].normalizeSum);
		trigtime = [1,2,4,8,16].choose;
		play{
			var sound, freq, ampenv, filterenv, mod, snare, snaretrig, kick, kickenv, lin;

			mod = LFNoise2.kr({0.01.rand}.dup(2), [0.01.rand,0.001.rand,0.5.rand].choose, 1.0);

			freq = [
					Scale.minorPentatonic.degrees,
					Scale.minorPentatonic.degrees.choose
				].choose + (12 * (2..6).choose);
			freq = freq.midicps;

			filterenv = EnvGen.kr(Env.linen(time/3.0.rand.max(0.01),
				time/3.0.rand.max(0.01),
				time/3.0.rand.max(0.01)).range(freq*1.5,freq*10.0.rand.max(1.5))
			);

			ampenv = EnvGen.kr(Env.perc(0.01,time/2.0.rand.max(1/8),1.0.rand),doneAction:2);

			sound = Select.ar(5.rand, [
				Pulse.ar(freq*mod,0.5).tanh,
				LFTri.ar(freq*mod,0).tanh,
				Pulse.ar(freq*mod,0.5).tanh,
				LFSaw.ar(freq*mod,0.5).tanh,
				SinOscFB.ar(freq*mod,100.0.rand).tanh
			]);

			sound = RLPF.ar(sound, filterenv, LFNoise2.kr(0.01.rand, 0.3, 0.5) );
			sound = sound * ampenv;

			sound = sound + (DelayC.ar(sound, 1/4, {[1/4,1/8].choose}.dup(2)) * [1.0.rand,0]);

			5.do{sound = (sound.clip + sound)*0.75};

			sound = LPF.ar(sound, LFNoise2.kr(trigtime, 250, 500) );

			snaretrig = Impulse.kr(trigtime);
			snare = 3*PinkNoise.ar(1!2) *
				EnvGen.kr(Env.perc(0.01,0.01,[0,0.3.rand].choose),snaretrig);
			5.do{snare = AllpassC.ar(snare, 0.5, {0.05.rand}.dup(2), 1.0.rand)+snare};
			5.do{snare = (snare.distort + snare)*0.85};

			kickenv = EnvGen.kr(Env.perc(0.01,time,[0,1.0.rand].choose));
			kick = SinOsc.ar(40!2+(kickenv**3*200),0,7*kickenv) * kickenv;
			5.do{kick = (kick.distort + kick)*0.75};

			sound = Limiter.ar(sound + snare + kick, 1.0, 0.00001);

			Out.ar(0,sound.tanh);
		};

		time.wait;
	};
}
)