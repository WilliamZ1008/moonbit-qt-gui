#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
字体测试脚本 - 解决中文显示问题
"""

import sys
import os

def test_pyside6_import():
    """测试 PySide6 导入"""
    try:
        from PySide6.QtWidgets import QApplication
        from PySide6.QtGui import QFont
        print("✅ PySide6 导入成功")
        return True
    except ImportError as e:
        print(f"❌ PySide6 导入失败: {e}")
        return False

def test_font_utils():
    """测试字体工具模块"""
    try:
        from font_utils import get_chinese_font, get_mono_font, test_fonts
        print("✅ 字体工具模块导入成功")
        test_fonts()
        return True
    except ImportError as e:
        print(f"❌ 字体工具模块导入失败: {e}")
        return False

def test_chinese_display():
    """测试中文显示"""
    try:
        from PySide6.QtWidgets import QApplication, QLabel, QVBoxLayout, QWidget
        from PySide6.QtGui import QFont
        
        app = QApplication([])
        
        # 创建测试窗口
        window = QWidget()
        window.setWindowTitle("中文显示测试")
        window.setGeometry(100, 100, 400, 300)
        
        layout = QVBoxLayout()
        
        # 测试不同字体
        test_texts = [
            ("默认字体", None),
            ("微软雅黑", "Microsoft YaHei"),
            ("黑体", "SimHei"),
            ("苹方", "PingFang SC"),
            ("思源黑体", "Noto Sans CJK SC"),
        ]
        
        for text, font_name in test_texts:
            label = QLabel(f"{text}: 你好世界 Hello World 123")
            if font_name:
                font = QFont(font_name, 12)
                label.setFont(font)
            else:
                font = QFont()
                font.setPointSize(12)
                label.setFont(font)
            layout.addWidget(label)
        
        window.setLayout(layout)
        window.show()
        
        print("🔍 请查看测试窗口中的中文显示效果")
        print("如果看到方框，说明字体不支持中文")
        print("按 Ctrl+C 退出测试")
        
        app.exec()
        return True
        
    except Exception as e:
        print(f"❌ 中文显示测试失败: {e}")
        return False

def main():
    """主测试函数"""
    print("🧪 开始字体测试...")
    
    if not test_pyside6_import():
        print("请先安装 PySide6: pip install pyside6")
        return
    
    if not test_font_utils():
        print("字体工具模块有问题，将使用默认字体")
    
    print("\n🎯 开始中文显示测试...")
    test_chinese_display()

if __name__ == "__main__":
    main() 