export class Manager {
    static __fonts = {};

    static addFont(font) {
        if (!font || !font.url) return false;
        font.name = font.name || "default";
        if (this.__fonts[font.name]) return true;
        this.__fonts[font.name] = font;
        this.updateStyle();
        return true;
    }

    static updateStyle() {
        let sText = "";
        for (let name in this.__fonts) {
            let font = this.__fonts[name];
            sText += `@font-face { font-family: 'icf@${name}'; src: url('${font.url}'); } .icon-font-${name} { display: inline-block; font-family: 'icf@${name}'; font-rendering-mode: sub-pixel; line-height: 1; size: max-content; overflow: visible; } `;
        }
        let elStyle = document.$("style#icon-font");
        if (elStyle) elStyle.remove();
        document.head.append(<style id="icon-font" state-html={sText} />);
    }
}

/**
 * 判断指定字符串是否为字体图标资源标识
 * @param {string} uri
 * @returns {bool}
 */
export function isUri(uri) {
    if (typeof uri !== "string") return false;
    return (uri.charAt(0) === "#");
}

/**
 * 解析字体图标资源标识
 * @param {string} uri
 * @returns {Array[2]} [hex code,css class]
 */
export function crackUri(uri) {
    if (!isUri(uri)) return false;
    let fontName;
    let i = uri.indexOf("@");
    if (i >= 0)
        fontName = uri.slice(i + 1);
    else
        i = uri.length;
    let charCode = uri.slice(1, i);
    return [`&#x${charCode};`, `icon-font-${fontName || "default"}`];
}