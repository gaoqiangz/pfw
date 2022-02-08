/*
	移植自QQ2015登录背景动画
	by gaoqiangz@msn.com
*/
import * as CAV from "cav.js";

export class lowpoly extends Element {
	t = {
		width: 1.5,
		height: 1.5,
		depth: 4,
		segments: 8,
		slices: 3,
		xRange: 0.8,
		yRange: 0.1,
		zRange: 1,
		ambient: "#525252",
		diffuse: "#FFFFFF",
		speed: 0.0002
	};
	G = {
		count: 2,
		xyScalar: 1,
		zOffset: 100,
		ambient: "#002c4a",
		diffuse: "#005584",
		speed: 0.001,
		gravity: 1200,
		dampening: 0.95,
		minLimit: 10,
		maxLimit: null,
		minDistance: 20,
		maxDistance: 400,
		autopilot: false,
		draw: false,
		bounds: CAV.Vector3.create(),
		step: CAV.Vector3.create(Math.randomInRange(0.2, 1), Math.randomInRange(0.2, 1), Math.randomInRange(0.2, 1))
	};
	i; n = Date.now();
	L = CAV.Vector3.create();
	k = CAV.Vector3.create();
	D; I; h; q; y;
	r;

	componentDidMount() {
		this.style.setProperty("padding", "0");
		this.style.setProperty("flow", "stack");
		this.style.setProperty("overflow", "hidden");
		var el = document.createElement("lowpoly");
		el.style.setProperty("display", "block");
		el.style.setProperty("z-index", "-1");
		el.style.setProperty("size", "*");
		this.prepend(el);
		this.D = new CAV.CanvasRenderer(el);
		this.I = new CAV.Scene()
		this.s();
		this.B();
		this.K();
		this.timer(45, function () { this.o(); return true; });
	}

	s() {
		this.I.remove(this.h);
		this.q = new CAV.Plane(this.t.width * this.D.width, this.t.height * this.D.height, this.t.segments, this.t.slices);
		this.y = new CAV.Material(this.t.ambient, this.t.diffuse);
		this.h = new CAV.Mesh(this.q, this.y);
		this.I.add(this.h);
		var N, O;
		for (N = this.q.vertices.length - 1; N >= 0; N--) {
			O = this.q.vertices[N];
			O.anchor = CAV.Vector3.clone(O.position);
			O.step = CAV.Vector3.create(Math.randomInRange(0.2, 1), Math.randomInRange(0.2, 1), Math.randomInRange(0.2, 1));
			O.time = Math.randomInRange(0, Math.PIM2);
		}
	}

	B() {
		var O, N;
		for (O = this.I.lights.length - 1; O >= 0; O--) {
			N = this.I.lights[O];
			this.I.remove(N);
		}
		for (O = 0; O < this.G.count; O++) {
			N = new CAV.Light(this.G.ambient, this.G.diffuse);
			N.ambientHex = N.ambient.format();
			N.diffuseHex = N.diffuse.format();
			this.I.add(N);
			N.mass = Math.randomInRange(0.5, 1);
			N.velocity = CAV.Vector3.create();
			N.acceleration = CAV.Vector3.create();
			N.force = CAV.Vector3.create();
		}
	}

	K() {
		this.D.updateSize();
		CAV.Vector3.setAll(this.L, this.D.halfWidth, this.D.halfHeight);
		this.s();
		this.o();
	}

	o() {
		this.i = Date.now() - this.n;
		CAV.Vector3.setAll(this.k, this.D.width * Math.random(), this.D.height * Math.random());
		CAV.Vector3.subtract(this.k, this.L);
		this.u();
		this.M();
	}

	u() {
		var Q, P, O, R, T, V, U, S = this.t.depth / 2;
		CAV.Vector3.copy(this.G.bounds, this.L);
		CAV.Vector3.multiplyScalar(this.G.bounds, this.G.xyScalar);
		CAV.Vector3.setZ(this.k, this.G.zOffset);
		for (R = this.I.lights.length - 1; R >= 0; R--) {
			T = this.I.lights[R];
			CAV.Vector3.setZ(T.position, this.G.zOffset);
			var N = Math.clamp(CAV.Vector3.distanceSquared(T.position, this.k), this.G.minDistance, this.G.maxDistance);
			var W = this.G.gravity * T.mass / N;
			CAV.Vector3.subtractVectors(T.force, this.k, T.position);
			CAV.Vector3.normalise(T.force);
			CAV.Vector3.multiplyScalar(T.force, W);
			CAV.Vector3.setAll(T.acceleration);
			CAV.Vector3.add(T.acceleration, T.force);
			CAV.Vector3.add(T.velocity, T.acceleration);
			CAV.Vector3.multiplyScalar(T.velocity, this.G.dampening);
			CAV.Vector3.limit(T.velocity, this.G.minLimit, this.G.maxLimit);
			CAV.Vector3.add(T.position, T.velocity)
		}
		for (V = this.q.vertices.length - 1; V >= 0; V--) {
			U = this.q.vertices[V];
			Q = Math.sin(U.time + U.step[0] * this.i * this.t.speed);
			P = Math.cos(U.time + U.step[1] * this.i * this.t.speed);
			O = Math.sin(U.time + U.step[2] * this.i * this.t.speed);
			CAV.Vector3.setAll(U.position, this.t.xRange * this.q.segmentWidth * Q, this.t.yRange * this.q.sliceHeight * P, this.t.zRange * S * O - S);
			CAV.Vector3.add(U.position, U.anchor)
		}
		this.q.dirty = true;
	}

	M() {
		this.D.render(this.I);
	}

	J(O) {
		var Q, N, S = O;
		var P = function (T) {
			for (var Q = 0,
				l = this.I.lights.length; Q < l; Q++) {
				N = this.I.lights[Q];
				N.ambient.set(T);
				N.ambientHex = N.ambient.format()
			}
		};
		var R = function (T) {
			for (var Q = 0,
				l = this.I.lights.length; Q < l; Q++) {
				N = this.I.lights[Q];
				N.diffuse.set(T);
				N.diffuseHex = N.diffuse.format()
			}
		};
		return {
			set: function () {
				P(S[0]);
				R(S[1]);
			}
		};
	}

	/*
	onmousemove(evt) {
		CAV.Vector3.setAll(this.k, evt.x, evt.y);
		CAV.Vector3.subtract(this.k, this.L);
	}
	*/

	onsizechange() {
		this.K();
	}
}