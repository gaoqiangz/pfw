import * as iconfont from "../common/iconfont";
import { assert } from "../common/utils";
import "../common/event";

//事件定义
const EVT_CLICKED = "tv-clicked";	//节点[evt.data]被鼠标左键单击
const EVT_DOUBLE_CLICKED = "tv-dblclicked";	//节点[evt.data]被鼠标左键双击
const EVT_RIGHT_CLICKED = "tv-rightclicked";	//节点[evt.data]被鼠标右键单击
const EVT_DOUBLE_RIGHT_CLICKED = "tv-dbrclicked";	//节点[evt.data]被鼠标右键双击
const EVT_SELECTION_CHANGING = "tv-selection-changing";	//当前节点[evt.data:{old,new}]选择将被改变,返回true阻止
const EVT_SELECTION_CHANGED = "tv-selection-changed";	//当前节点[evt.data:{old,new}]选择被改变
const EVT_POPULATE = "tv-populate";	//节点[evt.data]被首次需要被展开时触发(仅触发一次),返回true阻止
const EVT_EXPANDING = "tv-expanding";	//节点[evt.data]将被展开,返回true阻止
const EVT_EXPANDED = "tv-expanded";	//节点[evt.data]被展开
const EVT_COLLAPSING = "tv-collapsing";	//节点[evt.data]将被折叠,返回true阻止
const EVT_COLLAPSED = "tv-collapsed";	//节点[evt.data]被折叠
const EVT_CHECK_STATE_CHANGING = "tv-check-state-changing";	//节点[evt.data:{target,old,new}]将改变勾选状态,返回true阻止
const EVT_CHECK_STATE_CHANGED = "tv-check-state-changed";	//节点[evt.data:{target,old,new}]勾选状态已改变
const EVT_BEGIN_DRAG = "tv-begin-drag";	//开始拖拽节点[evt.data],返回true阻止
const EVT_END_DRAG = "tv-end-drag";	//结束拖拽节点[evt.data]
const EVT_DRAG_ENTER = "tv-drag-enter";	//拖拽进入节点[evt.data:{drag,target,where}],返回true阻止
const EVT_DRAG_LEAVE = "tv-drag-leave";	//拖拽离开节点[evt.data:{drag,target,where}]
const EVT_DRAG_DROP = "tv-drag-drop";	//拖放到节点[evt.data:{drag,target,where}]上面,返回true阻止
const EVT_BEGIN_TEXT_EDIT = "tv-begin-text-edit";	//开始编辑节点[evt.data]文本,返回true阻止
const EVT_END_TEXT_EDIT = "tv-end-text-edit";	//结束编辑节点[evt.data:{target,reason,newText}]文本,[reason]为1则文本被修改,为2则被用户取消,为0时未修改,返回true阻止修改并还原文本
//插入元素位置[place]
const PLACE_APPEND = 0;
const PLACE_BEFORE = 1;
const PLACE_AFTER = 2;
//- 节点勾选的状态(EVT_CHECKING/EVT_CHECKED事件的old/new参数)
const CHECK_STATE_UNCHECKED = 0;		//勾选
const CHECK_STATE_CHECKED = 1;			//未勾选
const CHECK_STATE_INDETERMINATE = 2;	//部分勾选
//- 节点拖放的位置(EVT_DRAG_DROP事件的[where]参数)
const DD_DROP_WHERE_BEFORE = 1;	//拖放到目标节点前面
const DD_DROP_WHERE_AFTER = 2;	//拖放到目标节点后面
const DD_DROP_WHERE_INSIDE = 3;	//拖放到目标节点里面

export class pfwTreeView extends Element {
	/** @type {EventHandler} */
	_handler = null;
	_elSelected = null;

	componentDidMount() {
		this._handler = new EventHandler(this);
	}

	/**
	 * 同步事件派发
	 * @private
	 * @param {String} name 
	 * @param {*} params 
	 * @returns {Boolean}
	 */
	_sendEvent(name, params) {
		return this.dispatchEvent(new CustomEvent(name, { detail: params }));
	}

	/**
	 * 异步事件派发
	 * @private
	 * @param {String} name 
	 * @param {*} params 
	 * @returns {Boolean}
	 */
	_postEvent(name, params) {
		return this.post(new CustomEvent(name, { detail: params }));
	}

	/**
	 * 构建节点图标`VNode`
	 * @param {String} image 
	 * @returns {VNode}
	 */
	_buildVIcon(image) {
		if (!image) return undefined;
		if (iconfont.isUri(image)) {
			let [charCode, clsFont] = iconfont.crackUri(image);
			return <span class={`tv-img ${clsFont}`} state-html={charCode}></span>;
		}
		else {
			let sStyle;
			let i = image.indexOf("{");
			if (i > 0) {
				sStyle = image.slice(i + 1, -1);
				image = image.slice(0, i);
			}
			return <img class="tv-img" src={this.onNormalizeUrl(image)} style={sStyle} />;
		}
	}

	/** 构建节点`VNode`
	 * @private
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 (`#`前缀指示为`icon-font`码点,`@`指定字体名[可选],如:`#f104@myFont`)
	 * @param {int} imagePosition 图标的位置 (left:0/top:1/right:2/bottom:3)
	 * @param {String} tipText 提示
	 * @param {Boolean} disabledLook 显示为不可用外观
	 * @returns {VNode<option>}
	 */
	_buildVOption(text, textIsHtml, image, imagePosition, tipText, disabledLook) {
		imagePosition = imagePosition || 0;
		if (typeof imagePosition === "number")
			imagePosition = ["left", "top", "right", "bottom"][imagePosition % 4];
		text = text || "";
		tipText = tipText || "";
		return <option text={!textIsHtml ? text : undefined} image={image} class={disabledLook ? "disable" : undefined}>
			<caption imgpos={image ? imagePosition : undefined} tooltip={tipText}>
				{["left", "top"].includes(imagePosition) ? this._buildVIcon(image) : undefined}
				<text state-html={textIsHtml ? text : undefined}>{!textIsHtml ? text : undefined}</text>
				{["right", "bottom"].includes(imagePosition) ? this._buildVIcon(image) : undefined}
			</caption>
		</option>;
	}

	/*--- PUBLIC INTERFACE BEGIN ---*/

	/**
	 * 标准化URL路径
	 * @param {String} url 
	 * @returns {String}
	 */
	onNormalizeUrl(url) {
		return url;
	}

