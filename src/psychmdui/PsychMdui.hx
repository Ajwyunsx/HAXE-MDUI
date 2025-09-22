package psychmdui;

import js.Browser;
import js.html.*;

/**
 * Psych Engine风格的MDUI API库
 * 简洁现代的Web组件操作库
 */
class PsychMdui {
    private static var initialized:Bool = false;
    
    /**
     * 初始化MDUI环境
     */
    public static function init():Void {
        if (initialized) return;
        
        loadMduiDependencies();
        initialized = true;
        
        debugPrint("PsychMDUI初始化完成");
    }
    
    /**
     * 创建对话框
     * @param title 对话框标题
     * @param content 对话框内容
     * @param buttons 按钮数组
     */
    public static function createDialog(title:String, content:String, ?buttons:Array<String>):Void {
        var window = createElement('div', 'psych-dialog');
        var buttonsHtml = '';
        if (buttons != null) {
            for (btn in buttons) {
                buttonsHtml += '<button class="psych-btn">' + btn + '</button>';
            }
        } else {
            // 不使用"确定"和"取消"，使用更通用的按钮名称
            buttonsHtml = '<button class="psych-btn psych-btn-primary">完成</button>';
        }
        
        window.innerHTML = '<div class="psych-dialog-title">' + title + '</div><div class="psych-dialog-content">' + content + '</div><div class="psych-dialog-actions">' + buttonsHtml + '</div>';
        Browser.document.body.appendChild(window);
    }
    
    /**
     * 显示提示信息
     * @param message 提示内容
     */
    public static function showNotification(message:String):Void {
        var snackbar = createElement('div', 'psych-notification');
        snackbar.innerHTML = '<div class="psych-notification-text">' + message + '</div>';
        Browser.document.body.appendChild(snackbar);
        
        Browser.window.setTimeout(function() {
            if (snackbar.parentNode != null) {
                snackbar.parentNode.removeChild(snackbar);
            }
        }, 3000);
    }
    
    /**
     * 创建卡片
     * @param title 卡片标题
     * @param content 卡片内容
     * @param actions 操作按钮
     */
    public static function createCard(title:String, content:String, ?actions:Array<String>):DivElement {
        var card = cast(createElement('div', 'psych-card'), DivElement);
        var actionsHtml = '';
        if (actions != null) {
            actionsHtml = '<div class="psych-card-actions">';
            for (action in actions) {
                actionsHtml += '<button class="psych-btn">' + action + '</button>';
            }
            actionsHtml += '</div>';
        }
        
        card.innerHTML = '<div class="psych-card-header"><div class="psych-card-title">' + title + '</div></div><div class="psych-card-content">' + content + '</div>' + actionsHtml;
        return card;
    }
    
    /**
     * 创建按钮
     * @param text 按钮文字
     * @param onClick 点击回调
     * @param style 按钮样式
     * @param color 按钮颜色
     */
    public static function createButton(text:String, ?onClick:Void->Void, style:String = 'default', ?color:String):ButtonElement {
        var button = cast(createElement('button', 'psych-btn'), ButtonElement);
        
        if (style == 'primary') button.className += ' psych-btn-primary';
        if (style == 'secondary') button.className += ' psych-btn-secondary';
        if (style == 'outline') button.className += 'psych-btn-outline';
        
        if (color != null) {
            if (color == 'red') button.className += ' psych-btn-red';
            if (color == 'green') button.className += ' psych-btn-green';
            if (color == 'blue') button.className += ' psych-btn-blue';
        }
        
        button.innerHTML = text;
        
        if (onClick != null) {
            button.onclick = function(e) {
                onClick();
            };
        }
        
        return button;
    }
    
    /**
     * 创建文本输入框
     * @param label 输入框标签
     * @param placeholder 占位符
     * @param type 输入类型
     */
    public static function createInput(label:String, placeholder:String = '', type:String = 'text'):DivElement {
        var container = cast(createElement('div', 'psych-input'), DivElement);
        container.innerHTML = '<label class="psych-input-label">' + label + '</label><input class="psych-input-field" type="' + type + '" placeholder="' + placeholder + '" />';
        return container;
    }
    
