class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var w:hxd.WaitEvent;

	override function init() {
        // WaitEvent https://heaps.io/api/hxd/WaitEvent.html
		w = new hxd.WaitEvent();
		// a WaitEvent.wait call will delay a function execution of a certain amount of seconds
		w.wait(2, function() {
			trace("Kept you waiting, huh?");
        });
        
		// we add to the waitEvent the everyFrameRoutine function
		w.add(everyFrameRoutine);
	}

	override function update(dt:Float) {
        // the function everyFrameRoutine will be now executed every frame
		w.update(dt);
	}

	function everyFrameRoutine(dt:Float):Bool {
		trace("everyFrameRoutine");
		return false;
	}
}
