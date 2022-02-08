const WAIT_TIMER = 5000; // duration to show it

export class Notification extends Element
{
	 static msg = null; // singleton, one message at the same time
     
	componentDidMount() {
		Notification.msg = this;
	}

	static cancel() { // call if you want to cancel it
	  let msg = this.msg;
		 if( msg.attributes["state"] == "shown" ) {
			msg.off(".notification");
			msg.attributes["state"] = undefined;
			msg.takeOff();
		 }		 
	 }
   
  static show(message, title = "Some message:") { 
	  let msg = this.msg;
		this.cancel();
		msg.$("content").innerHTML = message;
		msg.$("header").innerText = title;

    // NOTE: state animations are defined in CSS
    function closeIt() {
	  function cb(evt) { 
        msg.off(cb); // do it once
        msg.attributes["state"] = undefined;
        msg.takeOff();
        return true;
      }
      msg.attributes["state"] = "closed";
      msg.on("transitionend.notification",cb );
    }

    function revealIt() {
	  function cb(evt) { 
        msg.off(cb); // do it once
        msg.timer( WAIT_TIMER, closeIt );
        return true;
      }
      msg.attributes["state"] = "shown";
      msg.on("transitionend.notification",cb );
    }

    // getting this monitor's box
    let [screenX1,screenY1,screenX2,screenY2] = Window.this.screenBox("workarea", "rect");

    // set initial "off stage" state 
    msg.attributes["state"] = "initial";
    
    // measure its real sizes
    let [w,h] = msg.state.box("dimension","margin");
    let [oleft,otop,oright,obottom] = msg.state.box("rect","margin","inner");
    //stdout.println(oleft,otop,oright,obottom);

    // position it at bottom / right corner
		msg.takeOff( {
			x:screenX2 - w, 
            y:screenY2 - h, 
            relativeTo: "screen", 
            window: "detached"} );
    // request to start animation
    msg.post( revealIt );
		
  }
     

}
