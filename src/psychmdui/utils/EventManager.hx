package psychmdui.utils;

import js.Browser;
import js.html.*;

/**
 * 事件管理器
 */
class EventManager {
    /**
     * 初始化事件管理器
     */
    public static function init():Void {
        // 初始化事件管理器
        Debug.log("EventManager initialized");
    }
    
    /**
     * 关闭所有对话框
     */
    private static function closeAllDialogs():Void {
        var dialogs = Browser.document.querySelectorAll('.psych-dialog');
        for (i in 0...dialogs.length) {
            var dialog = cast(dialogs[i], Element);
            if (dialog.parentNode != null) {
                // 添加关闭动画
                var htmlElement = cast(dialog, js.html.Element);
                htmlElement.setAttribute('style', 'transition: all 0.2s ease; opacity: 0; transform: translate(-50%, -50%) scale(0.8);');
                
                Browser.window.setTimeout(function() {
                    if (dialog.parentNode != null) {
                        dialog.parentNode.removeChild(dialog);
                    }
                }, 200);
            }
        }
    }
    
    /**
     * 添加事件监听器
     * @param element 目标元素
     * @param eventType 事件类型
     * @param handler 事件处理器
     */
    public static function addEventListener(element:Element, eventType:String, handler:Dynamic):Void {
        element.addEventListener(eventType, handler);
    }
    
    /**
     * 移除事件监听器
     * @param element 目标元素
     * @param eventType 事件类型
     * @param handler 事件处理器
     */
    public static function removeEventListener(element:Element, eventType:String, handler:Dynamic):Void {
        element.removeEventListener(eventType, handler);
    }
    
    /**
     * 触发自定义事件
     * @param element 目标元素
     * @param eventName 事件名称
     * @param data 事件数据
     */
    public static function dispatchEvent(element:Element, eventName:String, ?data:Dynamic):Void {
        var event = new js.html.CustomEvent(eventName, {
            detail: data,
            bubbles: true,
            cancelable: true
        });
        element.dispatchEvent(event);
    }
}
