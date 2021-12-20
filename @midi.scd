MIDIClient.init;
~midiOut = MIDIOut.newByName("minilogue", "minilogue minilogue _ MIDI OUT");
~midiOut = MIDIOut.newByName("Midi Through", "Midi Through Port-0");
~dirt.soundLibrary.addMIDI(\midi, ~midiOut);