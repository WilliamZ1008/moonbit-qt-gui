#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
MoonBit GUI 启动脚本
"""

import sys
import os

# 添加当前目录到 Python 路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

try:
    from main import main
    main()
except ImportError as e:
    print(f"导入错误: {e}")
    print("请确保已安装 PySide6: pip install pyside6")
except Exception as e:
    print(f"运行错误: {e}") 