	/**
	 * 设置icon-font字体
	 * @param {String} path
	 * @param {String} [name=""] 指定名称
	 * @returns {Boolean}
	 */
	setIconFont(path, name = "") {
		return iconfont.Manager.addFont({
			name: name,
			url: path
		});
	}

	/**
	 * 设置是否具有节点拖拽功能
	 * @param {Boolean} enable
	 * @returns {Boolean}
	 */
	enableDragDrop(enable) {
		return this._handler.enableDragDrop(enable);
	}

	/**
	 * 是否开启了勾选功能
	 * @returns {Boolean}
	 */
	isCheckBoxEnabled() {
		return (this.attributes["multiple"] === "checkmarks");
	}

	/** 
	 * 设置CSS变量
	 * @param {object} vars
	 * @return {Boolean}
	 */
	setCSSVars(vars) {
		if (!vars instanceof Object) return false;
		try {
			this.style.variables(vars);
		}
		catch (ex) {
			console.error(ex);
			return false;
		}
		return true;
	}

	/**
	 * 批量加载树 (使用`VNode`加载以最大化性能)
	 * @param {Array<object>} data
	 * ```js
	 * [{
	 * 	text:"text",
	 * 	textIsHtml:false,
	 * 	image:"uri",
	 * 	imagePosition:1,
	 * 	tipText:"text",
	 * 	checked:false,
	 * 	disabledLook:false,
	 * 	attributes:{name:"val"},
	 * 	children:[{...}]
	 * },...]
	 * ```
	 * @returns {Boolean}
	 */
	load(data) {
		if (!data instanceof Array) return false;
		let options = [];
		const loader = (options, data) => {
			for (let item of data) {
				if (!item instanceof Object) return false;
				let vopt = this._buildVOption(item.text, item.textIsHtml, item.image, item.imagePosition, item.tipText, item.disabledLook);
				if (!vopt) return false;
				if (item.attributes instanceof Object)
					Object.assign(vopt[1], item.attributes);
				if (item.checked)
					vopt[1]["state-checked"] = true;
				if (item.children instanceof Array) {
					if (item.checked)
						vopt[1]["state-collapsed"] = true; //使其具有[:node]状态
					if (!loader(vopt[2], item.children)) return false;
				}
				options.push(vopt);
			}
			return true;
		}
		if (!loader(options, data)) return false;
		this.removeOptionAll();
		this.append(options);
		return true;
	}

	/**
	 * 添加节点
	 * @param {Element<option>} elOwner
	 * @param {long} place 插入位置 (`PLACE_BEFORE`/`PLACE_AFTER`/`PLACE_APPEND`)
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 (`#`前缀指示为`icon-font`码点,`@`指定字体名[可选],如:`#f104@myFont`)
	 * @param {int} imagePosition 图标的位置 (left:0/top:1/right:2/bottom:3)
	 * @param {String} tipText 提示
	 * @param {Boolean} disabledLook 显示为不可用外观
	 * @returns {Element<option>}
	 */
	insertOption(elOwner, place, text, textIsHtml, image, imagePosition, tipText, disabledLook) {
		if (!elOwner) return null;

		let elOption = this._buildVOption(text, textIsHtml, image, imagePosition, tipText, disabledLook);
		if (!elOption) return null;

		switch (place) {
			case PLACE_BEFORE: {
				if (elOwner === this) return null;
				//elOwner.parentElement.before(elOption, elOwner);
				elOwner.parentElement.append(elOption);
				elOwner.parentElement.insertBefore(elOwner.parentElement.lastElementChild, elOwner);
				elOption = elOwner.previousElementSibling;
				break;
			}
			case PLACE_AFTER: {
				if (elOwner === this) return null;
				//elOwner.parentElement.after(elOption, elOwner);
				elOwner.parentElement.append(elOption);
				elOwner.parentElement.insertAfter(elOwner.parentElement.lastElementChild, elOwner);
				elOption = elOwner.nextElementSibling;
				break;
			}
			default: {
				elOwner.append(elOption);
				elOption = elOwner.lastElementChild;
				break;
			}
		}

		if (this.isCheckBoxEnabled())
			this.refreshParentCheckState(elOption, true, true);
		return elOption;
	}

	/**
	 * 添加节点
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 
	 * @param {int} imagePosition 图标的位置
	 * @param {String} tipText 提示
	 * @param {Boolean} disabledLook 显示为不可用外观
	 * @returns {Element<option>}
	 */
	addOption(text, textIsHtml, image, imagePosition, tipText, disabledLook) {
		return this.insertOption(this, PLACE_APPEND, text, textIsHtml, image, imagePosition, tipText, disabledLook);
	}

	/**
	 * 添加子节点
	 * @param {Element<option>} elOwner
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 
	 * @param {int} imagePosition 图标的位置
	 * @param {String} tipText 提示
	 * @param {Boolean} disabledLook 显示为不可用外观
	 * @returns {Element<option>}
	 */
	addChildOption(elOwner, text, textIsHtml, image, imagePosition, tipText, disabledLook) {
		return this.insertOption(elOwner, PLACE_APPEND, text, textIsHtml, image, imagePosition, tipText, disabledLook);
	}

	/**
	 * 判断指定节点是否为组节点
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isNode(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		return (elOption.state.collapsed || elOption.state.expanded);
	}

	/**
	 * 判断指定节点是否为叶子
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isLeaf(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		return (!elOption.state.collapsed && !elOption.state.expanded);
	}

	/**
	 * 判断指定节点是否被选中
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isSelected(elOption) {
		return (elOption === this._elSelected);
	}

	/**
	 * 判断指定节点是否被勾选
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isChecked(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		return elOption.state.checked;
	}

	/**
	 * 判断指定节点是否被折叠
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isCollapsed(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		return elOption.state.collapsed;
	}

	/**
	 * 判断指定节点是否被展开
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	isExpanded(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		return elOption.state.collapsed;
	}

	/**
	 * 获取当前选中的节点
	 * @returns {Boolean}
	 */
	getSelectedOption() {
		return this._elSelected;
	}

	/**
	 * 获取指定节点的勾选状态
	 * @param {Element<option>} elOption 
	 * @returns {int} `CHECK_STATE_UNCHECKED`/`CHECK_STATE_INDETERMINATE`/`CHECK_STATE_UNCHECKED`
	 */
	getCheckState(elOption) {
		if (!elOption || !elOption.$is("option")) return CHECK_STATE_UNCHECKED;
		return (elOption.state.incomplete ? CHECK_STATE_INDETERMINATE : (elOption.state.checked ? CHECK_STATE_CHECKED : CHECK_STATE_UNCHECKED));
	}

