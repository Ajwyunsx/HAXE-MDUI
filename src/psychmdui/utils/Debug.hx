package psychmdui.utils;

import js.Browser;

/**
 * 调试工具类
 */
class Debug {
    /**
     * 调试输出
     * @param message 输出内容
     */
    public static function log(message:String):Void {
        trace('[PsychMDUI] ' + message);
        if (Browser.window.console != null) {
            Browser.window.console.log('[PsychMDUI]', message);
        }
    }
    
    /**
     * 警告输出
     * @param message 警告内容
     */
    public static function warn(message:String):Void {
        if (Browser.window.console != null) {
            Browser.window.console.warn('[PsychMDUI]', message);
        }
    }
    
    /**
     * 错误输出
     * @param message 错误内容
     */
    public static function error(message:String):Void {
        if (Browser.window.console != null) {
            Browser.window.console.error('[PsychMDUI]', message);
        }
    }
    
    /**
     * 信息输出
     * @param message 信息内容
     */
    public static function info(message:String):Void {
        if (Browser.window.console != null) {
            Browser.window.console.info('[PsychMDUI]', message);
        }
    }
}
