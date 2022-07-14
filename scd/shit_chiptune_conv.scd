s.boot;
(
SynthDef("help_mp3_01", { |bufnum = 0|
   var son, pitch, amp, wibble;
   son = DiskIn.ar(2, bufnum).mean;
   pitch = Tartini.kr(son)[0];
   amp = Amplitude.ar(son);
   pitch = Median.kr(5, pitch); // smooth
   pitch = pitch.min(10000).max(10); // limit
   pitch = pitch.cpsmidi.round.midicps; // coerce
   wibble = Pulse.ar(pitch, 0.2, amp * 2); // resynthesise
   wibble = FreeVerb.ar(wibble, 0.3, 0.1, 0.9); // bit of reverb just to taste
   Out.ar(0, wibble.dup);
}).add;
)

// Choose your MP3... some will work well and most will work badly.
// Oh and you'll need the MP3 Quark.
m = MP3("/home/lcoogan/Lataukset/4.mp3");
m.start;
b = Buffer.cueSoundFile(s, m.fifo, 0, 2);
// Off we go:
x = Synth("help_mp3_01", [\bufnum, b.bufnum], addAction:\addToTail);

// Please remember to tidy up after yourself:
x.free;
b.close; b.free;
m.finish;


More waffle plus a recorded example at
http://www.mcld.co.uk/blog/blog.php?235

s.record