	/**
	 * 获取指定节点的文本
	 * @param {Element<option>} elOption 
	 * @returns {String}
	 */
	getText(elOption) {
		if (!elOption || !elOption.$is("option")) return "";
		return elOption.attributes["text"] || "";
	}

	/**
	 * 设置指定节点的文本
	 * @param {Element<option>} elOption 
	 * @param {String} text 
	 * @param {Boolean} textIsHtml text为html格式
	 * @returns {Boolean}
	 */
	setText(elOption, text, textIsHtml) {
		if (!elOption || !elOption.$is("option")) return false;
		let elText = elOption.$('>caption input[role="node-text-editor"]');
		if (elText) {
			if (textIsHtml) return false;
			elText.value = text;
			return true;
		}
		elOption.attributes["text"] = !textIsHtml ? text : undefined;
		elText = elOption.$(">caption>text");
		if (textIsHtml)
			elText.innerText = text;
		else
			elText.innerHTML = text;
		return true;
	}

	/**
	 * 编辑节点的文本
	 * @param {Element<option>} elOption 
	 * @param {String} newText 
	 * @returns {Boolean}
	 */
	editText(elOption, newText) {
		if (!elOption || !elOption.$is("option")) return false;
		if (!elOption.hasAttribute("text")) return false;
		if (elOption.$('>caption input[role="node-text-editor"]')) return false;
		if (this._sendEvent(EVT_BEGIN_TEXT_EDIT, elOption)) return false;
		let tree = this;
		let elText = elOption.$(">caption>text");
		elText.content(<input type="text" role="node-text-editor"></input>);
		let elInput = elText.lastElementChild;
		elInput.value = (typeof newText === "string" ? newText : elOption.attributes["text"]);
		elInput.edit.selectAll();
		elInput.focus();
		elInput._acceptText = function () {
			if (this._processed) return false;
			this._processed = true;
			let reason = (elOption.attributes["text"] === this.value ? 0 : 1);
			let rejected = tree._sendEvent(EVT_END_TEXT_EDIT, { target: elOption, reason: reason, newText: this.value });
			if (rejected) {
				//Reject
				elText.innerText = elOption.attributes["text"];
			}
			else {
				//Accept
				elText.innerText = this.value;
				elOption.attributes["text"] = this.value;
			}
			tree.focus();
			return !rejected;
		};
		elInput.onblur = function () {
			this._acceptText();
			return true;
		};
		elInput.onkeydown = function (evt) {
			if (evt.code === "Enter") {
				this._acceptText();
				return true;
			}
			else if (evt.code === "Escape") {
				tree._sendEvent(EVT_END_TEXT_EDIT, { target: elOption, reason: 2 });
				elText.innerText = elOption.attributes["text"];
				this._processed = true;
				tree.focus();
				return true;
			}
		};
		elInput.oncontextmenu = function (evt) {
			evt.preventDefault();
			return true;
		};
		return true
	}

	/**
	 * 应用编辑的文本
	 * @returns {Boolean}
	 */
	acceptText() {
		let elInput = this.$('input[role="node-text-editor"]');
		if (elInput) {
			return elInput._acceptText();
		} else {
			return false;
		}
	}

	/**
	 * 获取菜单项图标
	 * @param {Element<option>} elOption
	 * @returns {String}
	 */
	getImage(elOption) {
		if (!elOption) return "";
		return elOption.attributes["image"];
	}

	/**
	 * 设置菜单项文本
	 * @param {Element<option>} elOption
	 * @param {String} image
	 * @returns {Boolean}
	 */
	setImage(elOption, image) {
		if (!elOption) return false;
		let elCaption = elOption.$(">caption");
		let elImg = elCaption.$(">.tv-img");
		if (image) {
			let vnode = this._buildVIcon(image);
			if (!vnode) return false;
			elCaption.append(vnode);
			if (elImg) {
				elCaption.replaceChild(elCaption.lastElementChild, elImg);
			} else {
				let imgpos = elCaption.attributes["imgpos"] || "left";
				if (["left", "top"].includes(imgpos)) {
					elCaption.insertBefore(elCaption.lastElementChild, elCaption.firstElementChild);
				}
				elCaption.attributes["imgpos"] = imgpos;
			}
		}
		else {
			elImg?.remove();
			elCaption.removeAttribute("imgpos");
		}
		elOption.attributes["image"] = image;
		return true;
	}

	/**
	 * 获取菜单项提示文本
	 * @param {Element<option>} elOption
	 * @returns {String}
	 */
	getTipText(elOption) {
		if (!elOption) return "";
		return elOption.$(">caption").attributes["tooltip"];
	}

	/**
	 * 设置菜单项提示文本
	 * @param {Element<option>} elOption
	 * @param {String} tipText
	 * @returns {Boolean}
	 */
	setTipText(elOption, tipText) {
		if (!elOption) return false;
		tipText = tipText || "";
		elOption.$(">caption").attributes["tooltip"] = tipText;
		return true;
	}

	/**
	 * 设置不可用外观
	 * @param {Element<option>} elOption 
	 * @param {Boolean} set 
	 * @returns {Boolean}
	 */
	setDisabledLook(elOption, set) {
		if (!elOption) return false;
		set ? elOption.classList.add("disable") : elOption.classList.remove("disable");
		return true;
	}

	/**
	 * 选中指定节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	selectOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option") || elOption.state.disabled) return false;
		let elCurrent = this._elSelected;
		if (elCurrent === elOption) return true;
		if (fireEvent)
			if (this._sendEvent(EVT_SELECTION_CHANGING, { old: elCurrent, new: elOption })) return false;
		if (elCurrent) elCurrent.state.current = false;
		elOption.state.current = true;
		this._elSelected = elOption;
		if (fireEvent)
			this._sendEvent(EVT_SELECTION_CHANGED, { old: elCurrent, new: elOption });
		elOption.scrollIntoView();
		return true;
	}

	/**
	 * 清除当前选中的节点
	 */
	clearSelection() {
		if (this._elSelected) {
			this._elSelected.state.current = false;
			this._elSelected = null;
		}
	}

	/**
	 * 使节点显示在可见区域
	 * @param {Element<option>} elOption 
	 * @returns {Boolean}
	 */
	scrollToView(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		elOption.scrollIntoView();
		return true;
	}

