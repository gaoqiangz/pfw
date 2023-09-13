export class Notification extends Element {
  static instance = null;
  static pending = [];

  componentDidMount() {
    Notification.instance = this;
	if(Notification.pending) {
		for(const {title, message, severity, delay} of Notification.pending) {
			Notification.show(title, message, severity, delay);
		}
		Notification.pending = null;
	}
  }

  static show(title, message, severity, delay = 0) {
	if(!this.instance) {
		this.pending.push({title,message,severity,delay});
		return;
	}
    this.instance.append(<Message title={title} message={message} severity={severity} delay={delay * 1000} />);
  }

}

const WAIT_TIMER = 3000;

export class Message extends Element {
  props = null;

  this(props) {
    this.props = props;
    this.post(this.show);
  }

  render() {
    return <popup class="message" severity={this.props.severity} delay={this.props.delay} >
      <div>
        <header>{this.props.title}{this.props.delay > 0 ? <close title="关闭"></close> : undefined}</header>
        <content>{this.props.message}</content>
      </div>
    </popup >;
  }

  show() {

    this.attributes["state"] = "initial";

    const [screenX1, screenY1, screenX2, screenY2] = Window.this.screenBox("workarea", "rect");
    let [w, h] = this.state.box("dimension", "border", true);

    if (this.previousElementSibling) {
      const [x, y] = this.previousElementSibling.state.box("position", "border", "screen", true);
      if (y > h)
        h += screenY2 - y;
    }

    this.takeOff({
      x: screenX2 - w,
      y: screenY2 - h,
      relativeTo: "screen",
      window: "detached"
    });

    function revealIt() {
      this.attributes["state"] = "shown";
      this.on("transitionend", function cb(evt) {
        this.off(cb); // do it once
        if (this.attributes["state"] === "shown")
          this.timer(this.props.delay > 0 ? this.props.delay : WAIT_TIMER, this.close);
        return true;
      });
    }

    this.post(revealIt);
  }

  close() {
    this.attributes["state"] = "closed";
    this.on("transitionend", () => {
      this.remove();
      return true;
    });
  }

  ["on click at close"]() {
    this.close();
  }
}
