
/*
@author = Electroprince
@link = https://youtu.be/7TMUSyKBhfs
*/

(
s.boot;

p = ProxySpace.push(s);

)

~out.play;
~out.stop;
~out.fadeTime = 4;

//~out = {SinOsc.ar(LFPar.ar(LFTri.ar([1,5],pi, 100, 200), pi/8, 200, 400), 0, 0.2)} //not interesting


//cool scrapes
(
~out = {GVerb.ar(Resonz.ar(Mix.fill(150, {(
	WhiteNoise.ar(8)*Lag.ar(LFTri.ar([300,600],0),
		2.3,Pulse.ar([1,0.6,3])))})),10,4, 0.6, 0.4, 11, 1, 0.8, 0.5,230)}
)
//under bridge
(~out = { DynKlank.ar (`[[ 200,200,380,60],[0.1, 0.1, 0.1, 0.1],
	[0.3, 1, 0.5, 1]], BrownNoise.ar(0.09)!2, 1)/1.9})