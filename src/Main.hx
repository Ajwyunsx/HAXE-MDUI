package;

import psychmdui.PsychMdui;
import js.Browser;
import js.html.*;

class Main {
    static function main() {
        // 初始化PsychMDUI
        PsychMdui.init();
        
        // 创建示例应用
        createExampleApp();
    }
    
    static function createExampleApp():Void {
        // 创建主容器
        var container = PsychMdui.createLayout("container");
        
        // 创建顶部应用栏
        var appBar = PsychMdui.createElement('div', 'psych-app-bar');
        appBar.innerHTML = '
            <h1 class="psych-title">PsychMDUI - 简洁现代的Web组件库</h1>
            <button class="psych-btn psych-btn-primary" onclick="location.reload()">刷新</button>
        ';
        Browser.document.body.appendChild(appBar);
        
        // 创建欢迎卡片
        var welcomeCard = PsychMdui.createCard(
            "欢迎使用PsychMDUI", 
            "这是一个基于Haxe开发的简洁现代Web组件库。采用扁平化设计风格，提供直观易用的API接口。",
            ["开始使用", "查看文档", "运行示例"]
        );
        
        // 创建功能演示卡片
        var demoCard = PsychMdui.createCard(
            "功能演示", 
            "点击下面的按钮体验不同的功能：",
            []
        );
        
        // 创建演示按钮
        var buttonContainer = PsychMdui.createElement('div', 'flex gap-8');
        
        var btn1 = PsychMdui.createButton("显示通知", function() {
            PsychMdui.showNotification("这是一个成功通知！");
        }, "primary");
        
        var btn2 = PsychMdui.createButton("弹出对话框", function() {
            PsychMdui.createDialog(
                "对话框示例", 
                "这是一个使用PsychMDUI创建的对话框。你可以自定义标题、内容和按钮。",
                ["查看详情", "关闭"]
            );
        }, "secondary");
        
        var btn3 = PsychMdui.createButton("提交", function() {
            PsychMdui.showNotification("表单提交成功！");
        }, "outline");
        
        // 创建输入演示卡片
        var inputCard = PsychMdui.createCard(
            "输入框演示", 
            "这是使用PsychMDUI创建的文本框：",
            []
        );
        
        var textField = PsychMdui.createInput("用户名", "请输入用户名");
        
        // 组装所有元素
        PsychMdui.addElement(buttonContainer, btn1);
        PsychMdui.addElement(buttonContainer, btn2);
        PsychMdui.addElement(buttonContainer, btn3);
        
        PsychMdui.addElement(demoCard, buttonContainer);
        PsychMdui.addElement(inputCard, textField);
        
        PsychMdui.addElement(container, welcomeCard);
        PsychMdui.addElement(container, demoCard);
        PsychMdui.addElement(container, inputCard);
        
        Browser.document.body.appendChild(container);
        
        // 显示欢迎消息
        Browser.window.setTimeout(function() {
            PsychMdui.showNotification("PsychMDUI加载完成！");
        }, 1000);
    }
}
