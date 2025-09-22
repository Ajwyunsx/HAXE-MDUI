package psychmdui.components;

import psychmdui.core.PsychMdui;
import js.Browser;
import js.html.*;

/**
 * 用户反馈组件 (对话框、通知等)
 */
class Feedback {
    /**
     * 创建对话框
     * @param title 对话框标题
     * @param content 对话框内容
     * @param buttons 按钮数组
     */
    public static function createDialog(title:String, content:String, ?buttons:Array<String>):Void {
        var dialog = PsychMdui.createElement('div', 'psych-dialog');
        
        var titleElement = PsychMdui.createElement('div', 'psych-dialog-title');
        titleElement.textContent = title;
        dialog.appendChild(titleElement);
        
        var contentElement = PsychMdui.createElement('div', 'psych-dialog-content');
        contentElement.textContent = content;
        dialog.appendChild(contentElement);
        
        var actionsElement = PsychMdui.createElement('div', 'psych-dialog-actions');
        
        if (buttons != null) {
            for (buttonText in buttons) {
                var button = Button.createButton(buttonText, function() {
                    closeDialog(dialog);
                });
                actionsElement.appendChild(button);
            }
        } else {
            var closeButton = Button.createButton("完成", function() {
                closeDialog(dialog);
            }, "primary");
            actionsElement.appendChild(closeButton);
        }
        
        dialog.appendChild(actionsElement);
        Browser.document.body.appendChild(dialog);
    }
    
    /**
     * 显示通知消息
     * @param message 通知内容
     * @param duration 显示时长 (毫秒)
     */
    public static function showNotification(message:String, duration:Int = 3000):Void {
        var notification = PsychMdui.createElement('div', 'psych-notification');
        
        var textElement = PsychMdui.createElement('div', 'psych-notification-text');
        textElement.textContent = message;
        notification.appendChild(textElement);
        
        Browser.document.body.appendChild(notification);
        
        Browser.window.setTimeout(function() {
            if (notification.parentNode != null) {
                notification.parentNode.removeChild(notification);
            }
        }, duration);
    }
    
    /**
     * 显示成功通知
     * @param message 成功消息
     */
    public static function showSuccess(message:String):Void {
        showNotification(message, 3000);
    }
    
    /**
     * 显示错误通知
     * @param message 错误消息
     */
    public static function showError(message:String):Void {
        showNotification(message, 5000);
    }
    
    /**
     * 显示警告通知
     * @param message 警告消息
     */
    public static function showWarning(message:String):Void {
        showNotification(message, 4000);
    }
    
    /**
     * 显示信息通知
     * @param message 信息消息
     */
    public static function showInfo(message:String):Void {
        showNotification(message, 3500);
    }
    
    /**
     * 显示确认对话框
     * @param title 标题
     * @param content 内容
     * @param onConfirm 确认回调
     * @param onCancel 取消回调
     */
    public static function showConfirm(title:String, content:String, onConfirm:Void->Void, ?onCancel:Void->Void):Void {
        var dialog = PsychMdui.createElement('div', 'psych-dialog');
        
        var titleElement = PsychMdui.createElement('div', 'psych-dialog-title');
        titleElement.textContent = title;
        dialog.appendChild(titleElement);
        
        var contentElement = PsychMdui.createElement('div', 'psych-dialog-content');
        contentElement.textContent = content;
        dialog.appendChild(contentElement);
        
        var actionsElement = PsychMdui.createElement('div', 'psych-dialog-actions');
        
        var cancelButton = Button.createButton("取消", function() {
            closeDialog(dialog);
            if (onCancel != null) onCancel();
        });
        
        var confirmButton = Button.createButton("确认", function() {
            closeDialog(dialog);
            onConfirm();
        }, "primary");
        
        actionsElement.appendChild(cancelButton);
        actionsElement.appendChild(confirmButton);
        dialog.appendChild(actionsElement);
        
        Browser.document.body.appendChild(dialog);
    }
    
    /**
     * 关闭对话框
     * @param dialog 对话框元素
     */
    private static function closeDialog(dialog:Element):Void {
        if (dialog.parentNode != null) {
            // 添加关闭动画
            dialog.style.transition = 'all 0.2s ease';
            dialog.style.opacity = '0';
            dialog.style.transform = 'translate(-50%, -50%) scale(0.8)';
            
            Browser.window.setTimeout(function() {
                if (dialog.parentNode != null) {
                    dialog.parentNode.removeChild(dialog);
                }
            }, 200);
        }
    }
    
    /**
     * 关闭所有对话框
     */
    public static function closeAllDialogs():Void {
        var dialogs = Browser.document.querySelectorAll('.psych-dialog');
        for (i in 0...dialogs.length) {
            var dialog = cast(dialogs[i], Element);
            if (dialog.parentNode != null) {
                closeDialog(dialog);
            }
        }
    }
}
