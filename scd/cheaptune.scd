////////#superCollider///////////
///// audio @ http://archive.org/details/ChiptuneBreakz
///
(
Tdef(\cheaptune,{
     var sig2,sig1,sig3,a,rel;
	sig1=[8,12,16,20];
	sig2=2/sig1.scramble;
	sig3=2*sig1.scramble;
	rel=Pxrand([0,0,0,0,0,0,0,1],inf).asStream;
	inf.do{
	        a=[0.125,0.25,0.5,0.5,0.25,0.125,1].choose;
		x=[60,67,75,79,94].scramble;
		play{EnvGen.ar(Env.perc(0.01,a+rel.next),doneAction:2)*
				AY.ar(x.midicps*a*sig1.choose,x*sig2.choose.midicps,a*sig3.choose.midicps,0.25,3,15,10,7)};
                play{EnvGen.ar(Env.perc(0.01,a/2),Duty.kr(Dseq([0.5,0.25],inf),0,Dxrand([0,1],inf)),doneAction:2)*
				BrownNoise.ar(0.6)!2};
                play{EnvGen.ar(Env.perc(0.01,a/4),Duty.kr(Dseq([0.25,0.5],inf),0,Dseq([0,1],inf)),doneAction:2)*
				LFNoise0.kr(16)*WhiteNoise.ar(0.2)!2};
		a.wait
	}
});
Tdef(\cheaptune).play;
)
s.record;
s.stopRecording;
//