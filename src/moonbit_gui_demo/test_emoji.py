#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Emoji 测试脚本 - 解决 emoji 显示问题
"""

import sys
import os

def test_emoji_fonts():
    """测试 emoji 字体"""
    try:
        from PySide6.QtWidgets import QApplication, QLabel, QVBoxLayout, QWidget, QHBoxLayout
        from PySide6.QtGui import QFont
        
        app = QApplication([])
        
        # 创建测试窗口
        window = QWidget()
        window.setWindowTitle("Emoji 显示测试")
        window.setGeometry(100, 100, 600, 400)
        
        layout = QVBoxLayout()
        
        # 测试不同的 emoji 字体
        emoji_fonts = [
            ("Segoe UI Emoji", "🌙🚀🛡️📝🌍"),
            ("Noto Color Emoji", "🌙🚀🛡️📝🌍"),
            ("Apple Color Emoji", "🌙🚀🛡️📝🌍"),
            ("Twemoji Mozilla", "🌙🚀🛡️📝🌍"),
            ("EmojiOne Color", "🌙🚀🛡️📝🌍"),
            ("JoyPixels", "🌙🚀🛡️📝🌍"),
        ]
        
        # 测试常用 emoji
        test_emojis = [
            "🌙 MoonBit",
            "🚀 高性能",
            "🛡️ 内存安全", 
            "📝 简洁语法",
            "🌍 跨平台",
            "📥 下载",
            "📚 文档",
            "💻 代码示例",
            "🎯 立即开始",
            "✨ 现代化设计"
        ]
        
        # 显示字体测试
        for font_name, emoji_text in emoji_fonts:
            label = QLabel(f"{font_name}: {emoji_text}")
            font = QFont(font_name, 14)
            label.setFont(font)
            layout.addWidget(label)
        
        # 分隔线
        separator = QLabel("=" * 50)
        layout.addWidget(separator)
        
        # 显示实际使用的 emoji
        try:
            from font_utils import get_emoji_font
            emoji_font = get_emoji_font(16)
            
            for emoji_text in test_emojis:
                label = QLabel(emoji_text)
                label.setFont(emoji_font)
                layout.addWidget(label)
                
        except ImportError:
            # 如果字体工具不可用，使用默认字体
            for emoji_text in test_emojis:
                label = QLabel(emoji_text)
                font = QFont()
                font.setPointSize(16)
                label.setFont(font)
                layout.addWidget(label)
        
        window.setLayout(layout)
        window.show()
        
        print("🔍 请查看测试窗口中的 emoji 显示效果")
        print("如果看到方框，说明需要安装 emoji 字体")
        print("按 Ctrl+C 退出测试")
        
        app.exec()
        return True
        
    except Exception as e:
        print(f"❌ Emoji 测试失败: {e}")
        return False

def install_emoji_fonts():
    """安装 emoji 字体的建议"""
    print("📦 安装 emoji 字体的建议：")
    print()
    print("Ubuntu/Debian:")
    print("sudo apt install fonts-noto-color-emoji")
    print()
    print("CentOS/RHEL:")
    print("sudo yum install google-noto-emoji-fonts")
    print()
    print("WSL (从 Windows 复制):")
    print("sudo cp /mnt/c/Windows/Fonts/seguiemj.ttf /usr/share/fonts/")
    print("sudo fc-cache -fv")
    print()
    print("手动下载 Noto Color Emoji:")
    print("wget https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf")
    print("sudo cp NotoColorEmoji.ttf /usr/share/fonts/")
    print("sudo fc-cache -fv")

def main():
    """主函数"""
    print("🧪 开始 Emoji 测试...")
    
    try:
        from PySide6.QtWidgets import QApplication
        print("✅ PySide6 可用")
    except ImportError:
        print("❌ 请先安装 PySide6: pip install pyside6")
        return
    
    if test_emoji_fonts():
        print("✅ Emoji 测试完成")
    else:
        print("❌ Emoji 测试失败")
        install_emoji_fonts()

if __name__ == "__main__":
    main() 