    /**
     * 创建布局容器
     * @param type 布局类型
     */
    public static function createLayout(type:String = 'container'):DivElement {
        var className = 'psych-container';
        if (type == 'fluid') className = 'psych-container-fluid';
        if (type == 'row') className = 'psych-row';
        
        return cast(createElement('div', className), DivElement);
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
     * 调试输出
     * @param message 输出内容
     */
    public static function debugPrint(message:String):Void {
        trace('[PsychMDUI] ' + message);
        if (Browser.window.console != null) {
            Browser.window.console.log('[PsychMDUI]', message);
        }
    }
    
    /**
     * 加载MDUI依赖
     */
    private static function loadMduiDependencies():Void {
        // 添加新的主题样式
        var style = cast(Browser.document.createStyleElement(), StyleElement);
        style.innerHTML = '
            /* 基础重置 */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            
            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                background-color: #f8f9fa;
                color: #333;
                line-height: 1.6;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            
            /* 容器样式 */
            .psych-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            
            /* 顶部应用栏 */
            .psych-app-bar {
                background-color: #fff;
                color: #333;
                padding: 16px 24px;
                border-bottom: 1px solid #e0e0e0;
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: sticky;
                top: 0;
                z-index: 1000;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            
            /* 卡片样式 - 扁平设计 */
            .psych-card {
                background: #fff;
                border-radius: 0;
                border: 1px solid #e0e0e0;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                margin-bottom: 20px;
                transition: all 0.2s ease;
            }
            
            .psych-card:hover {
                box-shadow: 0 4px 6px rgba(0,0,0,0.15);
                transform: translateY(-1px);
            }
            
            .psych-card-header {
                padding: 20px 24px 16px;
                border-bottom: 1px solid #f0f0f0;
                background-color: #fafafa;
            }
            
            .psych-card-header-title {
                font-size: 20px;
                font-weight: 600;
                color: #1a73e8;
                margin: 0;
            }
            
            .psych-card-content {
                padding: 24px;
                font-size: 16px;
                line-height: 1.5;
                color: #5f6368;
            }
            
            .psych-card-actions {
                padding: 16px 24px;
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
                background-color: #fafafa;
            }
            
            /* 按钮样式 - 极简主义 */
            .psych-btn {
                padding: 10px 20px;
                border: 1px solid #d0d0d0;
                border-radius: 0;
                background: #fff;
                color: #5f6368;
                font-size: 14px;
                font-weight: 500;
                text-transform: uppercase;
                cursor: pointer;
                transition: all 0.15s ease;
                outline: none;
            }
            
            .psych-btn:hover {
                background-color: #f8f9fa;
                border-color: #5f6368;
                color: #1a73e8;
            }
            
            .psych-btn:active {
                transform: translateY(1px);
                box-shadow: none;
            }
            
            .psych-btn:focus {
                outline: 2px solid #1a73e8;
                outline-offset: 2px;
            }
            
            .psych-btn-primary {
                background-color: #1a73e8;
                color: #fff;
                border-color: #1a73e8;
            }
            
            .psych-btn-primary:hover {
                background-color: #1557b0;
                border-color: #1557b0;
            }
            
            .psych-btn-secondary {
                background-color: #5f6368;
                color: #fff;
                border-color: #5f6368;
            }
            
            .psych-btn-secondary:hover {
                background-color: #494c50;
            }
            
            .psych-btn-outline {
                background: transparent;
                color: #1a73e8;
                border-color: #1a73e8;
            }
            
            .psych-btn-outline:hover {
                background: rgba(26, 115, 232, 0.1);
            }
            
            .psych-btn-red {
                border-color: #ea4335;
                color: #ea4335;
            }
            
            .psych-btn-red:hover {
                background-color: rgba(234, 67, 53, 0.1);
            }
            
            .psych-btn-green {
                border-color: #34a853;
                color: #34a853;
            }
            
            .psych-btn-green:hover {
                background-color: rgba(52, 168, 83, 0.1);
            }
            
            .psych-btn-blue {
                border-color: #1a73e8;
                color: #1a73e8;
            }
            
            /* 输入框样式 - Material Design */
            .psych-input {
                position: relative;
                margin-bottom: 24px;
            }
            
            .psych-input-label {
                position: absolute;
                top: 12px;
                left: 16px;
                color: #5f6368;
                font-size: 14px;
                pointer-events: none;
                transition: all 0.2s ease;
                background: #fff;
                padding: 0 4px;
                z-index: 1;
            }
            
            .psych-input-field {
                display: block;
                width: 100%;
                height: 40px;
                padding: 12px 16px;
                border: 1px solid #d0d0d0;
                border-radius: 0;
                font-size: 16px;
                outline: none;
                transition: all 0.2s ease;
                background: #fff;
            }
            
            .psych-input-field:focus {
                border-color: #1a73e8;
                border-width: 2px;
            }
            
            .psych-input-field:focus + .psych-input-label,
            .psych-input-field:not(:placeholder-shown) + .psych-input-label {
                top: 2px;
                font-size: 12px;
                color: #1a73e8;
            }
            
            .psych-input-field::placeholder {
                color: #9e9e9e;
            }
            
            /* 对话框样式 - 简洁清晰 */
            .psych-dialog {
                background: #fff;
                border: 1px solid #e0e0e0;
                box-shadow: 0 8px 24px rgba(0,0,0,0.2);
                min-width: 320px;
                max-width: 600px;
                margin: 32px auto;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                z-index: 1000;
                animation: psychDialogSlideIn 0.3s ease;
            }
            
            @keyframes psychDialogSlideIn {
                from {
                    opacity: 0;
                    transform: translate(-50%, -50%) scale(0.9);
                }
                to {
                    opacity: 1;
                    transform: translate(-50%, -50%) scale(1);
                }
            }
            
            .psych-dialog-title {
                padding: 24px 24px 16px;
                font-size: 24px;
                font-weight: 400;
                color: #202124;
                margin: 0;
                border-bottom: 1px solid #f0f0f0;
            }
            
            .psych-dialog-content {
                padding: 20px 24px 24px;
                font-size: 16px;
                line-height: 1.5;
                color: #5f6368;
            }
            
            .psych-dialog-actions {
                padding: 16px 24px;
                display: flex;
                justify-content: flex-end;
                gap: 8px;
                background-color: #fafafa;
            }
            
            .psych-dialog-actions .psych-btn {
                margin-left: 8px;
            }
            
            /* 通知样式 - 底部弹出 */
            .psych-notification {
                background: #323232;
                color: #fff;
                padding: 16px 24px;
                position: fixed;
                left: 50%;
                bottom: 32px;
                transform: translateX(-50%);
                box-shadow: 0 4px 12px rgba(0,0,0,0.32);
                z-index: 9999;
                animation: psychNotificationSlideUp 0.3s ease forwards;
                font-weight: 500;
            }
            
            @keyframes psychNotificationSlideUp {
                from {
                    transform: translateX(-50%) translateY(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(-50%) translateY(0);
                    opacity: 1;
                }
            }
            
            /* 标题样式 */
            .psych-title {
                font-size: 24px;
                font-weight: 600;
                line-height: 1.3;
                color: #202124;
                margin: 0;
            }
            
            /* 工具栏 */
            .psych-toolbar {
                flex-grow: 1;
            }
            
            /* 响应式设计 */
            @media (max-width: 768px) {
                .psych-container {
                    padding: 16px;
                }
                
                .psych-card {
                    margin-bottom: 16px;
                }
                
                .psych-card-header,
                .psych-card-content,
                .psych-card-actions {
                    padding-left: 16px;
                    padding-right: 16px;
                }
                
                .psych-dialog {
                    margin: 16px;
                    min-width: auto;
                    max-width: calc(100vw - 32px);
                }
                
                .psych-app-bar {
                    padding: 12px 16px;
                }
                
                .psych-btn {
                    padding: 8px 16px;
                    font-size: 13px;
                }
            }
            
            /* 文本对齐 */
            .text-center {
                text-align: center;
            }
            
            .mb-16 {
                margin-bottom: 16px;
            }
            
            .flex {
                display: flex;
            }
            
            .flex-col {
                flex-direction: column;
            }
            
            .gap-8 {
                gap: 8px;
            }
            
            .gap-16 {
                gap: 16px;
            }
            
            .justify-center {
                justify-content: center;
            }
            
            .items-center {
                align-items: center;
            }
            
            /* 加载动画 */
            @keyframes psychFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            .psych-card {
                animation: psychFadeIn 0.5s ease forwards;
            }
        ';
        Browser.document.head.appendChild(style);
        
        
        // 添加点击外部关闭对话框功能
        Browser.document.addEventListener('click', function(e:MouseEvent) {
            var target = cast(e.target, Element);
            if (!target.closest('.psych-dialog')) {
                // 点击对话框外部时关闭所有对话框
                closeAllDialogs();
            }
        });
    }
    
    /**
     * 关闭所有对话框
     */
    private static function closeAllDialogs():Void {
        var dialogs = Browser.document.querySelectorAll('.psych-dialog');
        for (i in 0...dialogs.length) {
            var dialog = dialogs[i];
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
    }
}