	/**
	 * 展开指定节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	expandOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (!elOption.attributes["populated"]) {
			elOption.attributes["populated"] = true;
			this._sendEvent(EVT_POPULATE, elOption);
		}
		if (elOption.state.expanded) return true;
		if (fireEvent)
			if (this._sendEvent(EVT_EXPANDING, elOption)) return false;
		elOption.state.expanded = true;
		if (fireEvent)
			this._sendEvent(EVT_EXPANDED, elOption);
		return true;
	}

	/**
	 * 展开指定节点和所有子节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	expandOptionAll(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (!elOption.attributes["populated"]) {
			elOption.attributes["populated"] = true;
			this._sendEvent(EVT_POPULATE, elOption);
		}
		if (fireEvent) {
			if (!elOption.state.expanded) {
				if (elOption._sendEvent(EVT_EXPANDING)) return false;
			}
			for (let el of elOption.$$("option:node:not(expanded)")) {
				if (this._sendEvent(EVT_EXPANDING, el)) continue;
				el.state.expanded = true;
				this._sendEvent(EVT_EXPANDED, el);
			}
			if (!elOption.state.expanded) {
				elOption.state.expanded = true;
				this._sendEvent(EVT_EXPANDED, elOption);
			}
			return true;
		}
		else {
			for (let el of elOption.$$("option:node:not(expanded)"))
				el.state.expanded = true;
			elOption.state.expanded = true;
			return true;
		}
	}

	/**
	 * 展开指定节点所有父节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	expandParentOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		let elParent = elOption.parentElement.$p("option");
		while (elParent) {
			if (!elParent.state.expanded) {
				//if(fireEvent)
				//	if(this._sendEvent(EVT_EXPANDING, elParent)) break;
				elParent.state.expanded = true;
				if (fireEvent)
					this._sendEvent(EVT_EXPANDED, elParent);
			}
			elParent = (elParent.parentElement ? elParent.parentElement.$p("option") : null);
		}
		return true;
	}

	/**
	 * 折叠指定节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	collapseOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (elOption.state.collapsed) return true;
		if (fireEvent)
			if (this._sendEvent(EVT_COLLAPSING, elOption)) return false;
		elOption.state.collapsed = true;
		if (fireEvent)
			this._sendEvent(EVT_COLLAPSED, elOption);
		return true;
	}

	/**
	 * 折叠指定节点和所有子节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	collapseOptionAll(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (fireEvent) {
			if (!elOption.state.collapsed) {
				if (this._sendEvent(EVT_COLLAPSING, elOption)) return false;
			}
			for (let el of elOption.$$("option:node:not(collapsed)")) {
				if (this._sendEvent(EVT_COLLAPSING, el)) continue;
				el.state.collapsed = true;
				this._sendEvent(EVT_COLLAPSED, el);
			}
			if (!elOption.state.collapsed) {
				elOption.state.collapsed = true;
				this._sendEvent(EVT_COLLAPSED, elOption);
			}
			return true;
		}
		else {
			for (let el of elOption.$$("option:node:not(collapsed)"))
				el.state.collapsed = true;
			elOption.state.collapsed = true;
			return true;
		}
	}

	/**
	 * 勾选指定节点和所有子节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	checkOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (elOption.state.checked) return true;
		if (fireEvent) {
			function chk(el) {
				let oldState = this.getCheckState(el);
				let newState = CHECK_STATE_CHECKED;
				if (this._sendEvent(EVT_CHECK_STATE_CHANGING, { target: el, old: oldState, new: newState })) return 0;
				if (this.isNode(el)) {
					let nChkCnt = 0;
					let elChildren = el.$$(">option");
					for (let elChild of elChildren) {
						if (elChild.state.checked) {
							++nChkCnt;
							continue;
						}
						if (!elChild.state.disabled)
							nChkCnt += chk.call(this, elChild);
					}
					if (elChildren.length > 0 && nChkCnt === 0) {
						newState = oldState;
					}
					else if (elChildren.length !== nChkCnt) {
						newState = CHECK_STATE_INDETERMINATE;
					}
				}
				if (newState === CHECK_STATE_CHECKED) {
					if (!el.state.checked) {
						el.state.incomplete = false;
						el.state.checked = true;
						this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: el, old: oldState, new: newState });
					}
					return 1;
				}
				else if (newState === CHECK_STATE_INDETERMINATE) {
					if (!el.state.incomplete) {
						el.state.checked = false;
						el.state.incomplete = true;
						this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: el, old: oldState, new: newState });
					}
					return 0.5;
				}
				return 0;
			}
			chk.call(this, elOption);
		}
		else {
			elOption.state.incomplete = false;
			elOption.state.checked = true;
			if (this.isNode(elOption)) {
				for (let el of elOption.$$("option:not(checked)")) {
					if (el.state.disabled) continue;
					el.state.incomplete = false;
					el.state.checked = true;
				}
			}
		}
		this.refreshParentCheckState(elOption, true, fireEvent);
		return true;
	}

	/**
	 * 取消勾选指定节点和所有子节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	uncheckOption(elOption, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (!elOption.state.checked && !elOption.state.incomplete) return true;
		if (fireEvent) {
			function unchk(el) {
				let oldState = this.getCheckState(el);
				let newState = CHECK_STATE_UNCHECKED;
				if (this._sendEvent(EVT_CHECK_STATE_CHANGING, { target: el, old: oldState, new: newState })) return 0;
				if (this.isNode(el)) {
					let nUnchkCnt = 0;
					let elChildren = el.$$(">option");
					for (let elChild of elChildren) {
						if (!elChild.state.checked && !elChild.state.incomplete) {
							++nUnchkCnt;
							continue;
						}
						if (!elChild.state.disabled)
							nUnchkCnt += unchk.call(this, elChild);
					}
					if (elChildren.length > 0 && nUnchkCnt === 0) {
						newState = oldState;
					}
					else if (elChildren.length !== nUnchkCnt) {
						newState = CHECK_STATE_INDETERMINATE;
					}
				}
				if (newState === CHECK_STATE_UNCHECKED) {
					if (el.state.incomplete || el.state.checked) {
						el.state.incomplete = false;
						el.state.checked = false;
						this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: el, old: oldState, new: newState });
					}
					return 1;
				}
				else if (newState === CHECK_STATE_INDETERMINATE) {
					if (!el.state.incomplete) {
						el.state.checked = false;
						el.state.incomplete = true;
						this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: el, old: oldState, new: newState });
					}
					return 0.5;
				}
				return 0;
			}
			unchk.call(this, elOption);
		}
		else {
			elOption.state.incomplete = false;
			elOption.state.checked = false;
			if (this.isNode(elOption)) {
				for (let el of elOption.$$("option:not(disabled)")) {
					el.state.incomplete = false;
					el.state.checked = false;
				}
			}
		}
		this.refreshParentCheckState(elOption, true, fireEvent);
		return true;
	}

	/**
	 * 刷新指定节点的所有父节点的勾选状态
	 * @param {Element<option>} elOption 
	 * @param {Boolean} includingThis 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	refreshParentCheckState(elOption, includingThis, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		let elParent = elOption.parentElement;
		if (!elParent || elParent === this) return false;

		let newState = CHECK_STATE_UNCHECKED;
		let lastState = -1;
		for (let el of elParent.$$(">option")) {
			if (!includingThis && el === elOption) continue;
			newState = this.getCheckState(el);
			if (newState !== lastState && lastState !== -1) {
				lastState = CHECK_STATE_INDETERMINATE;
				break;
			}
			lastState = newState;
		}

		let bStateChanged = false;
		switch (lastState) {
			case CHECK_STATE_CHECKED:
				{
					if (!elParent.state.checked) {
						let oldState = this.getCheckState(elParent);
						bStateChanged = true;
						elParent.state.incomplete = false;
						elParent.state.checked = true;
						if (fireEvent) this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: elParent, old: oldState, new: lastState });
					}
					break;
				}
			case CHECK_STATE_INDETERMINATE:
				{
					if (!elParent.state.incomplete) {
						let oldState = this.getCheckState(elParent);
						bStateChanged = true;
						elParent.state.checked = false;
						elParent.state.incomplete = true;
						if (fireEvent) this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: elParent, old: oldState, new: lastState });
					}
					break;
				}
			default:
				{
					if (elParent.state.checked || elParent.state.incomplete) {
						let oldState = this.getCheckState(elParent);
						bStateChanged = true;
						elParent.state.incomplete = false;
						elParent.state.checked = false;
						if (fireEvent) this._sendEvent(EVT_CHECK_STATE_CHANGED, { target: elParent, old: oldState, new: lastState });
					}
				}
		}

		if (bStateChanged)
			return this.refreshParentCheckState(elParent, true, fireEvent);
		return true;
	}

	/**
	 * 移除指定节点
	 * @param {Element<option>} elOption 
	 * @param {Boolean} changeSelection 
	 * @param {Boolean} fireEvent 
	 * @returns {Boolean}
	 */
	removeOption(elOption, changeSelection, fireEvent) {
		if (!elOption || !elOption.$is("option")) return false;
		if (elOption === this._elSelected && changeSelection) {
			let elSelect = elOption.nextElementSibling;
			while (elSelect) {
				if (this.selectOption(elSelect, fireEvent)) break;
				elSelect = elSelect.nextElementSibling;
			}
			if (elOption === this._elSelected) {
				elSelect = elOption.previousElementSibling;
				while (elSelect) {
					if (this.selectOption(elSelect.$p("option"), fireEvent)) break;
					elSelect = elSelect.previousElementSibling;
				}
			}
		}
		if (elOption === this._elSelected) this._elSelected = null;
		let elParent = elOption.parentElement;
		elOption.remove();
		if (elParent && elParent.$is("option") && !elParent.$(">option")) {
			elParent.state.expanded = false;
			elParent.state.collapsed = false;
		}
		return true;
	}

