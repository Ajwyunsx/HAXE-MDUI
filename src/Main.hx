package;

import psychmdui.core.PsychMdui;
import psychmdui.components.*;
import psychmdui.utils.*;
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
        var container = Layout.createContainer("container");
        
        // 创建顶部应用栏
        var refreshButton = Button.createButton("刷新 test", function() {
            Browser.window.location.reload();
        }, "primary");
        var appBar = Layout.createAppBar("PsychMDUI - 简洁现代的Web组件库", [refreshButton]);
        Browser.document.body.appendChild(appBar);
        
        // 创建欢迎卡片
        var welcomeCard = Layout.createCard(
            "欢迎使用PsychMDUI test", 
            "这是一个基于Haxe开发的简洁现代Web组件库。采用扁平化设计风格，提供直观易用的API接口。",
            ["开始使用", "查看文档", "运行示例"]
        );
        
        // 创建功能演示卡片
        var demoCard = Layout.createCard(
            "功能演示", 
            "点击下面的按钮体验不同的功能：",
            []
        );
        
        // 创建演示按钮
        var buttonContainer = PsychMdui.createElement('div', 'flex gap-8');
        
        var btn1 = Button.createButton("显示通知", function() {
            Feedback.showSuccess("这是一个成功hhhh通知！");
        }, "primary");
        
        var btn2 = Button.createButton("弹出对话框", function() {
            Feedback.createDialog(
                "对话框示例", 
                "这是一个使用PsychMDUI创建的对话框。你可以自定义标题、内容和按钮。",
                ["查看详情", "关闭"]
            );
        }, "secondary");
        
        var btn3 = Button.createButton("提交", function() {
            Feedback.showSuccess("表单提交成功！");
        }, "outline");
        
        // 创建输入演示卡片
        var inputCard = Layout.createCard(
            "输入框演示", 
            "这是使用PsychMDUI创建的文本框：",
            []
        );
        
        var textField = Form.createInput("用户名", "请输入用户名");
        
        // 创建表单演示卡片
        var formCard = Layout.createCard(
            "表单组件演示", 
            "各种表单组件的使用示例：",
            []
        );
        
        var emailInput = Form.createInput("邮箱", "请输入邮箱地址", "email");
        var textarea = Form.createTextarea("留言", "请输入您的留言...", 4);
        var select = Form.createSelect("选择您喜欢的技术", [
            {value: "haxe", text: "Haxe"},
            {value: "js", text: "JavaScript"},
            {value: "ts", text: "TypeScript"},
            {value: "other", text: "其他"}
        ], "haxe");
        
        var checkbox = Form.createCheckbox("我同意服务条款", false);
        var radioGroup = Form.createRadioGroup("选择您的身份", [
            {value: "developer", text: "开发者"},
            {value: "designer", text: "设计师"},
            {value: "other", text: "其他"}
        ], "developer");
        
        // 组装所有元素
        PsychMdui.addElement(buttonContainer, btn1);
        PsychMdui.addElement(buttonContainer, btn2);
        PsychMdui.addElement(buttonContainer, btn3);
        
        PsychMdui.addElement(demoCard, buttonContainer);
        PsychMdui.addElement(inputCard, textField);
        
        PsychMdui.addElement(formCard, emailInput);
        PsychMdui.addElement(formCard, textarea);
        PsychMdui.addElement(formCard, select);
        PsychMdui.addElement(formCard, checkbox);
        PsychMdui.addElement(formCard, radioGroup);
        
        PsychMdui.addElement(container, welcomeCard);
        PsychMdui.addElement(container, demoCard);
        PsychMdui.addElement(container, inputCard);
        PsychMdui.addElement(container, formCard);
        
        Browser.document.body.appendChild(container);
        
        // 显示欢迎消息
        Browser.window.setTimeout(function() {
            Feedback.showSuccess("PsychMDUI加载完成！");
        }, 1000);
        
        // 添加卡片按钮点击事件
        addCardButtonEvents();
    }
    
    static function addCardButtonEvents():Void {
        // 欢迎卡片按钮事件
        var welcomeButtons = Browser.document.querySelectorAll('.psych-card:first-child .psych-btn');
        for (i in 0...welcomeButtons.length) {
            var button = welcomeButtons[i];
            button.addEventListener('click', function(e) {
                var buttonText = cast(e.target, Element).textContent;
                switch(buttonText) {
                    case "开始使用":
                        Feedback.showSuccess("开始使用PsychMDUI！");
                    case "查看文档":
                        Feedback.showInfo("文档正在编写中...");
                    case "运行示例":
                        Feedback.showSuccess("您正在查看示例！");
                    default:
                        Feedback.showInfo("点击了: " + buttonText);
                }
            });
        }
    }
}



