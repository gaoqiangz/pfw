import * as iconfont from "../common/iconfont";

//事件定义
const EVT_COLLAPSING = "sb-collapsing"; //菜单[evt.data]将被折叠,返回true阻止
const EVT_COLLAPSED = "sb-collapsed"; //菜单[evt.data]被折叠
const EVT_EXPANDING = "sb-expanding"; //菜单[evt.data]将被展开,返回true阻止
const EVT_EXPANDED = "sb-expanded"; //菜单[evt.data]被展开
const EVT_POPULATE = "sb-populate"; //菜单[evt.data]将被首次展开,返回true阻止
const EVT_SELECTION_CHANGING = "sb-selection-changing"; //当前菜单项[evt.data:{old,new}]选择将被改变,返回true阻止 (需要开启enableItemSelect)
const EVT_SELECTION_CHANGED = "sb-selection-changed"; //当前菜单项[evt.data:{old,new}]选择被改变 (需要开启enableItemSelect)
const EVT_CLICKED = "sb-clicked"; //菜单[evt.data]被左键单击
//插入元素位置[place]
const PLACE_APPEND = 0;
const PLACE_BEFORE = 1;
const PLACE_AFTER = 2;

export class pfwSidebar extends Element {
	_bItemSelect = false;
	_elSelected = null;
	_elHover = null;
	_elPopup = null;

	["on click at caption"](evt, target) {
		return this._handleLClick(target, false);
	}

	["on dblclick at caption"](evt, target) {
		return this._handleLClick(target, true);
	}

	["on ~mousedown at caption"](evt, target) {
		let elTarget = target.$p("option");
		if (!elTarget.$(">options")) {
			if (this._bItemSelect) {
				if (!this.selectOption(elTarget, true)) return true;
			}
		}
		return false;
	}

	["on mousemove at caption"](evt, target) {
		if (!this.state.collapsed) return false;
		let elOption = target.$p("option");
		if (elOption !== this._elHover) {
			if (elOption.parentElement !== this) return false;
			this._closePopup();
			this._elHover = elOption;
			if (!elOption) return false;
			this._elPopup = elOption.$(">options");
			if (!this._elPopup) return false;
			elOption.popup(this._elPopup, { anchorAt: 9, popupAt: 7 });
		}
		return false;
	}

	/**
	 * 同步事件派发
	 * @private
	 * @param {String} name 
	 * @param {*} param 
	 * @returns {Boolean}
	 */
	_sendEvent(name, param) {
		return this.dispatchEvent(new CustomEvent(name, { detail: param }));
	}

	/**
	 * 统一处理鼠标左键点击事件
	 * @private
	 * @param {Element} target 
	 * @param {Boolean} dbl 
	 * @returns {Boolean}
	 */
	_handleLClick(target, dbl) {
		let elTarget = target.$p("option");
		if (elTarget.$(">options")) {
			if (elTarget.parentElement !== this || !this.state.collapsed) {
				if (elTarget.state.expanded)
					this.collapseOption(elTarget, true);
				else
					this.expandOption(elTarget, true);
			}
		}
		else {
			this._elPopup && this._closePopup();
		}
		this._sendEvent(EVT_CLICKED, elTarget);
		return false;
	}

	/**
	 * 关闭浮动显示
	 * @private
	 */
	_closePopup() {
		if (this._elPopup) {
			this._elPopup.state.popup = false;
			this._elPopup = null;
			this._elHover = null;
		}
	}

	/**
	 * 构建菜单项图标`VNode`
	 * @param {String} image 
	 * @returns {VNode}
	 */
	_buildVIcon(image) {
		if (!image) return undefined;
		if (iconfont.isUri(image)) {
			let [charCode, clsFont] = iconfont.crackUri(image);
			return <span class={`sb-img ${clsFont}`} state-html={charCode}></span>;
		}
		else {
			let sStyle = "";
			let i = image.indexOf("{");
			if (i > 0) {
				sStyle = image.slice(i + 1, -1);
				image = image.slice(0, i);
			}
			return <img class="sb-img" src={this.onNormalizeUrl(image)} style={sStyle} />;
		}
	}


