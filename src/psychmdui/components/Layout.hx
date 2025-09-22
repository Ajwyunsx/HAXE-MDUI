package psychmdui.components;

import psychmdui.core.PsychMdui;
import js.Browser;
import js.html.*;

/**
 * 布局相关组件
 */
class Layout {
    /**
     * 创建布局容器
     * @param type 布局类型 (container, fluid, row)
     */
    public static function createContainer(type:String = 'container'):DivElement {
        var className = 'psych-container';
        if (type == 'fluid') className = 'psych-container-fluid';
        if (type == 'row') className = 'psych-row';
        
        return cast(PsychMdui.createElement('div', className), DivElement);
    }
    
    /**
     * 创建应用栏
     * @param title 标题
     * @param actions 操作按钮
     */
    public static function createAppBar(?title:String, ?actions:Array<Element>):DivElement {
        var appBar = cast(PsychMdui.createElement('div', 'psych-app-bar'), DivElement);
        
        var titleElement = PsychMdui.createElement('h1', 'psych-title');
        titleElement.textContent = title != null ? title : 'PsychMDUI';
        appBar.appendChild(titleElement);
        
        if (actions != null) {
            for (action in actions) {
                appBar.appendChild(action);
            }
        }
        
        return appBar;
    }
    
    /**
     * 创建卡片
     * @param title 卡片标题
     * @param content 卡片内容
     * @param actions 操作按钮数组
     */
    public static function createCard(title:String, content:String, ?actions:Array<String>):DivElement {
        var card = cast(PsychMdui.createElement('div', 'psych-card'), DivElement);
        
        var header = PsychMdui.createElement('div', 'psych-card-header');
        var titleElement = PsychMdui.createElement('div', 'psych-card-title');
        titleElement.textContent = title;
        header.appendChild(titleElement);
        card.appendChild(header);
        
        var contentElement = PsychMdui.createElement('div', 'psych-card-content');
        contentElement.textContent = content;
        card.appendChild(contentElement);
        
        if (actions != null) {
            var actionsContainer = PsychMdui.createElement('div', 'psych-card-actions');
            for (action in actions) {
                var button = Button.createButton(action);
                actionsContainer.appendChild(button);
            }
            card.appendChild(actionsContainer);
        }
        
        return card;
    }
}
