
// that wave effect
export function Wave() {

	this.on("mousedown",async function(evt){
	  // ripple - expanding disk animation     
	  let [x1, y1, x2, y2] = this.state.box("rect","border","self");
	  let x = evt.x; let y = evt.y;
	  
	  function distance( xt,yt ) { return Math.sqrt((xt - x)*(xt - x) + (yt - y)*(yt - y)); }

	  let active =  this.style["-active-color"] || Graphics.Color.rgb(0x8b,0x8b,0x8b);
	  
	  let maxradii = Math.max( distance(x1,y1),
								distance(x1,y2),
								distance(x2,y1),
								distance(x2,y2) ); 
	  let radii = 0.0;
						 
	  function step(progress) {
		if( !this.state.active )
		  return false;
		radii = progress * maxradii;
		active = Graphics.Color.rgb(active.r,active.g,active.b,progress);
		this.requestPaint();
		return true;
	  }
	  
	  this.paintContent = function(gfx) {
		gfx.pushLayer("background-area");
		gfx.fillStyle = active;
		gfx.arc(x,y,radii,0,2 * Math.PI);
		gfx.fill();
		gfx.popLayer();
	  }
	 
	  await this.animate( step, {duration:200} );

	this.paintContent = null; 

	  return false;


	});

}