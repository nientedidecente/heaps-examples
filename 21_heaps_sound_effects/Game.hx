/**
 * Heaps sounds effect example.
 * https://heaps.io/api/hxd/snd/Effect.html
 * You can find all supported effects in hxd.snd.effect package:
 * Reverb, LowPass, Pitch, Spatialization
 * This demo will work correctly only on HashLink target.
 * (seems like sound effects are not fully supported on js/html5 target currently)
 */
class Game extends hxd.App {
	static function main() {
		hxd.Res.initEmbed();
		new Game();
	}

	// Array of reverb effect presets we will be using in this demo
	// https://heaps.io/api/hxd/snd/effect/ReverbPreset.html
	var presets:Array<hxd.snd.effect.ReverbPreset>;
	// we set the preset index
	var presetIndex:Int = 0;

	var t:h2d.Text;

	override function init() {
		presets = [];

		// Here we load all presets that are available in ReverbPreset class (using Reflection).
		// We will see some static fields like DEFAULT and GENERIC.
		// You can see complete list on the doc `hxd.snd.effect.ReverbPreset`
		// here we are just lazily loading them all to use them after, rather than typing them one by one.
		var presetsFields = Reflect.fields(hxd.snd.effect.ReverbPreset);
		for (f in presetsFields) {
			var firstChar = f.charAt(0);
			if (firstChar.toUpperCase() == firstChar) {
				presets.push(Reflect.field(hxd.snd.effect.ReverbPreset, f));
			}
		}

		// adding a text object n order to visualize when we play the sound
        t = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        t.scale(10);
		t.x = 20;
		t.y = 20;
	}

	override function update(dt:Float) {
		// In this example we are listening for the Space key press in order to play the sound with the applied effect.
		if (hxd.Key.isPressed(hxd.Key.SPACE)) {
			// this function will just play the sound we load from resources.
			var channel = hxd.Res.sound_fx.play();
			// and here we apply one of the reverb preset to the newly created sound channell
			channel.addEffect(new hxd.snd.effect.Reverb(presets[presetIndex]));
			t.text = 'Playing ${presetIndex}';
			// This is just an example, on an actual project you would be calling it like so:
			// channel.addEffect(new hxd.snd.effect.Reverb(hxd.snd.effect.ReverbPreset.CONCERTHALL));

			// here we increment the preset index so we can hear the other effects
			presetIndex++;
			// and we max it out at its length
			presetIndex %= presets.length;
		} else {
            t.text = "";
        }
	}
}
