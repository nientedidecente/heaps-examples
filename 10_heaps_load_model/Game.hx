class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var obj:h3d.scene.Object;

	override function init() {
		// Load the model and add it to the scene
		var cache = new h3d.prim.ModelCache();
		obj = cache.loadModel(hxd.Res.Model);
		obj.scale(0.05);
		obj.rotate(0, 0, Math.PI);
		s3d.addChild(obj);

		// Load the animation wired to the Model
		var anim = cache.loadAnimation(hxd.Res.Model);
        // play the animation.
        // note that the same anim could be applied to different objects
		obj.playAnimation(anim);

		// setup the lights on the stage
		var light = new h3d.scene.fwd.DirLight(new h3d.Vector(0.3, -0.4, -0.9), s3d);
		light.enableSpecular = true;
		light.color.set(0.28, 0.28, 0.28);
		s3d.lightSystem.ambientLight.set(0.74, 0.74, 0.74);

        // Create a simple CameraController so we can navigate the scene using the mouse
		new h3d.scene.CameraController(s3d).loadFromCamera();

		engine.backgroundColor = 0xFF808080;
	}
}
