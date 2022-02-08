import * as sciter from "@sciter";

const Pie_defaults = {
  fill: ["#ff9900", "#fff4dd", "#ffc66e"]
};

const Donut_defaults = {
  fill: ["#ff9900", "#fff4dd", "#ffc66e"],
  thickness: 0.5
};

const Line_defaults = {
  delimiter: ",",
  fill: "#c6d9fd",
  min: 0,
  stroke: "#4d89f9",
  "stroke-width": 1,
};

const Bar_defaults = {
  delimiter: ",",
  fill: ["#4D89F9"],
  min: 0,
  padding: 0.1,
};


function prepare(svg) {
  if (svg.children.length)
    svg.clear();
  return svg;
}

function dimension(svg) {
  var w = svg.style.pixelsOf("width");
  var h = svg.style.pixelsOf("height");
  return [w, h];
}

function values(svg, opts) {
  var vals = svg.attributes["value"].split(opts.delimiter);
  return vals.map(parseFloat);
}

export function Pie(opts = {}, defaults = Pie_defaults) {

  opts = Object.assign({}, defaults, opts);

  const fill = typeof opts.fill == "function"
    ? function (_, i, vals) { return opts.fill(_, i, vals).toString("RGBA"); }
    : function (_, i, vals) { return opts.fill[i % opts.fill.length].toString("RGBA"); };

  if (!opts.delimiter) {
    var delimiter = this.attributes["value"].match(/[^0-9\.]/);
    opts.delimiter = delimiter ? delimiter[0] : ",";
  }

  var vals = values(this, opts).map(n => n > 0 ? n : 0);

  function draw(svg, opts) {
    var nvals = vals;
    if (opts.delimiter == "/") {
      var v1 = nvals[0];
      var v2 = nvals[1];
      nvals = [v1, Math.max(0, v2 - v1)];
    }

    var i = 0;
    var length = nvals.length;
    var sum = 0;

    for (; i < length; ++i) sum += nvals[i];

    if (!sum) { length = 2; sum = 1; nvals = [0, 1]; }


    //var width = opts.width || diameter;
    //var height = opts.height || diameter;
    var [width, height] = dimension(svg);

    var diameter = Math.min(width, height);

    prepare(svg);

    var cx = width / 2, cy = height / 2;

    var radius = Math.min(cx, cy);
    var innerRadius = 0;

    if (defaults === Donut_defaults)
      innerRadius = radius * (1.0 - opts.thickness);

    var pi = Math.PI;

    function scale(value, radius) {
      var radians = value / sum * pi * 2 - pi / 2;
      return [
        radius * Math.cos(radians) + cx,
        radius * Math.sin(radians) + cy
      ]
    };

    var cumulative = 0;

    for (i = 0; i < length; ++i) {
      var value = nvals[i];
      var portion = value / sum;
      var node;

      if (portion == 0) continue;

      if (portion == 1) {
        if (innerRadius) {
          var x2 = cx - 0.01;
          var y1 = cy - radius;
          var y2 = cy - innerRadius;

          node = document.createElement("path");
          node.attributes["d"] = [
            "M", cx, y1,
            "A", radius, radius, 0, 1, 1, x2, y1,
            "L", x2, y2,
            "A", innerRadius, innerRadius, 0, 1, 0, cx, y2
          ].join(" ");
        } else {
          node = document.createElement("circle");
          node.attributes["cx"] = cx;
          node.attributes["cy"] = cy;
          node.attributes["r"] = radius;
        }
      } else {
        var cumulativePlusValue = cumulative + value;

        var d = ["M"].concat(
          scale(cumulative, radius),
          "A", radius, radius, 0, portion > 0.5 ? 1 : 0, 1,
          scale(cumulativePlusValue, radius),
          "L"
        );

        if (innerRadius) {
          d = d.concat(
            scale(cumulativePlusValue, innerRadius),
            "A", innerRadius, innerRadius, 0, portion > 0.5 ? 1 : 0, 0,
            scale(cumulative, innerRadius)
          );
        } else
          d.push(cx, cy);

        cumulative += value;

        node = document.createElement("path");
        node.attributes["d"] = d.join(" ");
      }

      node.attributes["fill"] = fill(value, i, nvals);
      svg.append(node);
    }
  }

  Object.defineProperty(this, 'value', {
    get() { return vals; },
    set(v) {
      if (typeof (v) == "array") vals = v;
      else vals[0] = v;
      draw(this, opts);
    }
  });

  draw(this, opts);
}

