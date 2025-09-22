package psychmdui.utils;

import js.Browser;
import js.html.*;

/**
 * DOM操作工具类
 */
class DomUtils {
    /**
     * 创建通用元素
     * @param tagName 标签名
     * @param className CSS类名
     */
    public static function createElement(tagName:String, ?className:String):Element {
        var element = Browser.document.createElement(tagName);
        if (className != null) {
            element.className = className;
        }
        return element;
    }
    
    /**
     * 设置元素属性
     * @param element 目标元素
     * @param attrs 属性对象
     */
    public static function setAttributes(element:Element, attrs:Dynamic):Void {
        for (key in Reflect.fields(attrs)) {
            var value = Reflect.field(attrs, key);
            element.setAttribute(key, Std.string(value));
        }
    }
    
    /**
     * 添加元素到容器
     * @param parent 父容器
     * @param child 子元素
     */
    public static function addElement(parent:Element, child:Element):Void {
        parent.appendChild(child);
    }
    
    /**
     * 移除元素
     * @param element 要移除的元素
     */
    public static function removeElement(element:Element):Void {
        if (element.parentNode != null) {
            element.parentNode.removeChild(element);
        }
    }
    
    /**
     * 查找元素
     * @param selector CSS选择器
     */
    public static function querySelector(selector:String):Element {
        return Browser.document.querySelector(selector);
    }
    
    /**
     * 查找所有匹配的元素
     * @param selector CSS选择器
     */
    public static function querySelectorAll(selector:String):Dynamic {
        return Browser.document.querySelectorAll(selector);
    }
    
    /**
     * 添加类名
     * @param element 目标元素
     * @param className 类名
     */
    public static function addClass(element:Element, className:String):Void {
        element.classList.add(className);
    }
    
    /**
     * 移除类名
     * @param element 目标元素
     * @param className 类名
     */
    public static function removeClass(element:Element, className:String):Void {
        element.classList.remove(className);
    }
    
    /**
     * 切换类名
     * @param element 目标元素
     * @param className 类名
     */
    public static function toggleClass(element:Element, className:String):Void {
        element.classList.toggle(className);
    }
    
    /**
     * 检查是否包含类名
     * @param element 目标元素
     * @param className 类名
     */
    public static function hasClass(element:Element, className:String):Bool {
        return element.classList.contains(className);
    }
    
    /**
     * 设置样式
     * @param element 目标元素
     * @param styles 样式对象
     */
    public static function setStyle(element:Element, styles:Dynamic):Void {
        var styleString = '';
        for (key in Reflect.fields(styles)) {
            var value = Reflect.field(styles, key);
            styleString += key + ':' + value + ';';
        }
        element.setAttribute('style', styleString);
    }
    
    /**
     * 获取元素数据属性
     * @param element 目标元素
     * @param key 数据键名
     */
    public static function getData(element:Element, key:String):String {
        return element.getAttribute('data-' + key);
    }
    
    /**
     * 设置元素数据属性
     * @param element 目标元素
     * @param key 数据键名
     * @param value 数据值
     */
    public static function setData(element:Element, key:String, value:String):Void {
        element.setAttribute('data-' + key, value);
    }
}