	/**
	 * 移除所有节点
	 */
	removeOptionAll() {
		this._elSelected = null;
		this.clear();
	}

}

/**
 * TreeView事件处理器
 */

const HIT_CAPTION = 0;
const HIT_COLLAPSE_BUTTON = 1;
const HIT_CHECKBOX = 2;

class EventHandler {
	/** @type {pfwTreeView} */
	tree = null;
	/** @type {DragDropHandler} */
	_dd = null;
	_lastMouseEvent = null;
	_lastMouseOpt = null;

	constructor(tree) {
		this.tree = tree;
		let mouseHandler = (handler) => {
			return (evt) => {
				let opt = evt.target.$p("option");
				let rv = handler.call(this, evt, opt);
				this._lastMouseEvent = evt.type;
				this._lastMouseOpt = opt;
				return rv;
			}
		}
		let keyHandler = (handler) => {
			return (evt) => {
				let opt = this.tree._elSelected;
				let rv = handler.call(this, evt, opt);
				return rv;
			}
		}
		tree.on("mousedown", "option", mouseHandler(this.onMouseDown));
		tree.on("mouseup", "option", mouseHandler(this.onMouseUp));
		tree.on("dblclick", "option", mouseHandler(this.onDoubleClick));
		tree.on("keydown", keyHandler(this.onKeyDown));
	}

	enableDragDrop(enable) {
		if (enable && !this._dd) {
			this._dd = new DragDropHandler(this.tree);
		}
		else if (!enable && this._dd) {
			this._dd.detach();
			this._dd = null;
		}
		return true;
	}

	hitTest(evt, elOption, where) {
		if (elOption.state.disabled) return false;
		switch (where) {
			case HIT_CAPTION:
				{
					const [x1, y1, x2, y2] = elOption.$(">caption").state.box("rect", "border", "window");
					return (evt.windowX >= x1 && evt.windowX <= x2 && evt.windowY >= y1 && evt.windowY <= y2);
				}
			case HIT_COLLAPSE_BUTTON:
				{
					if (!this.tree.isNode(elOption)) return false;
					return evt.target.$is("option") && evt.isOnIcon;
				}
			case HIT_CHECKBOX:
				{
					if (!this.tree.isCheckBoxEnabled()) return false;
					if (this.tree.isNode(elOption)) {
						return evt.target.$is("caption") && evt.isOnIcon;
					}
					else {
						return evt.target.$is("option") && evt.isOnIcon;
					}
					break;
				}
			default:
				{
					return false;
				}
		}
	}

	onMouseDown(evt, opt) {
		if (evt.target.$is("input")) return false;
		if (evt.button !== 1) return false;
		if (evt.target.$is("input")) {
			this.tree.selectOption(evt.target.$p("option"), true);
			return false;
		}
		if (!opt) return false;
		if (this.hitTest(evt, opt, HIT_COLLAPSE_BUTTON)) {
			if (opt.state.expanded)
				this.tree.collapseOption(opt, true);
			else if (opt.state.collapsed)
				this.tree.expandOption(opt, true);
		}
		else if (!this.hitTest(evt, opt, HIT_CHECKBOX) && this.hitTest(evt, opt, HIT_CAPTION)) {
			this.tree.selectOption(opt, true);
		}
		this.tree.focus();
		return true;
	}

