// this example contains modified code from the Flambe game engine: https://github.com/aduros/flambe
class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var b:h2d.Bitmap;

	var script:flambe.script.Script;

	override function init() {
		b = new h2d.Bitmap(hxd.Res.haxeLogo.toTile(), s2d);
		b.x = 250;
		b.y = 250;

		// Flambe script Sequence will play a sequence of functions/actions
		var sequence = new flambe.script.Sequence([
			// the first action is just a delay of 1.5 seconds
			new flambe.script.Delay(1.5),
			// then we just set the icon colour to red
			new flambe.script.CallFunction(function() {
				// a 3 dimensional vector is another way of setting the RGBa value
				b.color = new h3d.Vector(1.0, 0.0, 0.0, 1.0);
			}),
			// then again  we wait for another 2.5 seconds
			new flambe.script.Delay(2.5),
			// and set the colour to blue
			new flambe.script.CallFunction(function() {
				b.color = new h3d.Vector(0.0, 0.0, 1.0, 1.0);
			}),
			// we wait another 2.5 seconds
			new flambe.script.Delay(2.5),
			// and set colour back to normal
			new flambe.script.CallFunction(function() {
				b.color = new h3d.Vector(1.0, 1.0, 1.0, 1.0);
			})
		]);

		// to repeat this sequence forever we just call this function specifying -1
		var repeat = new flambe.script.Repeat(sequence, -1);

		// finally to run our ssequence we need to create a script object,
        script = new flambe.script.Script();
        // and pass it out repeat sequence
		script.run(repeat);

        // you want to execute this sequence just one time, then you could just call script.run(sequence);
        // as by default the second parameter is 1
	}

	override function update(dt:Float) {
        // on the update functin we will need to specify the elapsed time
        // so the script will know what to do
		script.update(hxd.Timer.elapsedTime);

		// if you want to stop this script, you can just call script.stopAll() method.
	}
}
