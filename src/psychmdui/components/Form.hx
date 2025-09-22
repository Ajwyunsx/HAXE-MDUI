package psychmdui.components;

import psychmdui.core.PsychMdui;
import js.Browser;
import js.html.*;

/**
 * 表单相关组件
 */
class Form {
    /**
     * 创建文本输入框
     * @param label 输入框标签
     * @param placeholder 占位符
     * @param type 输入类型 (text, password, email, etc.)
     * @param value 默认值
     */
    public static function createInput(label:String, placeholder:String = '', type:String = 'text', ?value:String):DivElement {
        var container = cast(PsychMdui.createElement('div', 'psych-input'), DivElement);
        
        var labelElement = PsychMdui.createElement('label', 'psych-input-label');
        labelElement.textContent = label;
        
        var inputElement = PsychMdui.createElement('input', 'psych-input-field');
        var input = cast(inputElement, InputElement);
        input.type = type;
        input.placeholder = placeholder;
        
        if (value != null) {
            input.value = value;
        }
        
        container.appendChild(labelElement);
        container.appendChild(inputElement);
        
        return container;
    }
    
    /**
     * 创建文本域
     * @param label 标签
     * @param placeholder 占位符
     * @param rows 行数
     */
    public static function createTextarea(label:String, placeholder:String = '', rows:Int = 3):DivElement {
        var container = cast(PsychMdui.createElement('div', 'psych-input'), DivElement);
        
        var labelElement = PsychMdui.createElement('label', 'psych-input-label');
        labelElement.textContent = label;
        
        var textareaElement = PsychMdui.createElement('textarea', 'psych-input-field');
        var textarea = cast(textareaElement, TextAreaElement);
        textarea.placeholder = placeholder;
        textarea.rows = rows;
        
        container.appendChild(labelElement);
        container.appendChild(textareaElement);
        
        return container;
    }
    
    /**
     * 创建选择框
     * @param label 标签
     * @param options 选项数组
     * @param selectedValue 默认选中值
     */
    public static function createSelect(label:String, options:Array<{value:String, text:String}>, ?selectedValue:String):DivElement {
        var container = cast(PsychMdui.createElement('div', 'psych-input'), DivElement);
        
        var labelElement = PsychMdui.createElement('label', 'psych-input-label');
        labelElement.textContent = label;
        
        var selectElement = PsychMdui.createElement('select', 'psych-input-field');
        var select = cast(selectElement, SelectElement);
        
        for (option in options) {
            var optionElement = PsychMdui.createElement('option');
            optionElement.value = option.value;
            optionElement.textContent = option.text;
            
            if (selectedValue != null && option.value == selectedValue) {
                optionElement.setAttribute('selected', 'selected');
            }
            
            select.appendChild(optionElement);
        }
        
        container.appendChild(labelElement);
        container.appendChild(selectElement);
        
        return container;
    }
    
    /**
     * 创建复选框
     * @param label 标签
     * @param checked 是否选中
     */
    public static function createCheckbox(label:String, checked:Bool = false):DivElement {
        var container = cast(PsychMdui.createElement('div', 'psych-checkbox'), DivElement);
        
        var inputElement = PsychMdui.createElement('input');
        var input = cast(inputElement, InputElement);
        input.type = 'checkbox';
        input.checked = checked;
        
        var labelElement = PsychMdui.createElement('label');
        labelElement.textContent = label;
        
        container.appendChild(inputElement);
        container.appendChild(labelElement);
        
        return container;
    }
    
    /**
     * 创建单选框组
     * @param label 标签
     * @param options 选项数组
     * @param selectedValue 默认选中值
     */
    public static function createRadioGroup(label:String, options:Array<{value:String, text:String}>, ?selectedValue:String):DivElement {
        var container = cast(PsychMdui.createElement('div', 'psych-radio-group'), DivElement);
        
        var labelElement = PsychMdui.createElement('div', 'psych-group-label');
        labelElement.textContent = label;
        container.appendChild(labelElement);
        
        for (option in options) {
            var radioContainer = PsychMdui.createElement('div', 'psych-radio-item');
            
            var inputElement = PsychMdui.createElement('input');
            var input = cast(inputElement, InputElement);
            input.type = 'radio';
            input.name = label; // 相同name确保单选
            input.value = option.value;
            
            if (selectedValue != null && option.value == selectedValue) {
                input.checked = true;
            }
            
            var optionLabel = PsychMdui.createElement('label');
            optionLabel.textContent = option.text;
            
            radioContainer.appendChild(inputElement);
            radioContainer.appendChild(optionLabel);
            container.appendChild(radioContainer);
        }
        
        return container;
    }
}
