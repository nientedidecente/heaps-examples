class EffectShader extends hxsl.Shader {
	static var SRC = {
		// Importing all properties defined by thes base 3d shared
		@:import h3d.shader.BaseMesh;
		// Вершинный шейдер
		function vertex() {
			transformedPosition.z += sin(transformedPosition.y * 3 + global.time * 4) * 0.5;
		}
		// fragment sharer
		function fragment() {
			output.color.r *= transformedPosition.z;
		}
	};
}

class Game extends hxd.App {
	static function main() {
		hxd.Res.initLocal();

		new Game();
	}

	var obj:h3d.scene.Mesh;

	override function init() {
		// create a simple cube, we will apply the texture on it
		var prim = new h3d.prim.Cube();
		prim.translate(-0.5, -0.5, -0.5);
		// this operation is used to calculate the normals of each cube face
		prim.unindex();
		// here we add the vertex to the normals
		prim.addNormals();
		// now we add the texture coordinates
		prim.addUVs();

		// we now load the texture from resources
		var tex = hxd.Res.hxlogo.toTexture();

		// we use the texture to create a material
		var mat = h3d.mat.Material.create(tex);

		// now we create an abject with our cube and material, and we add it to the scene
		obj = new h3d.scene.Mesh(prim, mat, s3d);
		// we simply disable the shadow of the cube material
		obj.material.shadows = false;

		// and finally we ste the shader for our object, using the type defined before
		obj.material.mainPass.addShader(new EffectShader());

		// here we are just setting up some lighting for the scene
		var light = new h3d.scene.fwd.DirLight(new h3d.Vector(0.5, 0.5, -0.5), s3d);
		light.enableSpecular = true;

        s3d.lightSystem.ambientLight.set(0.3, 0.3, 0.3);
        
        // Create a simple CameraController so we can navigate the scene using the mouse
		new h3d.scene.CameraController(s3d).loadFromCamera();

		engine.backgroundColor = 0xFF808080;
	}
}
