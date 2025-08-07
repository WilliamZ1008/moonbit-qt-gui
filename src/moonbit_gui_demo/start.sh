#!/bin/bash

echo "🚀 启动 MoonBit GUI 演示程序..."

# 检查 Python 是否安装
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误: 未找到 Python3"
    exit 1
fi

# 检查是否安装了 PySide6
if ! python3 -c "import PySide6" 2>/dev/null; then
    echo "📦 正在安装 PySide6..."
    pip3 install pyside6
fi

# 运行字体测试
echo "🧪 运行字体测试..."
python3 test_fonts.py

# 启动主程序
echo "🎯 启动主程序..."
python3 main.py 