	onMouseUp(evt, opt) {
		if (evt.target.$is("input")) return false;
		if (!opt) return false;
		if (this._lastMouseEvent !== "mousedown" || this._lastMouseOpt !== opt) return false;
		if (evt.button === 1) {
			if (this.hitTest(evt, opt, HIT_CHECKBOX)) {
				!opt.state.checked ? this.tree.checkOption(opt, true) : this.tree.uncheckOption(opt, true);
			}
			else if (this.hitTest(evt, opt, HIT_CAPTION)) {
				this.tree._sendEvent(EVT_CLICKED, opt);
			}
		}
		else if (evt.button === 2) {
			if (this.hitTest(evt, opt, HIT_CAPTION))
				this.tree._postEvent(EVT_RIGHT_CLICKED, opt);
		}
		return true;
	}

	onDoubleClick(evt, opt) {
		if (evt.target.$is("input")) return false;
		if (!opt) return false;
		if (evt.button === 1) {
			if (this.hitTest(evt, opt, HIT_CHECKBOX)) {
				!opt.state.checked ? this.tree.checkOption(opt, true) : this.tree.uncheckOption(opt, true);
			}
			else if (this.hitTest(evt, opt, HIT_COLLAPSE_BUTTON)) {
				if (opt.state.expanded)
					this.tree.collapseOption(opt, true);
				else if (opt.state.collapsed)
					this.tree.expandOption(opt, true);
			}
			else if (this.hitTest(evt, opt, HIT_CAPTION)) {
				if (this.tree._sendEvent(EVT_DOUBLE_CLICKED, opt)) return true;
				if (opt.state.expanded)
					this.tree.collapseOption(opt, true);
				else if (opt.state.collapsed)
					this.tree.expandOption(opt, true);
			}
		}
		else if (evt.button === 2) {
			if (this.hitTest(evt, opt, HIT_CAPTION))
				this.tree._postEvent(EVT_DOUBLE_RIGHT_CLICKED, opt);
		}
		return true;
	}

	onKeyDown(evt, opt) {
		if (evt.target.$is("input")) return false;

		if (evt.code === "Home") {
			this.tree.selectOption(this.tree.$(">option"), true);
			return true;
		}
		else if (evt.code === "End") {
			let optLast = this.tree.lastElementChild?.$p("option");
			if (optLast?.state.expanded) {
				let optChild = optLast.lastElementChild?.$p("option");
				while (optChild && optChild !== optLast) {
					optLast = optChild;
					if (!optChild.state.expanded) break;
					optChild = optChild.lastElementChild?.$p("option");
				}
			}
			this.tree.selectOption(optLast, true);
			return true;
		}

		if (!opt) return false;

		if (!this.tree.state.focus) this.tree.focus();

		switch (evt.code) {
			case "ArrowLeft":
				{
					if (this.tree.isNode(opt)) {
						if (opt.state.expanded) {
							this.tree.collapseOption(opt, true);
						}
						else {
							this.tree.collapseOption(opt.parentElement, true);
							this.tree.selectOption(opt.parentElement, true);
						}
					}
					return true;
				}
			case "ArrowRight":
				{
					if (this.tree.isNode(opt)) {
						if (opt.state.collapsed)
							this.tree.expandOption(opt, true);
						else
							this.tree.selectOption(opt.$(">option"), true);
					}
					return true;
				}
			case "ArrowUp":
				{
					let optPrior = opt.previousElementSibling?.$p("option");
					while (optPrior?.state.disabled) {
						optPrior = optPrior.previousElementSibling?.$p("option");
					}
					if (optPrior) {
						if (optPrior !== opt.parentElement && optPrior.state.expanded) {
							let optChild = optPrior.lastElementChild?.$p("option");
							while (optChild && optChild !== optPrior) {
								if (optChild.state.disabled) {
									optChild = optChild.previousElementSibling?.$p("option");
									continue;
								}
								optPrior = optChild;
								if (!optChild.state.expanded) break;
								optChild = optChild.lastElementChild?.$p("option");
							}
						}
						this.tree.selectOption(optPrior, true);
					}
					return true;
				}
			case "ArrowDown":
				{
					let optNext;
					if (opt.state.expanded)
						optNext = opt.$(">option");
					else
						optNext = opt.nextElementSibling;
					while (optNext?.state.disabled) {
						optNext = optNext.nextElementSibling;
					}
					if (!optNext) {
						let optParent = opt.parentElement;
						while (optParent && optParent !== this) {
							if (optParent.nextElementSibling && !optParent.nextElementSibling.state.disabled) {
								optNext = optParent.nextElementSibling;
								break;
							}
							optParent = optParent.parentElement;
						}
					}
					this.tree.selectOption(optNext, true);
					return true;
				}
			case "Space":
				{
					if (!opt.state.checked)
						this.tree.checkOption(opt, true);
					else
						this.tree.uncheckOption(opt, true);
					return true;
				}
		}

		return false;
	}

}

/**
 * 实现TreeView的拖拽操作
 */

const DD_X_THRESHOLD = 4;
const DD_Y_THRESHOLD = 4;
const DD_LINE_SIZE = 1;
const DD_AM_DURATION = 200;

class DragDropHandler {
	/** @type {pfwTreeView} */
	tree = null;
	px_as_dip = false;
	_dragging = false;
	_animating = false;
	_drag_source = null;
	_drop_target = null;
	_drop_where = 0;
	_drop_marker_pos = { x1: 0, y1: 0, x2: 0, y2: 0 };
	_mouse_target = 0;
	_mouse_where = 0;
	_mouse_down_opt = null;
	_mouse_down_pos = { x: 0, y: 0 };
	_last_mouse_pos = { x: 0, y: 0 };
	_snap_image = null;
	_snap_image_pos = { x: 0, y: 0, w: 0, h: 0 };

	constructor(tree) {
		this.tree = tree;
		this.px_as_dip = (tree.state.pixelsIn("1px") === tree.state.pixelsIn("1dip"));
		let mouseHandler = (evt) => {
			return this.onMouse(evt);
		};
		tree.on("mousedown.dd", "option", mouseHandler);
		tree.on("^mouseup.dd", "option", mouseHandler);
		tree.on("^mousemove.dd", "option", mouseHandler);
		tree.on("^mousewheel.dd", "option", mouseHandler);
	}

