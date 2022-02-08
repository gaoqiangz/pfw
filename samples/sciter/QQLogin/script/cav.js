/*
	移植自QQ2015登录背景动画
	by gaoqiangz@msn.com
*/
Math.PIM2 = Math.PI * 2;
Math.PID2 = Math.PI / 2;
Math.max = function (a, b) {
	return a > b ? a : b;
}
Math.min = function (a, b) {
	return a < b ? a : b;
}
Math.randomInRange = function (a, b) {
	return a + (b - a) * Math.random();
};
Math.clamp = function (a, b, c) {
	a = Math.max(a, b);
	return a = Math.min(a, c);
};

const FRONT = 0;
const BACK = 1;
const DOUBLE = 2;

export class Vector3 {
	static create(a = 0.0, b = 0.0, c = 0.0) {
		return new Array(a, b, c);
	}
	static clone(a) {
		return [...a];
	}
	static setAll(a, b = null, c = null, d = null) {
		a[0] = b || 0;
		a[1] = c || 0;
		a[2] = d || 0;
		return this;
	}
	static setX(a, b) {
		a[0] = b || 0;
		return this;
	}
	static setY(a, b) {
		a[1] = b || 0;
		return this;
	}
	static setZ(a, b) {
		a[2] = b || 0;
		return this;
	}
	static copy(a, b) {
		a[0] = b[0];
		a[1] = b[1];
		a[2] = b[2];
		return this;
	}
	static add(a, b) {
		a[0] += b[0];
		a[1] += b[1];
		a[2] += b[2];
		return this;
	}
	static addVectors(a, b, c) {
		a[0] = b[0] + c[0];
		a[1] = b[1] + c[1];
		a[2] = b[2] + c[2];
		return this;
	}
	static addScalar(a, b) {
		a[0] += b;
		a[1] += b;
		a[2] += b;
		return this;
	}
	static subtract(a, b) {
		a[0] -= b[0];
		a[1] -= b[1];
		a[2] -= b[2];
		return this;
	}
	static subtractVectors(a, b, c) {
		a[0] = b[0] - c[0];
		a[1] = b[1] - c[1];
		a[2] = b[2] - c[2];
		return this;
	}
	static subtractScalar(a, b) {
		a[0] -= b;
		a[1] -= b;
		a[2] -= b;
		return this;
	}
	static multiply(a, b) {
		a[0] *= b[0];
		a[1] *= b[1];
		a[2] *= b[2];
		return this;
	}
	static multiplyVectors(a, b, c) {
		a[0] = b[0] * c[0];
		a[1] = b[1] * c[1];
		a[2] = b[2] * c[2];
		return this;
	}
	static multiplyScalar(a, b) {
		a[0] *= b;
		a[1] *= b;
		a[2] *= b;
		return this;
	}
	static divide(a, b) {
		a[0] /= b[0];
		a[1] /= b[1];
		a[2] /= b[2];
		return this;
	}
	static divideVectors(a, b, c) {
		a[0] = b[0] / c[0];
		a[1] = b[1] / c[1];
		a[2] = b[2] / c[2];
		return this;
	}
	static divideScalar(a, b) {
		if (b !== 0) {
			a[0] /= b;
			a[1] /= b;
			a[2] /= b;
		} else {
			a[0] = 0;
			a[1] = 0;
			a[2] = 0;
		}
		return this;
	}
	static cross(a, b) {
		var c = a[0],
			d = a[1],
			e = a[2];
		a[0] = d * b[2] - e * b[1];
		a[1] = e * b[0] - c * b[2];
		a[2] = c * b[1] - d * b[0];
		return this;
	}
	static crossVectors(a, b, c) {
		a[0] = b[1] * c[2] - b[2] * c[1];
		a[1] = b[2] * c[0] - b[0] * c[2];
		a[2] = b[0] * c[1] - b[1] * c[0];
		return this;
	}
	static min(a, b) {
		a[0] < b && (a[0] = b);
		a[1] < b && (a[1] = b);
		a[2] < b && (a[2] = b);
		return this;
	}
	static max(a, b) {
		a[0] > b && (a[0] = b);
		a[1] > b && (a[1] = b);
		a[2] > b && (a[2] = b);
		return this;
	}
	static clamp(a, b, c) {
		this.min(a, b);
		this.max(a, c);
		return this;
	}
	static limit(a, b, c) {
		var d = this.length(a);
		b !== null && d < b ? this.setLength(a, b) : c !== null && d > c && this.setLength(a, c);
		return this;
	}
	static dot(a, b) {
		return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
	}
	static normalise(a) {
		return this.divideScalar(a, this.length(a));
	}
	static negate(a) {
		return this.multiplyScalar(a, -1);
	}
	static distanceSquared(a, b) {
		var c = a[0] - b[0],
			d = a[1] - b[1],
			e = a[2] - b[2];
		return c * c + d * d + e * e;
	}
	static distance(a, b) {
		return Math.sqrt(this.distanceSquared(a, b));
	}
	static lengthSquared(a) {
		return a[0] * a[0] + a[1] * a[1] + a[2] * a[2];
	}
	static length(a) {
		return Math.sqrt(this.lengthSquared(a));
	}
	static setLength(a, b) {
		var c = this.length(a);
		c !== 0 && b !== c && this.multiplyScalar(a, b / c);
		return this;
	}
}
export class Vector4 {
	static create(a = 0.0, b = 0.0, c = 0.0) {
		return new Array(a, b, c, 0.0);
	}
	static setAll(a, b = null, c = null, d = null, e = null) {
		a[0] = b || 0;
		a[1] = c || 0;
		a[2] = d || 0;
		a[3] = e || 0;
		return this;
	}
	static setX(a, b) {
		a[0] = b || 0;
		return this;
	}
	static setY(a, b) {
		a[1] = b || 0;
		return this;
	}
	static setZ(a, b) {
		a[2] = b || 0;
		return this;
	}
	static setW(a, b) {
		a[3] = b || 0;
		return this;
	}
	static add(a, b) {
		a[0] += b[0];
		a[1] += b[1];
		a[2] += b[2];
		a[3] += b[3];
		return this;
	}
	static multiplyVectors(a, b, c) {
		a[0] = b[0] * c[0];
		a[1] = b[1] * c[1];
		a[2] = b[2] * c[2];
		a[3] = b[3] * c[3];
		return this;
	}
	static multiplyScalar(a, b) {
		a[0] *= b;
		a[1] *= b;
		a[2] *= b;
		a[3] *= b;
		return this;
	}
	static min(a, b) {
		a[0] < b && (a[0] = b);
		a[1] < b && (a[1] = b);
		a[2] < b && (a[2] = b);
		a[3] < b && (a[3] = b);
		return this;
	}
	static max(a, b) {
		a[0] > b && (a[0] = b);
		a[1] > b && (a[1] = b);
		a[2] > b && (a[2] = b);
		a[3] > b && (a[3] = b);
		return this;
	}
	static clamp(a, b, c) {
		this.min(a, b);
		this.max(a, c);
		return this;
	}
}
export class Color32 {
	constructor(a = null) {
		this.rgba = Vector4.create();
		this.opacity = typeof b == "number" ? b : 1;
		this.setAll(a || "#000000");
	}
	setAll(a) {
		var c = new Graphics.Color(a);
		this.rgba[0] = c.R / 255.0;
		this.rgba[1] = c.G / 255.0;
		this.rgba[2] = c.B / 255.0;
		this.rgba[3] = c.A / 255.0;
		return this;
	}
	format() {
		return "rgba(" +
			Math.ceil(this.rgba[0] * 255.0) + "," +
			Math.ceil(this.rgba[1] * 255.0) + "," +
			Math.ceil(this.rgba[2] * 255.0) + "," +
			this.rgba[3].toString() +
			")";
	}
	getColor() {
		//return new Graphics.Color(this.format());
		return Graphics.Color.rgb(this.rgba[0], this.rgba[1], this.rgba[2], this.rgba[3]);
	}
}
class CObject {
	constructor() {
		this.position = Vector3.create();
	}
	setPosition(a, b, c) {
		Vector3.setAll(this.position, a, b, c);
		return this;
	}
}
export class Light extends CObject {
	constructor(a, b) {
		super();
		this.ambient = new Color32(a || "#FFFFFF");
		this.diffuse = new Color32(b || "#FFFFFF");
		this.ray = Vector3.create();
	}
}
export class Vertex {
	constructor(a = 0, b = 0, c = 0) {
		this.position = Vector3.create(a, b, c);
	}
	setPosition(a, b, c) {
		Vector3.setAll(this.position, a, b, c);
		return this;
	}
}
export class Triangle {
	constructor(a = null, b = null, c = null) {
		this.a = a ? a : new Vertex();
		this.b = b ? b : new Vertex();
		this.c = c ? c : new Vertex();
		this.vertices = [this.a, this.b, this.c];
		this.u = Vector3.create();
		this.v = Vector3.create();
		this.centroid = Vector3.create();
		this.normal = Vector3.create();
		this.color = new Color32();
		//this.polygon = Element.create({svg,"polygon"});
		//this.polygon.@#stroke-linejoin = "round";
		//this.polygon.@#stroke-miterlimit = "1";
		//this.polygon.@#stroke-width = "1";
		this.computeCentroid();
		this.computeNormal();
	}
	computeCentroid() {
		this.centroid[0] = this.a.position[0] + this.b.position[0] + this.c.position[0];
		this.centroid[1] = this.a.position[1] + this.b.position[1] + this.c.position[1];
		this.centroid[2] = this.a.position[2] + this.b.position[2] + this.c.position[2];
		Vector3.divideScalar(this.centroid, 3);
		return this;
	}
	computeNormal() {
		Vector3.subtractVectors(this.u, this.b.position, this.a.position);
		Vector3.subtractVectors(this.v, this.c.position, this.a.position);
		Vector3.crossVectors(this.normal, this.u, this.v);
		Vector3.normalise(this.normal);
		return this;
	}
}
class Geometry {
	constructor() {
		this.vertices = [];
		this.triangles = [];
		this.dirty = false;
	}
	update() {
		if (this.dirty) {
			var a, b;
			for (a = this.triangles.length - 1; a >= 0; a--) b = this.triangles[a],
				b.computeCentroid(),
				b.computeNormal();
			this.dirty = false
		}
		return this;
	}
}
export class Plane extends Geometry {
	constructor(a = null, b = null, c = null, d = null) {
		super();
		this.width = a || 100;
		this.height = b || 100;
		this.segments = c || 4;
		this.slices = d || 4;
		this.segmentWidth = this.width / this.segments;
		this.sliceHeight = this.height / this.slices;
		var e, f, g;
		c = [];
		e = this.width * -0.5;
		f = this.height * 0.5;
		for (a = 0; a <= this.segments; a++) {
			c.push([]);
			for (b = 0; b <= this.slices; b++) {
				d = new Vertex(e + a * this.segmentWidth, f - b * this.sliceHeight);
				c[a].push(d);
				this.vertices.push(d);
			}
		}
		for (a = 0; a < this.segments; a++) {
			for (b = 0; b < this.slices; b++) {
				d = c[a + 0][b + 0];
				e = c[a + 0][b + 1];
				f = c[a + 1][b + 0];
				g = c[a + 1][b + 1];
				var t0 = new Triangle(d, e, f);
				var t1 = new Triangle(f, e, g);
				this.triangles.push(t0, t1);
			}
		}
	}
}
export class Material {
	constructor(a = null, b = null) {
		this.ambient = new Color32(a || "#444444");
		this.diffuse = new Color32(b || "#FFFFFF");
		this.slave = new Color32();
	}
}
export class Mesh extends CObject {
	constructor(a, b) {
		super();
		this.geometry = a || new Geometry();
		this.material = b || new Material();
		this.side = FRONT;
		this.visible = true;
	}
	update(a, b) {
		var c, d, e, f, g;
		this.geometry.update();
		if (b) for (c = this.geometry.triangles.length - 1; c >= 0; c--) {
			d = this.geometry.triangles[c];
			Vector4.setAll(d.color.rgba);
			for (e = a.length - 1; e >= 0; e--) f = a[e],
				Vector3.subtractVectors(f.ray, f.position, d.centroid),
				Vector3.normalise(f.ray),
				g = Vector3.dot(d.normal, f.ray),
				this.side === FRONT ? g = Math.max(g, 0) : this.side === BACK ? g = Math.abs(Math.min(g, 0)) : this.side === DOUBLE && (g = Math.max(Math.abs(g), 0)),
				Vector4.multiplyVectors(this.material.slave.rgba, this.material.ambient.rgba, f.ambient.rgba),
				Vector4.add(d.color.rgba, this.material.slave.rgba),
				Vector4.multiplyVectors(this.material.slave.rgba, this.material.diffuse.rgba, f.diffuse.rgba),
				Vector4.multiplyScalar(this.material.slave.rgba, g),
				Vector4.add(d.color.rgba, this.material.slave.rgba);
			Vector4.clamp(d.color.rgba, 0, 1);
		}
		return this;
	}
}
export class Scene {
	constructor() {
		this.meshes = [];
		this.lights = [];
	}
	add(a) {
		a instanceof Mesh && !~this.meshes.indexOf(a) ? this.meshes.push(a) : a instanceof Light && !~this.lights.indexOf(a) && this.lights.push(a);
		return this;
	}
	remove(a) {
		a instanceof Mesh && ~this.meshes.indexOf(a) ? this.meshes.splice(this.meshes.indexOf(a), 1) : a instanceof Light && ~this.lights.indexOf(a) && this.lights.splice(this.lights.indexOf(a), 1);
		return this;
	}
}
class Renderer {
	constructor() {
		this.halfHeight = this.halfWidth = this.height = this.width = 0;
	}
	setSize(a, b) {
		if (a && b && !(this.width === a && this.height === b)) {
			this.width = a;
			this.height = b;
			this.halfWidth = this.width * 0.5;
			this.halfHeight = this.height * 0.5;
			return this;
		}
	}
}
export class CanvasRenderer extends Renderer {
	constructor(el) {
		super();
		this.element = el;
		this.element.paintContent = gfx => this.paintContent(gfx);
		this.updateSize();
	}
	updateSize() {
		var [w, h] = this.element.state.box("dimension", "border");
		this.setSize(w, h);
		this.element.requestPaint();
		return this;
	}
	render(a) {
		this.renderParams = a;
		this.element.requestPaint();
	}
	paintContent(gfx) {
		if (!this.renderParams) return false;
		//gfx.clearAll();
		//gfx.setTransform(1, 0, 0, -1, this.halfWidth, this.halfHeight);
		//gfx.scale(1,-1);
		gfx.translate(this.halfWidth, this.halfHeight);
		var b, c, d, e, f;
		gfx.lineJoin = "round";
		gfx.strokeWidth = 1;
		for (b = this.renderParams.meshes.length - 1; b >= 0; b--) {
			c = this.renderParams.meshes[b];
			if (c.visible) {
				c.update(this.renderParams.lights, true);
				for (d = c.geometry.triangles.length - 1; d >= 0; d--) {
					e = c.geometry.triangles[d];
					f = e.color.getColor();
					gfx.strokeStyle = f;
					gfx.fillStyle = f;
					gfx.beginPath();
					gfx.moveTo(e.a.position[0], e.a.position[1]);
					gfx.lineTo(e.b.position[0], e.b.position[1]);
					gfx.lineTo(e.c.position[0], e.c.position[1]);
					gfx.closePath();
					gfx.stroke();
					gfx.fill();
				}
			}
		}
		return true;
	}
}