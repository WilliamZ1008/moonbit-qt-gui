#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
测试脚本 - 验证 PySide6 导入和基本功能
"""

def test_imports():
    """测试必要的导入"""
    try:
        from PySide6.QtWidgets import QApplication, QMainWindow, QWidget
        from PySide6.QtCore import Qt
        from PySide6.QtGui import QFont
        print("✅ PySide6 导入成功")
        return True
    except ImportError as e:
        print(f"❌ PySide6 导入失败: {e}")
        print("请运行: pip install pyside6")
        return False

def test_fonts():
    """测试字体支持"""
    try:
        from PySide6.QtWidgets import QApplication
        from PySide6.QtGui import QFont
        
        app = QApplication([])
        
        # 测试中文字体
        chinese_fonts = ["Microsoft YaHei", "SimHei", "PingFang SC", "Noto Sans CJK SC"]
        available_fonts = []
        
        for font_name in chinese_fonts:
            font = QFont(font_name)
            if font.exactMatch():
                available_fonts.append(font_name)
        
        if available_fonts:
            print(f"✅ 找到中文字体: {available_fonts[0]}")
        else:
            print("⚠️  未找到中文字体，界面可能显示异常")
        
        # 测试等宽字体
        mono_fonts = ["Consolas", "Monaco", "Courier New", "DejaVu Sans Mono"]
        for font_name in mono_fonts:
            font = QFont(font_name)
            if font.exactMatch():
                print(f"✅ 找到等宽字体: {font_name}")
                break
        else:
            print("⚠️  未找到等宽字体")
        
        app.quit()
        return True
    except Exception as e:
        print(f"❌ 字体测试失败: {e}")
        return False

if __name__ == "__main__":
    print("🧪 开始测试...")
    
    if test_imports():
        test_fonts()
        print("\n🎉 测试完成！如果所有测试都通过，可以运行 main.py")
    else:
        print("\n❌ 测试失败，请先安装依赖") 