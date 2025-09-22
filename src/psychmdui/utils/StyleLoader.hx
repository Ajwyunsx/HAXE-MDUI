package psychmdui.utils;

import js.Browser;
import js.html.*;

/**
 * 样式加载器
 */
class StyleLoader {
    /**
     * 加载所有CSS样式
     */
    public static function loadStyles():Void {
        var style = cast(Browser.document.createStyleElement(), StyleElement);
        style.innerHTML = getStyles();
        Browser.document.head.appendChild(style);
    }
    
    /**
     * 获取所有CSS样式内容
     */
    private static function getStyles():String {
        return '
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
            
            .psych-container-fluid {
                width: 100%;
                padding: 20px;
            }
            
            .psych-row {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -10px;
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
            
            .psych-card-title {
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
            
            /* 输入框样式 */
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
            
            /* 复选框和单选框 */
            .psych-checkbox,
            .psych-radio-item {
                display: flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 12px;
            }
            
            .psych-checkbox input,
            .psych-radio-item input {
                width: 18px;
                height: 18px;
                cursor: pointer;
            }
            
            .psych-group-label {
                font-weight: 600;
                margin-bottom: 12px;
                color: #333;
            }
            
            .psych-radio-group {
                margin-bottom: 24px;
            }
            
            /* 对话框样式 */
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
            
            /* 通知样式 */
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
            
            /* 工具类 */
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
    }
}