	detach() {
		if (this._mouse_down_opt) {
			this._mouse_down_opt.state.capture(false);
			this._mouse_down_opt = null;
		}
		if (this._dragging) {
			this.doDrop({});
		}
		this.tree.off(".dd");
	}

	getEventLocalPos(evt) {
		let evtX = evt.windowX;
		let evtY = evt.windowY;
		//NOTE
		//Event.window-X/Y的单位是pixel，在禁用PX_AS_DIP特性后需要转换为dip
		if (!this.px_as_dip) {
			evtX /= devicePixelRatio;
			evtY /= devicePixelRatio;
		}
		return this.tree.state.mapWindowToLocal(evtX, evtY);
	}

	getElementLocalPos(el) {
		const [x, y] = el.state.box("position", "border", "window", false);
		return this.tree.state.mapWindowToLocal(x, y);
	}

	getElementLocalRectW(el) {
		let [x, y, w, h] = el.state.box("xywh", "border", "window", false);
		[x, y] = this.tree.state.mapWindowToLocal(x, y);
		return [x, y, w, h];
	}

	belongsTo(src, dst) {
		while (src) {
			if (src.parentElement === dst) return true;
			src = src.parentElement;
		}
		return false;
	}

	onMouse(evt) {
		if (this._animating) return false;

		switch (evt.type) {
			case "mousedown":
				{
					if (evt.button !== 1) return false;
					if (evt.isOnIcon) return false;
					if (evt.target.$is("input")) break;
					let opt = evt.target.$p("option");
					if (!opt) break;
					const [evtX, evtY] = this.getEventLocalPos(evt);
					const [x, y, w, h] = this.getElementLocalRectW(opt.$(">caption"));
					if (evtY < y || evtY > y + h) break;
					this._mouse_down_opt = opt;
					this._mouse_down_pos.x = evtX;
					this._mouse_down_pos.y = evtY;
					this._mouse_down_opt.state.capture("strict");
					break;
				}
			case "mouseup":
				{
					if (this._mouse_down_opt) {
						this._mouse_down_opt.state.capture(false);
						this._mouse_down_opt = null;
					}
					if (this._dragging) {
						this.doDrop(evt);
						return true;
					}
					break;
				}
			case "mousemove":
				{
					if (evt.button !== 1) return false;
					if (this._dragging) {
						this.doDragMove(evt);
					} else {
						if (!this._mouse_down_opt) break;
						const [evtX, evtY] = this.getEventLocalPos(evt);
						if (Math.abs(evtX - this._mouse_down_pos.x) > DD_X_THRESHOLD ||
							Math.abs(evtY - this._mouse_down_pos.y) > DD_Y_THRESHOLD) {
							this.doBeginDrag(evt);
							return true;
						}
					}
					break;
				}
			case "wheel":
				{
					if (this._dragging && this._mouse_where !== 0) {
						this._drop_target?.classList.remove("dragenter");
						this._drop_target = this._mouse_target = null;
						this._drop_where = this._mouse_where = 0;
						this.tree.requestPaint();
					} else if (!this._dragging) {
						if (this._mouse_down_opt) {
							this._mouse_down_opt.state.capture(false);
							this._mouse_down_opt = null;
						}
					}
					break;
				}
		}

		return false;
	}

	doBeginDrag(evt) {
		assert(!this._dragging && this._mouse_down_opt);
		if (this.tree._sendEvent(EVT_BEGIN_DRAG, this._mouse_down_opt)) return false;

		const [evtX, evtY] = this.getEventLocalPos(evt);
		this._drag_source = this._mouse_down_opt;

		const [x, y, w, h] = this.getElementLocalRectW(this._drag_source);
		this._snap_image = new Graphics.Image(w, h, this._drag_source);
		this._snap_image_pos.x = x + (evtX - this._mouse_down_pos.x);
		this._snap_image_pos.y = y + (evtY - this._mouse_down_pos.y);
		this._snap_image_pos.w = w;
		this._snap_image_pos.h = h;

		this.tree.paintForeground = (gfx) => this.onPaintFkgnd(gfx);

		this._drag_source.classList.add("dragging");
		this._dragging = true;
		this.tree.requestPaint();

		this._last_mouse_pos.x = evtX;
		this._last_mouse_pos.y = evtY;

		return true;
	}

	doEndDrag() {
		assert(this._dragging && this._drag_source);
		this.tree._sendEvent(EVT_END_DRAG, this._drag_source);

		this.tree.paintForeground = null;

		this._drop_target = this._mouse_target = this._drag_source = this._snap_image = null;
		this._drop_where = this._mouse_where = 0;
		this._dragging = false;

		this.tree.requestPaint();
	}