	/** 构建菜单项`VNode`
	 * @private
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 (`#`前缀指示为`icon-font`码点,`@`指定字体名[可选],如:`#f104@myFont`)
	 * @param {String} tipText 提示
	 * @returns {VNode<option>}
	 */
	_buildVOption(text, textIsHtml, image, tipText) {
		text = text || "";
		tipText = tipText || "";
		return <option text={!textIsHtml ? text : undefined} image={image}>
			<caption tooltip={tipText}>
				{this._buildVIcon(image)}
				<text state-html={textIsHtml ? text : undefined}>{!textIsHtml ? text : undefined}</text>
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
	 * 设置菜单项是否具有选择状态
	 * @param {Boolean} enable
	 * @returns {Boolean}
	 */
	enableItemSelect(enable) {
		this._bItemSelect = enable;
		if (this._elSelected && !enable) {
			this._elSelected.state.current = false;
			this._elSelected = null;
		}
		return true;
	}

	/**
	 * 设置CSS变量
	 * @param {object} vars
	 * @returns {Boolean}
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
	 * 批量加载菜单 (使用`VNode`加载以最大化性能)
	 * @param {Array<object>} data
	 * ```js
	 * [{
	 * 	text:"text",
	 * 	textIsHtml:false,
	 * 	image:"uri",
	 * 	tipText:"text",
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
				let vopt = this._buildVOption(item.text, item.textIsHtml, item.image, item.tipText);
				if (!vopt) return false;
				if (item.attributes instanceof Object)
					Object.assign(vopt[1], item.attributes);
				if (item.children instanceof Array) {
					let vopts = <options />;
					vopt[2].push(vopts);
					if (!loader(vopts[2], item.children)) return false;
				}
				options.push(vopt);
			}
			return true;
		};
		if (!loader(options, data)) return false;
		this.removeOptionAll();
		this.append(options);
		return true;
	}

	/**
	 * 插入菜单组
	 * @param {Element<option>} elOwner
	 * @param {long} place 插入位置 (`PLACE_BEFORE`/`PLACE_AFTER`/`PLACE_APPEND`)
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标 (`#`前缀指示为`icon-font`码点,`@`指定字体名[可选],如:`#f104@myFont`)
	 * @param {String} tipText 提示
	 * @returns {Element<option>}
	 */
	insertOption(elOwner, place, text, textIsHtml, image, tipText) {
		if (!elOwner) return null;

		let elOption = this._buildVOption(text, textIsHtml, image, tipText);
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
				if (elOwner !== this) {
					let elOptions = elOwner.$(">options");
					if (!elOptions) {
						elOptions = document.createElement("options");
						elOwner.appendChild(elOptions);
					}
					elOwner = elOptions;
				}
				elOwner.append(elOption);
				elOption = elOwner.lastElementChild;
				break;
			}
		}

