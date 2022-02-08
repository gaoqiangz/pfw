export class Clock extends Element 
{

  componentDidMount() { 
    this.paintForeground = this.drawclock; // attaching draw handler to paintForeground layer
    this.timer(300,()=>this.requestPaint());
    
    this.borderWidth = this.style.pixelsOf("border-width") || 3;
    this.borderColor = this.style.colorOf("border-color") || color("brown");
  }

  drawclock(gfx)
  {
	// return;
    var [x,y,w,h] = this.state.box("rectw");
    var scale = w < h? w / 300.0: h / 300.0;
    var now = new Date();
    gfx.save();
    gfx.translate(w/2.0,h/2.0);
    gfx.scale(scale,scale);    
    gfx.rotate(-Math.PI/2);
    gfx.strokeStyle = rgb(0,0,0);
    gfx.lineWidth = 8;
    gfx.lineCap = "round";
       
    // Hour marks
    gfx.save();
    gfx.strokeStyle = rgb(0x32,0x5F,0xA2);
    for (var i=1;i<=12;++i) {
	  gfx.beginPath();
      gfx.rotate(Math.PI/6);
      gfx.moveTo(137,0);
      gfx.lineTo(144,0);
	  gfx.stroke();
    }
    gfx.restore();

    // Minute marks
    gfx.save();
    gfx.lineWidth = this.borderWidth;
    gfx.strokeStyle = this.borderColor;
    for (var i=1;i<=60;++i) {
	  gfx.beginPath();
      if ( i % 5 != 0) {
        gfx.moveTo(143,0);
        gfx.lineTo(146,0);
	  }
      gfx.rotate(Math.PI/30);
	  gfx.stroke();
    }
    gfx.restore();

    var sec = now.getSeconds();
    var min = now.getMinutes();
    var hr  = now.getHours();
    hr = hr >= 12 ? hr-12 : hr;
  
    // write Hours
    gfx.save();
    gfx.rotate( hr*(Math.PI/6) + (Math.PI/360)*min + (Math.PI/21600)*sec );
    gfx.lineWidth = 14;
	gfx.beginPath();
    gfx.moveTo(-20,0);
    gfx.lineTo(70,0);
	gfx.stroke();
    gfx.restore();

    // write Minutes
    gfx.save();
    gfx.rotate( (Math.PI/30)*min + (Math.PI/1800)*sec );
    gfx.lineWidth = 10;
	gfx.beginPath();
    gfx.moveTo(-28,0);
    gfx.lineTo(100,0);
	gfx.stroke();
    gfx.restore();
      
    // Write seconds
    gfx.save();
    gfx.rotate(sec * Math.PI/30);
    gfx.strokeStyle = rgb(0xD4,0,0);
    gfx.fillStyle = rgb(0xD4,0,0);
    gfx.lineWidth = 6;
	gfx.beginPath();
    gfx.arc(0,0,10,0,2 * Math.PI);
	gfx.fill();
    gfx.fillStyle = null;
    gfx.arc(95,0,10,0,2 * Math.PI);
    gfx.moveTo(-30,0);
    gfx.lineTo(83,0);
	gfx.stroke();
    gfx.restore();
    
    gfx.restore();
    
  }    
}

function rgb(r,g,b) {
	return Graphics.Color.RGB(r,g,b);
}
function color(clr) {
	return new Graphics.Color(clr);
}