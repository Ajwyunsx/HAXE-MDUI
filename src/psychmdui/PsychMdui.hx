package psychmdui;

import psychmdui.core.PsychMdui;
import psychmdui.components.*;
import psychmdui.utils.*;
import js.Browser;
import js.html.*;

/**
 * PsychMDUI 兼容性入口类
 * 为了保持向后兼容性，保留原有的API接口
 */
class PsychMdui {
    /**
     * 初始化MDUI环境
     */
    public static function init():Void {
        PsychMdui.init();
    }
    
    /**
     * 创建对话框
     * @param title 对话框标题
     * @param content 对话框内容
     * @param buttons 按钮数组
     */
    public static function createDialog(title:String, content:String, ?buttons:Array<String>):Void {
        Feedback.createDialog(title, content, buttons);
    }
    
    /**
     * 显示提示信息
     * @param message 提示内容
     */
    public static function showNotification(message:String):Void {
        Feedback.showNotification(message);
    }
    
    /**
     * 创建卡片
     * @param title 卡片标题
     * @param content 卡片内容
     * @param actions 操作按钮
     */
    public static function createCard(title:String, content:String, ?actions:Array<String>):DivElement {
        return Layout.createCard(title, content, actions);
    }
    
    /**
     * 创建按钮
     * @param text 按钮文字
     * @param onClick 点击回调
     * @param style 按钮样式
     * @param color 按钮颜色
     */
    public static function createButton(text:String, ?onClick:Void->Void, style:String = 'default', ?color:String):ButtonElement {
        return Button.createButton(text, onClick, style, color);
    }
    
    /**
     * 创建文本输入框
     * @param label 输入框标签
     * @param placeholder 占位符
     * @param type 输入类型
     */
    public static function createInput(label:String, placeholder:String = '', type:String = 'text'):DivElement {
        return Form.createInput(label, placeholder, type);
    }
    
    /**
     * 创建布局容器
     * @param type 布局类型
     */
    public static function createLayout(type:String = 'container'):DivElement {
        return Layout.createContainer(type);
    }
    
    /**
     * 添加元素到容器
     * @param parent 父容器
     * @param child 子元素
     */
    public static function addElement(parent:Element, child:Element):Void {
        PsychMdui.addElement(parent, child);
    }
    
    /**
     * 设置元素属性
     * @param element 目标元素
     * @param attrs 属性对象
     */
    public static function setAttributes(element:Element, attrs:Dynamic):Void {
        PsychMdui.setAttributes(element, attrs);
    }
    
    /**
     * 创建通用元素
     * @param tagName 标签名
     * @param className CSS类名
     */
    public static function createElement(tagName:String, ?className:String):Element {
        return PsychMdui.createElement(tagName, className);
    }
    
    /**
     * 调试输出
     * @param message 输出内容
     */
    public static function debugPrint(message:String):Void {
        Debug.log(message);
    }
}
