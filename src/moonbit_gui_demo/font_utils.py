#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
字体工具模块 - 解决中文显示问题
"""

from PySide6.QtGui import QFont
from PySide6.QtWidgets import QApplication


def get_chinese_font(size=12, weight=QFont.Weight.Normal):
    """
    获取支持中文的字体
    
    Args:
        size: 字体大小
        weight: 字体粗细
    
    Returns:
        QFont: 配置好的字体对象
    """
    # 中文字体优先级列表（支持 emoji）
    chinese_fonts = [
        "Segoe UI Emoji",       # Windows emoji 字体
        "Noto Color Emoji",     # Google emoji 字体
        "Apple Color Emoji",    # macOS emoji 字体
        "Microsoft YaHei",      # Windows 微软雅黑
        "SimHei",               # Windows 黑体
        "PingFang SC",          # macOS 苹方
        "Hiragino Sans GB",     # macOS 冬青黑体
        "Noto Sans CJK SC",     # Linux 思源黑体
        "WenQuanYi Micro Hei",  # Linux 文泉驿微米黑
        "DejaVu Sans",          # 通用字体
        "Arial",                # 通用字体
        "Helvetica",            # 通用字体
    ]
    
    # 创建应用实例（如果还没有的话）
    app = QApplication.instance()
    if app is None:
        app = QApplication([])
    
    # 尝试找到可用的中文字体
    for font_name in chinese_fonts:
        font = QFont(font_name)
        font.setPointSize(size)
        font.setWeight(weight)
        
        # 检查字体是否可用
        if font.exactMatch():
            return font
    
    # 如果都不可用，使用系统默认字体
    default_font = QFont()
    default_font.setPointSize(size)
    default_font.setWeight(weight)
    return default_font


def get_mono_font(size=11):
    """
    获取等宽字体（用于代码显示）
    
    Args:
        size: 字体大小
    
    Returns:
        QFont: 配置好的等宽字体对象
    """
    # 等宽字体优先级列表
    mono_fonts = [
        "Consolas",             # Windows
        "Monaco",               # macOS
        "DejaVu Sans Mono",     # Linux
        "Courier New",          # 通用
        "Courier",              # 通用
    ]
    
    # 创建应用实例（如果还没有的话）
    app = QApplication.instance()
    if app is None:
        app = QApplication([])
    
    # 尝试找到可用的等宽字体
    for font_name in mono_fonts:
        font = QFont(font_name)
        font.setPointSize(size)
        
        # 检查字体是否可用
        if font.exactMatch():
            return font
    
    # 如果都不可用，使用系统默认字体
    default_font = QFont()
    default_font.setPointSize(size)
    default_font.setFamily("monospace")
    return default_font


def get_emoji_font(size=12):
    """
    获取支持 emoji 的字体
    
    Args:
        size: 字体大小
    
    Returns:
        QFont: 配置好的 emoji 字体对象
    """
    # emoji 字体优先级列表
    emoji_fonts = [
        "Segoe UI Emoji",       # Windows emoji 字体
        "Noto Color Emoji",     # Google emoji 字体
        "Apple Color Emoji",    # macOS emoji 字体
        "Twemoji Mozilla",      # Twitter emoji
        "EmojiOne Color",       # EmojiOne
        "JoyPixels",            # JoyPixels
    ]
    
    # 创建应用实例（如果还没有的话）
    app = QApplication.instance()
    if app is None:
        app = QApplication([])
    
    # 尝试找到可用的 emoji 字体
    for font_name in emoji_fonts:
        font = QFont(font_name)
        font.setPointSize(size)
        
        # 检查字体是否可用
        if font.exactMatch():
            return font
    
    # 如果都不可用，使用支持 emoji 的中文字体
    return get_chinese_font(size)


def test_fonts():
    """
    测试字体可用性
    """
    print("🔍 检测字体可用性...")
    
    # 测试中文字体
    chinese_font = get_chinese_font()
    print(f"✅ 中文字体: {chinese_font.family()}")
    
    # 测试等宽字体
    mono_font = get_mono_font()
    print(f"✅ 等宽字体: {mono_font.family()}")
    
    # 测试 emoji 字体
    emoji_font = get_emoji_font()
    print(f"✅ Emoji 字体: {emoji_font.family()}")
    
    return True


if __name__ == "__main__":
    test_fonts() 