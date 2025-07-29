#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
MoonBit 风格界面演示程序
基于 PySide6 的现代化中文界面
"""

import sys
import os
from PySide6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, 
                               QHBoxLayout, QLabel, QPushButton, QTextEdit, 
                               QScrollArea, QFrame, QSizePolicy, QTextBrowser)
from PySide6.QtCore import Qt, QSize, QPropertyAnimation, QEasingCurve, QTimer
from PySide6.QtGui import QFont, QPixmap, QPainter, QLinearGradient, QColor, QPalette

# 导入字体工具
try:
    from font_utils import get_chinese_font, get_mono_font, get_emoji_font
except ImportError:
    # 如果导入失败，使用默认字体函数
    def get_chinese_font(size=12, weight=QFont.Weight.Normal):
        font = QFont()
        font.setPointSize(size)
        font.setWeight(weight)
        return font
    
    def get_mono_font(size=11):
        font = QFont()
        font.setPointSize(size)
        font.setFamily("monospace")
        return font
    
    def get_emoji_font(size=12):
        return get_chinese_font(size)


class MoonBitStyleButton(QPushButton):
    """MoonBit 风格的按钮"""
    
    def __init__(self, text, parent=None):
        super().__init__(text, parent)
        self.setup_style()
        
    def setup_style(self):
        """设置按钮样式"""
        self.setMinimumHeight(50)
        self.setFont(get_chinese_font(12, QFont.Weight.Bold))
        self.setStyleSheet("""
            QPushButton {
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0,
                    stop:0 #8B5CF6, stop:1 #A855F7);
                border: none;
                border-radius: 25px;
                color: white;
                padding: 10px 30px;
                font-weight: bold;
            }
            QPushButton:hover {
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0,
                    stop:0 #7C3AED, stop:1 #9333EA);
                transform: scale(1.05);
            }
            QPushButton:pressed {
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0,
                    stop:0 #6D28D9, stop:1 #7C3AED);
            }
        """)


class CodeDisplayWidget(QTextBrowser):
    """代码展示组件"""
    
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setup_style()
        
    def setup_style(self):
        """设置代码展示样式"""
        self.setFont(get_mono_font(11))
        self.setStyleSheet("""
            QTextBrowser {
                background-color: #1E1E1E;
                color: #E5E7EB;
                border: 2px solid #374151;
                border-radius: 10px;
                padding: 15px;
                selection-background-color: #3B82F6;
            }
        """)
        self.setOpenExternalLinks(False)
        
    def set_code(self, code, language="moonbit"):
        """设置代码内容"""
        # 简单的语法高亮
        highlighted_code = self.highlight_syntax(code, language)
        self.setHtml(highlighted_code)
        
    def highlight_syntax(self, code, language):
        """简单的语法高亮"""
        if language == "moonbit":
            # MoonBit 语法高亮
            code = code.replace("fn", "<span style='color: #F59E0B; font-weight: bold;'>fn</span>")
            code = code.replace("let", "<span style='color: #10B981; font-weight: bold;'>let</span>")
            code = code.replace("mut", "<span style='color: #EF4444; font-weight: bold;'>mut</span>")
            code = code.replace("struct", "<span style='color: #8B5CF6; font-weight: bold;'>struct</span>")
            code = code.replace("enum", "<span style='color: #8B5CF6; font-weight: bold;'>enum</span>")
            code = code.replace("impl", "<span style='color: #8B5CF6; font-weight: bold;'>impl</span>")
            code = code.replace("pub", "<span style='color: #F59E0B; font-weight: bold;'>pub</span>")
            code = code.replace("//", "<span style='color: #6B7280; font-style: italic;'>//")
            code = code.replace("/*", "<span style='color: #6B7280; font-style: italic;'>/*")
            code = code.replace("*/", "*/</span>")
            
            # 将换行符转换为 HTML 换行
            code = code.replace("\n", "<br>")
        
        return code


class MoonBitMainWindow(QMainWindow):
    """MoonBit 主窗口"""
    
    def __init__(self):
        super().__init__()
        self.init_ui()
        
    def init_ui(self):
        """初始化用户界面"""
        self.setWindowTitle("MoonBit - 现代化的编程语言")
        self.setMinimumSize(1000, 700)
        self.setup_central_widget()
        self.setup_styles()
        
    def setup_central_widget(self):
        """设置中央组件"""
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        
        # 主布局
        main_layout = QVBoxLayout(central_widget)
        main_layout.setContentsMargins(0, 0, 0, 0)
        main_layout.setSpacing(0)
        
        # 顶部导航栏
        self.create_header(main_layout)
        
        # 主内容区域
        self.create_main_content(main_layout)
        
        # 底部信息
        self.create_footer(main_layout)
        
    def create_header(self, parent_layout):
        """创建顶部导航栏"""
        header = QFrame()
        header.setFixedHeight(80)
        header.setStyleSheet("""
            QFrame {
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0,
                    stop:0 #8B5CF6, stop:1 #A855F7);
                border: none;
            }
        """)
        
        header_layout = QHBoxLayout(header)
        header_layout.setContentsMargins(30, 0, 30, 0)
        
        # Logo 和标题
        title_label = QLabel("🌙 MoonBit")
        title_label.setFont(get_emoji_font(24))
        title_label.setStyleSheet("color: white;")
        
        # 导航按钮
        nav_layout = QHBoxLayout()
        nav_layout.setSpacing(20)
        
        nav_buttons = ["首页", "文档", "下载", "社区"]
        for text in nav_buttons:
            btn = QPushButton(text)
            btn.setFont(get_chinese_font(12))
            btn.setStyleSheet("""
                QPushButton {
                    background: transparent;
                    border: none;
                    color: white;
                    padding: 8px 16px;
                    border-radius: 6px;
                }
                QPushButton:hover {
                    background-color: rgba(255, 255, 255, 0.1);
                }
            """)
            nav_layout.addWidget(btn)
        
        header_layout.addWidget(title_label)
        header_layout.addStretch()
        header_layout.addLayout(nav_layout)
        
        parent_layout.addWidget(header)
        
    def create_main_content(self, parent_layout):
        """创建主内容区域"""
        # 创建滚动区域
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        scroll_area.setStyleSheet("""
            QScrollArea {
                border: none;
                background: transparent;
            }
            QScrollBar:vertical {
                background: #F3F4F6;
                width: 12px;
                border-radius: 6px;
            }
            QScrollBar::handle:vertical {
                background: #D1D5DB;
                border-radius: 6px;
                min-height: 20px;
            }
            QScrollBar::handle:vertical:hover {
                background: #9CA3AF;
            }
        """)
        
        content_widget = QWidget()
        content_layout = QVBoxLayout(content_widget)
        content_layout.setContentsMargins(40, 40, 40, 40)
        content_layout.setSpacing(40)
        
        # 欢迎区域
        self.create_welcome_section(content_layout)
        
        # 特性展示区域
        self.create_features_section(content_layout)
        
        # 代码展示区域
        self.create_code_section(content_layout)
        
        # 下载区域
        self.create_download_section(content_layout)
        
        scroll_area.setWidget(content_widget)
        parent_layout.addWidget(scroll_area)
        
    def create_welcome_section(self, parent_layout):
        """创建欢迎区域"""
        welcome_frame = QFrame()
        welcome_frame.setStyleSheet("""
            QFrame {
                background: qlineargradient(x1:0, y1:0, x2:0, y2:1,
                    stop:0 #F8FAFC, stop:1 #F1F5F9);
                border-radius: 20px;
                padding: 20px;
            }
        """)
        
        welcome_layout = QVBoxLayout(welcome_frame)
        welcome_layout.setSpacing(20)
        
        # 主标题
        title = QLabel("欢迎使用 MoonBit")
        title.setFont(get_chinese_font(36, QFont.Weight.Bold))
        title.setStyleSheet("color: #1F2937; text-align: center;")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 副标题
        subtitle = QLabel("现代化的编程语言，专为高性能和易用性而设计")
        subtitle.setFont(get_chinese_font(18))
        subtitle.setStyleSheet("color: #6B7280; text-align: center;")
        subtitle.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 描述
        description = QLabel("""
        MoonBit 是一个现代化的编程语言，具有以下特点：
        • 高性能：编译为原生代码，运行速度快
        • 内存安全：内置内存安全机制，避免常见错误
        • 简洁语法：设计简洁，易于学习和使用
        • 跨平台：支持 Windows、macOS、Linux 等平台
        • 强大工具链：提供完整的开发工具和包管理系统
        """)
        description.setFont(get_chinese_font(14))
        description.setStyleSheet("color: #374151; line-height: 1.6;")
        description.setWordWrap(True)
        
        welcome_layout.addWidget(title)
        welcome_layout.addWidget(subtitle)
        welcome_layout.addWidget(description)
        
        parent_layout.addWidget(welcome_frame)
        
    def create_features_section(self, parent_layout):
        """创建特性展示区域"""
        features_frame = QFrame()
        features_frame.setStyleSheet("""
            QFrame {
                background: white;
                border-radius: 20px;
                border: 1px solid #E5E7EB;
            }
        """)
        
        features_layout = QVBoxLayout(features_frame)
        features_layout.setContentsMargins(30, 30, 30, 30)
        features_layout.setSpacing(30)
        
        # 标题
        title = QLabel("核心特性")
        title.setFont(get_chinese_font(28, QFont.Weight.Bold))
        title.setStyleSheet("color: #1F2937; text-align: center;")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 特性网格
        features_grid = QHBoxLayout()
        features_grid.setSpacing(20)
        
        features = [
            ("🚀", "高性能", "编译为原生代码，运行速度快"),
            ("🛡️", "内存安全", "内置内存安全机制，避免常见错误"),
            ("📝", "简洁语法", "设计简洁，易于学习和使用"),
            ("🌍", "跨平台", "支持多种操作系统和架构")
        ]
        
        for icon, name, desc in features:
            feature_widget = self.create_feature_card(icon, name, desc)
            features_grid.addWidget(feature_widget)
        
        features_layout.addWidget(title)
        features_layout.addLayout(features_grid)
        
        parent_layout.addWidget(features_frame)
        
    def create_feature_card(self, icon, name, description):
        """创建特性卡片"""
        card = QFrame()
        card.setStyleSheet("""
            QFrame {
                background: qlineargradient(x1:0, y1:0, x2:0, y2:1,
                    stop:0 #F8FAFC, stop:1 #F1F5F9);
                border-radius: 15px;
                border: 1px solid #E5E7EB;
                padding: 20px;
            }
            QFrame:hover {
                border: 2px solid #8B5CF6;
                transform: translateY(-2px);
            }
        """)
        
        layout = QVBoxLayout(card)
        layout.setSpacing(15)
        
        # 图标
        icon_label = QLabel(icon)
        icon_label.setFont(get_emoji_font(32))
        icon_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 名称
        name_label = QLabel(name)
        name_label.setFont(get_chinese_font(16, QFont.Weight.Bold))
        name_label.setStyleSheet("color: #1F2937; text-align: center;")
        name_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 描述
        desc_label = QLabel(description)
        desc_label.setFont(get_chinese_font(12))
        desc_label.setStyleSheet("color: #6B7280; text-align: center; line-height: 1.4;")
        desc_label.setWordWrap(True)
        desc_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        layout.addWidget(icon_label)
        layout.addWidget(name_label)
        layout.addWidget(desc_label)
        
        return card
        
    def create_code_section(self, parent_layout):
        """创建代码展示区域"""
        code_frame = QFrame()
        code_frame.setStyleSheet("""
            QFrame {
                background: white;
                border-radius: 20px;
                border: 1px solid #E5E7EB;
            }
        """)
        
        code_layout = QVBoxLayout(code_frame)
        code_layout.setContentsMargins(30, 30, 30, 30)
        code_layout.setSpacing(20)
        
        # 标题
        title = QLabel("代码示例")
        title.setFont(get_chinese_font(28, QFont.Weight.Bold))
        title.setStyleSheet("color: #1F2937; text-align: center;")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 代码展示
        code_display = CodeDisplayWidget()
        moonbit_code = '''// MoonBit 代码示例
fn fibonacci(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

// 结构体定义
struct Point {
    x: Int
    y: Int
}

// 实现方法
impl Point {
    fn distance(&self, other: Point) -> Float {
        let dx = self.x - other.x
        let dy = self.y - other.y
        sqrt(dx * dx + dy * dy)
    }
}

// 主函数
fn main() {
    let result = fibonacci(10)
    println("斐波那契数列第10项: {result}")
    
    let p1 = Point { x: 0, y: 0 }
    let p2 = Point { x: 3, y: 4 }
    let dist = p1.distance(p2)
    println("两点距离: {dist}")
}'''
        
        code_display.set_code(moonbit_code, "moonbit")
        code_display.setMinimumHeight(400)
        
        code_layout.addWidget(title)
        code_layout.addWidget(code_display)
        
        parent_layout.addWidget(code_frame)
        
    def create_download_section(self, parent_layout):
        """创建下载区域"""
        download_frame = QFrame()
        download_frame.setStyleSheet("""
            QFrame {
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0,
                    stop:0 #8B5CF6, stop:1 #A855F7);
                border-radius: 20px;
                padding: 20px;
            }
        """)
        
        download_layout = QVBoxLayout(download_frame)
        download_layout.setSpacing(20)
        
        # 标题
        title = QLabel("立即开始使用 MoonBit")
        title.setFont(get_chinese_font(28, QFont.Weight.Bold))
        title.setStyleSheet("color: white; text-align: center;")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 描述
        desc = QLabel("下载最新版本，开始您的 MoonBit 编程之旅")
        desc.setFont(get_chinese_font(16))
        desc.setStyleSheet("color: rgba(255, 255, 255, 0.9); text-align: center;")
        desc.setAlignment(Qt.AlignmentFlag.AlignCenter)
        
        # 按钮区域
        button_layout = QHBoxLayout()
        button_layout.setSpacing(20)
        
        download_btn = MoonBitStyleButton("📥 下载 MoonBit")
        download_btn.setMinimumWidth(200)
        download_btn.clicked.connect(self.on_download_clicked)
        
        docs_btn = QPushButton("📚 查看文档")
        docs_btn.setFont(get_emoji_font(12))
        docs_btn.setStyleSheet("""
            QPushButton {
                background: transparent;
                border: 2px solid white;
                border-radius: 25px;
                color: white;
                padding: 10px 30px;
                font-weight: bold;
            }
            QPushButton:hover {
                background: rgba(255, 255, 255, 0.1);
            }
        """)
        docs_btn.setMinimumWidth(200)
        docs_btn.clicked.connect(self.on_docs_clicked)
        
        button_layout.addStretch()
        button_layout.addWidget(download_btn)
        button_layout.addWidget(docs_btn)
        button_layout.addStretch()
        
        download_layout.addWidget(title)
        download_layout.addWidget(desc)
        download_layout.addLayout(button_layout)
        
        parent_layout.addWidget(download_frame)
        
    def create_footer(self, parent_layout):
        """创建底部信息"""
        footer = QFrame()
        footer.setFixedHeight(60)
        footer.setStyleSheet("""
            QFrame {
                background: #1F2937;
                border: none;
            }
        """)
        
        footer_layout = QHBoxLayout(footer)
        footer_layout.setContentsMargins(30, 0, 30, 0)
        
        # 版权信息
        copyright_label = QLabel("© 2024 MoonBit. 保留所有权利。")
        copyright_label.setFont(get_chinese_font(12))
        copyright_label.setStyleSheet("color: #9CA3AF;")
        
        # 链接
        links_layout = QHBoxLayout()
        links_layout.setSpacing(20)
        
        links = ["GitHub", "文档", "社区", "联系我们"]
        for link in links:
            link_btn = QPushButton(link)
            link_btn.setFont(get_chinese_font(12))
            link_btn.setStyleSheet("""
                QPushButton {
                    background: transparent;
                    border: none;
                    color: #9CA3AF;
                    padding: 5px 10px;
                }
                QPushButton:hover {
                    color: white;
                }
            """)
            links_layout.addWidget(link_btn)
        
        footer_layout.addWidget(copyright_label)
        footer_layout.addStretch()
        footer_layout.addLayout(links_layout)
        
        parent_layout.addWidget(footer)
        
    def setup_styles(self):
        """设置全局样式"""
        self.setStyleSheet("""
            QMainWindow {
                background: qlineargradient(x1:0, y1:0, x2:0, y2:1,
                    stop:0 #F8FAFC, stop:1 #F1F5F9);
            }
        """)
        
    def on_download_clicked(self):
        """下载按钮点击事件"""
        print("下载按钮被点击")
        # 这里可以添加实际的下载逻辑
        
    def on_docs_clicked(self):
        """文档按钮点击事件"""
        print("文档按钮被点击")
        # 这里可以添加打开文档的逻辑


def main():
    """主函数"""
    app = QApplication(sys.argv)
    
    # 设置应用程序信息
    app.setApplicationName("MoonBit GUI Demo")
    app.setApplicationVersion("1.0.0")
    app.setOrganizationName("MoonBit")
    
    # 创建主窗口
    window = MoonBitMainWindow()
    window.show()
    
    # 运行应用程序
    sys.exit(app.exec())


if __name__ == "__main__":
    main() 