		return elOption;
	}

	/**
	 * 添加菜单组
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标
	 * @param {String} tipText 提示
	 * @returns {Element<option>}
	 */
	addOption(text, textIsHtml, image, tipText) {
		return this.insertOption(this, PLACE_APPEND, text, textIsHtml, image, tipText);
	}

	/**
	 * 添加子菜单组
	 * @param {Element<option>} elOwner
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @param {String} image 图标
	 * @param {String} tipText 提示
	 * @returns {Element<option>}
	 */
	addChildOption(elOwner, text, textIsHtml, image, tipText) {
		return this.insertOption(elOwner, PLACE_APPEND, text, textIsHtml, image, tipText);
	}

	/**
	 * 删除菜单
	 * @param {Element<option>} elOption
	 * @returns {Boolean}
	 */
	removeOption(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		if (elOption === this._elSelected) this._elSelected = null;
		if (elOption === this._elPopup) this._closePopup();
		elOption.remove();
		return true;
	}

	/**
	 * 删除子菜单项
	 * @param {Element<option>} elOption
	 * @returns {Boolean}
	 */
	removeOptionChildren(elOption) {
		if (!elOption || !elOption.$is("option")) return false;
		let elOptions = elOption.$(">options");
		if (elOptions) elOptions.clear();
		return true;
	}

	/**
	 * 删除所有菜单
	 * @returns {Boolean}
	 */
	removeOptionAll() {
		this._elSelected = null;
		this._closePopup();
		this.clear();
		return true;
	}

	/**
	 * 折叠菜单组
	 * @param {Element<option>} elOption
	 * @param {Boolean} [triggerEvent=true]
	 * @returns {Boolean}
	 */
	collapseOption(elOption, triggerEvent = false) {
		if (!elOption) return false;
		if (!elOption.$(">options")) elOption.append(<options />);
		if (triggerEvent) {
			if (this._sendEvent(EVT_COLLAPSING, elOption)) return false;
		}
		elOption.state.collapsed = true;
		if (triggerEvent) {
			this._sendEvent(EVT_COLLAPSED, elOption);
		}
		return true;
	}

	/**
	 * 展开菜单组
	 * @param {Element<option>} elOption
	 * @param {Boolean} [triggerEvent=true]
	 * @returns {Boolean}
	 */
	expandOption(elOption, triggerEvent = false) {
		if (!elOption) return false;
		if (!elOption.$(">options")) elOption.append(<options />);
		if (triggerEvent) {
			if (this._sendEvent(EVT_EXPANDING, elOption)) return false;
		}
		if (!elOption.attributes["populated"]) {
			if (this._sendEvent(EVT_POPULATE, elOption)) return false;
			elOption.attributes["populated"] = true;
		}
		elOption.state.expanded = true;
		if (triggerEvent) {
			this._sendEvent(EVT_EXPANDED, elOption);
		}
		return true;
	}

	/**
	 * 获取选择的菜单项
	 * @returns {Element<option>}
	 */
	getSelectedOption() {
		return this._elSelected;
	}

	/**
	* 选择菜单项
	 * @param {Element<option>} elOption
	 * @param {Boolean} [triggerEvent=true]
	 * @returns {Boolean}
	 */
	selectOption(elOption, triggerEvent = false) {
		if (this._elSelected === elOption) return true;
		let data = null;
		if (triggerEvent) {
			data = {
				old: this._elSelected,
				new: elOption
			};
			if (this._sendEvent(EVT_SELECTION_CHANGING, data)) return false;
		}
		if (this._elSelected) this._elSelected.state.current = false;
		this._elSelected = elOption;
		if (this._elSelected)
			this._elSelected.state.current = true;
		if (triggerEvent) {
			this._sendEvent(EVT_SELECTION_CHANGED, data);
		}
		return true;
	}

	/**
	 * 清空选择的菜单项
	 * @returns {Boolean}
	 */
	clearSelection() {
		return Select(null, false);
	}

	/**
	 * 获取菜单项文本
	 * @param {Element<option>} elOption
	 * @returns {String}
	 */
	getText(elOption) {
		if (!elOption) return "";
		return elOption.attributes["text"];
	}

	/**
	 * 设置菜单项文本
	 * @param {Element<option>} elOption
	 * @param {String} text
	 * @param {Boolean} textIsHtml text为html格式
	 * @returns {Boolean}
	 */
	setText(elOption, text, textIsHtml = false) {
		if (!elOption) return false;
		if (textIsHtml)
			elOption.$(">caption>text").innerHTML = text;
		else
			elOption.$(">caption>text").innerText = text;
		elOption.attributes["text"] = textIsHtml ? null : text;
		return true;
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
		let elImg = elCaption.$(">.sb-img");
		if (image) {
			let vnode = this._buildVIcon(image);
			if (!vnode) return false;
			elCaption.append(vnode);
			if (elImg) {
				elCaption.replaceChild(elCaption.lastElementChild, elImg);
			}
		}
		else {
			elImg?.remove();
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

}
