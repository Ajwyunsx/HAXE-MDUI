package psychmdui.core;

import psychmdui.components.*;
import psychmdui.utils.*;
import js.Browser;
import js.html.*;

/**
 * PsychMDUI 核心类
 * 主要的库入口点和初始化管理
 */
class PsychMdui {
    private static var initialized:Bool = false;
    
    /**
     * 初始化PsychMDUI库
     */
    public static function init():Void {
        if (initialized) return;
        
        StyleLoader.loadStyles();
        EventManager.init();
        initialized = true;
        
        Debug.log("PsychMDUI初始化完成");
    }
    
    /**
     * 创建通用元素
     * @param tagName 标签名
     * @param className CSS类名
     */
    public static function createElement(tagName:String, ?className:String):Element {
        return DomUtils.createElement(tagName, className);
    }
    
    /**
     * 设置元素属性
     * @param element 目标元素
     * @param attrs 属性对象
     */
    public static function setAttributes(element:Element, attrs:Dynamic):Void {
        DomUtils.setAttributes(element, attrs);
    }
    
    /**
     * 添加元素到容器
     * @param parent 父容器
     * @param child 子元素
     */
    public static function addElement(parent:Element, child:Element):Void {
        DomUtils.addElement(parent, child);
    }
    
    /**
     * 调试输出
     * @param message 输出内容
     */
    public static function debugPrint(message:String):Void {
        Debug.log(message);
    }
}