export function Donut(opts = {}) {
  return Pie.call(this, opts, Donut_defaults);
}

export function Line(opts = {}) {

  opts = Object.assign({}, Line_defaults, opts);

  const fill = opts.fill;

  var vals = values(this, opts);

  function draw(svg, opts) {

    if (vals.length == 1) vals.push(vals[0]);
    var max = Math.max.apply(Math, opts.max == undefined ? vals : vals.concat(opts.max));
    var min = Math.min.apply(Math, opts.min == undefined ? vals : vals.concat(opts.min));

    var [width, height] = dimension(svg);

    prepare(svg);

    var strokeWidth = sciter.devicePixels(opts.strokeWidth || opts["stroke-width"]);
    height = height - strokeWidth;
    var diff = max - min;

    function xScale(input) {
      return input * (width / (vals.length - 1));
    }

    function yScale(input) {
      var y = height;
      if (diff) y -= ((input - min) / diff) * height;
      return y + strokeWidth / 2;
    }

    var zero = yScale(Math.max(min, 0));
    var coords = [0, zero];

    for (var i = 0; i < vals.length; ++i)
      coords.push(xScale(i), yScale(vals[i]));

    coords.push(width, zero);

    if (opts.fill) {
      svg.append(
        JSX("polygon", {
          fill: opts.fill.toString(),
          points: coords.join(" ")
        }, [])
      );
    }

    if (strokeWidth)
      svg.append(
        JSX("polyline", {
          fill: "none",
          points: coords.slice(2, coords.length - 2).join(" "),
          stroke: opts.stroke.toString(),
          "stroke-width": strokeWidth,
          "stroke-linecap": "square"
        }, [])
      );
  }

  Object.defineProperty(this, 'value', {
    get() { return vals; },
    set(v) {
      vals = v; draw(this, opts);
    }
  });

  draw(this, opts);
}

export function Bar(opts = {}) {
  opts = Object.assign({}, Bar_defaults, opts);

  const fill = typeof opts.fill == "function"
    ? function (_, i, vals) { return opts.fill(_, i, vals).toString("RGBA"); }
    : function (_, i, vals) { return opts.fill[i % opts.fill.length].toString("RGBA"); };

  var vals = values(this, opts);

  function draw(svg, opts) {
    var max = Math.max.apply(Math, opts.max === undefined ? vals : vals.concat(opts.max));
    var min = Math.min.apply(Math, opts.min === undefined ? vals : vals.concat(opts.min));

    var [width, height] = dimension(svg);

    prepare(svg);

    var diff = (max - min) * 1.001;
    var padding = opts.padding || 0.0;

    function xScale(input) { return input * width / vals.length };
    function yScale(input) { return height - (diff ? ((input - min) / diff) * height : 1) };

    for (var i = 0; i < vals.length; ++i) {
      var x = xScale(i + padding);
      var w = xScale(i + 1 - padding) - x;
      var value = vals[i];
      var valueY = yScale(value);
      var y1 = valueY, y2 = valueY, h;

      if (!diff) h = 1;
      else if (value < 0) y1 = yScale(Math.min(max, 0.0));
      else y2 = yScale(Math.max(min, 0.0));

      h = y2 - y1;

      if (h == 0) { h = 1; if (max > 0 && diff) --y1; }

      svg.append(
        JSX("rect", {
          fill: fill(value, i, vals),
          x: x,
          y: y1,
          width: w,
          height: h
        }, [])
      );
    }
  }

  Object.defineProperty(this, 'value', {
    get() { return vals; },
    set(v) {
      vals = v; draw(this, opts);
    }
  });

  draw(this, opts);
}
