package psychmdui.components;

import psychmdui.core.PsychMdui;
import js.Browser;
import js.html.*;

/**
 * 按钮组件
 */
class Button {
    /**
     * 创建按钮
     * @param text 按钮文字
     * @param onClick 点击回调
     * @param style 按钮样式 (default, primary, secondary, outline)
     * @param color 按钮颜色 (red, green, blue)
     */
    public static function createButton(text:String, ?onClick:Void->Void, style:String = 'default', ?color:String):ButtonElement {
        var button = cast(PsychMdui.createElement('button', 'psych-btn'), ButtonElement);
        
        // 设置样式
        switch (style) {
            case 'primary': button.className += ' psych-btn-primary';
            case 'secondary': button.className += ' psych-btn-secondary';
            case 'outline': button.className += ' psych-btn-outline';
            default: // default style
        }
        
        // 设置颜色
        if (color != null) {
            switch (color) {
                case 'red': button.className += ' psych-btn-red';
                case 'green': button.className += ' psych-btn-green';
                case 'blue': button.className += ' psych-btn-blue';
                default:
            }
        }
        
        button.textContent = text;
        
        // 添加点击事件
        if (onClick != null) {
            button.onclick = function(e) {
                onClick();
            };
        }
        
        return button;
    }
    
    /**
     * 创建图标按钮
     * @param iconClass 图标类名
     * @param onClick 点击回调
     * @param style 按钮样式
     */
    public static function createIconButton(iconClass:String, ?onClick:Void->Void, style:String = 'default'):ButtonElement {
        var button = createButton("", onClick, style);
        button.innerHTML = '<i class="' + iconClass + '"></i>';
        return button;
    }
}