	doDragMove(evt) {
		assert(this._dragging && this._drag_source);

		const [evtX, evtY] = this.getEventLocalPos(evt);
		const cx = evtX - this._last_mouse_pos.x;
		const cy = evtY - this._last_mouse_pos.y;
		if (cx === 0 && cy === 0) return;

		this._last_mouse_pos.x = evtX;
		this._last_mouse_pos.y = evtY;
		this._snap_image_pos.x += cx;
		this._snap_image_pos.y += cy;

		let elFound = this.tree.elementFromPoint(evtX, evtY);
		if (elFound === this.tree) elFound = null;
		if (elFound && this.belongsTo(elFound, this._drag_source)) elFound = null;
		if (elFound && !elFound.$is("option")) elFound = elFound.$p("option");
		if (elFound && (elFound === this._drag_source || elFound.state.disabled)) elFound = null;

		if (this._mouse_target !== elFound) {
			this._mouse_target = elFound;
			if (this._drop_target) {
				this.tree._sendEvent(EVT_DRAG_LEAVE, { drag: this._drag_source, target: this._drop_target, where: this._drop_where });
				this._drop_target.classList.remove("dragenter");
				this._drop_target = null;
			}
			this._drop_where = this._mouse_where = 0;
		}

		if (this._mouse_target) {
			let nWhere = 0;
			let [x, y, w, h] = this.getElementLocalRectW(this._mouse_target);
			if (evtY < y + (h / 3)) {
				nWhere = DD_DROP_WHERE_BEFORE;
			}
			else if (evtY >= y + (h / 3) && evtY <= y + (h / 3) * 2) {
				nWhere = DD_DROP_WHERE_INSIDE;
			}
			else if (evtY >= y + (h / 3) * 2 && evtY <= y + h) {
				nWhere = DD_DROP_WHERE_AFTER;
			}
			if (nWhere !== this._mouse_where) {
				this._mouse_where = nWhere;
				if (this._drop_where !== 0) {
					this.tree._sendEvent(EVT_DRAG_LEAVE, { drag: this._drag_source, target: this._drop_target, where: this._drop_where });
				}
				//如果DOM序不会改变则目标位置视为无效
				switch (nWhere) {
					case DD_DROP_WHERE_BEFORE:
						{
							if (this._drag_source === this._mouse_target.previousElementSibling)
								nWhere = 0;
							break;
						}
					case DD_DROP_WHERE_AFTER:
						{
							if (this._drag_source === this._mouse_target.nextElementSibling)
								nWhere = 0;
							break;
						}
					case DD_DROP_WHERE_INSIDE:
						{
							if (this._drag_source.parentElement === this._mouse_target)
								nWhere = 0;
							break;
						}
				}
				if (nWhere !== 0) {
					if (this.tree._sendEvent(EVT_DRAG_ENTER, { drag: this._drag_source, target: this._mouse_target, where: nWhere }))
						nWhere = 0;
				}
				this._drop_where = nWhere;
				if (this._drop_where !== 0) {
					[x, y, w, h] = this.getElementLocalRectW(this._mouse_target);
					if (this._drop_where === DD_DROP_WHERE_INSIDE) {
						this._drop_marker_pos.x1 = x;
						this._drop_marker_pos.y1 = y;
						this._drop_marker_pos.x2 = w;
						this._drop_marker_pos.y2 = h;
					}
					else {
						if (this._drop_where === DD_DROP_WHERE_AFTER) {
							y += h;
						}
						this._drop_marker_pos.x1 = x;
						this._drop_marker_pos.y1 = y;
						this._drop_marker_pos.x2 = x + w;
						this._drop_marker_pos.y2 = y;
					}
					if (!this._drop_target) {
						this._drop_target = this._mouse_target;
						this._drop_target.classList.add("dragenter");
					}
				}
				else if (this._drop_target) {
					this._drop_target.classList.remove("dragenter");
					this._drop_target = null;
				}
			}
		}

		this.tree.requestPaint();
	};

	doDrop(evt) {
		assert(this._dragging && this._drag_source);

		this._drag_source.classList.remove("dragging");
		this._drop_target?.classList.remove("dragenter");

		if (this._drop_target && evt.button === 1) {
			if (!this.tree._sendEvent(EVT_DRAG_DROP, { drag: this._drag_source, target: this._drop_target, where: this._drop_where })) {
				let elParent = this._drag_source.parentElement;

				if (this.tree.isCheckBoxEnabled()) this.tree.refreshParentCheckState(this._drag_source, false, true);

				switch (this._drop_where) {
					case DD_DROP_WHERE_BEFORE:
						{
							if (this._drag_source !== this._drop_target.previousElementSibling) {
								this._drag_source.remove();
								this._drop_target.parentElement.insertBefore(this._drag_source, this._drop_target);
							}
							break;
						}
					case DD_DROP_WHERE_AFTER:
						{
							if (this._drag_source !== this._drop_target.nextElementSibling) {
								this._drag_source.remove();
								this._drop_target.parentElement.insertAfter(this._drag_source, this._drop_target);
							}
							break;
						}
					case DD_DROP_WHERE_INSIDE:
						{
							if (this._drag_source.parentElement !== this._drop_target) {
								this._drag_source.remove()
								this._drop_target.appendChild(this._drag_source);
							}
							this.tree.expandOption(this._drop_target, true);
							break;
						}
				}
				this._drag_source.scrollIntoView();
				this._drop_target.state.hover = false;

				if (this.tree.isCheckBoxEnabled()) this.tree.refreshParentCheckState(this._drag_source, true, true);

				if (elParent && elParent.$is("option") && !elParent.$(">option")) {
					elParent.state.expanded = false;
					elParent.state.collapsed = false;
				}

			}
		}

		this._drop_target = null;

		this.doDropAnimate();
	}

	doDropAnimate() {
		assert(!this._animating && this._dragging && this._drag_source);
		const easef = (t, b, c, d) => { return Math.trunc(-c * (t /= d) * (t - 2) + b); }
		const [fromx, fromy] = [this._snap_image_pos.x, this._snap_image_pos.y];
		const [tox, toy] = this.getElementLocalPos(this._drag_source);
		const me = this;
		function amf(progress) {
			if (progress >= 1.0) {
				if (me._animating) {
					me._animating = false;
					me.doEndDrag();
				}
				return false;
			}
			me._snap_image_pos.x = easef(progress, fromx, tox - fromx, 1.0);
			me._snap_image_pos.y = easef(progress, fromy, toy - fromy, 1.0);
			this.requestPaint();
			return true;
		}
		this.tree.animate(amf, { duration: DD_AM_DURATION });
		this._animating = true;
	}

	onPaintFkgnd(gfx) {
		const [x, y, w, h] = this.tree.state.box("xywh", "inner");
		//预定义区域暂时有缩放BUG 2022-01-24
		//issue: https://sciter.com/forums/topic/graphics-pushlayer-drawimage-incorrect-calculation-on-high-dpi-screen/
		//gfx.pushLayer("background-area");
		gfx.pushLayer(x, y, w, h);
		gfx.draw(this._snap_image, { x: this._snap_image_pos.x, y: this._snap_image_pos.y, width: this._snap_image_pos.w, height: this._snap_image_pos.h, opacity: 0.5 });
		if (this._drop_target) {
			const css_vars = this.tree.style.variables();
			if (this._drop_where === DD_DROP_WHERE_INSIDE) {
				gfx.fillStyle = css_vars.clr_drag_marker_bkgnd;
				gfx.strokeStyle = css_vars.clr_drag_marker_border;
				gfx.strokeWidth = DD_LINE_SIZE;
				gfx.setLineDash([4, 4]);
				gfx.beginPath();
				gfx.rect(this._drop_marker_pos.x1, this._drop_marker_pos.y1, this._drop_marker_pos.x2, this._drop_marker_pos.y2);
				gfx.fill();
				gfx.stroke();
			}
			else {
				gfx.strokeStyle = css_vars.clr_drag_marker_border;
				gfx.strokeWidth = DD_LINE_SIZE;
				gfx.setLineDash([4, 4]);
				gfx.beginPath();
				gfx.moveTo(this._drop_marker_pos.x1, this._drop_marker_pos.y1);
				gfx.lineTo(this._drop_marker_pos.x2, this._drop_marker_pos.y2);
				gfx.stroke();
			}
		}
		gfx.popLayer();
	}
}
