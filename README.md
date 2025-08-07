# 🌙 MoonBit Qt GUI 控件库

这是一个为 MoonBit 语言设计的 PySide6/Qt GUI 控件库，通过 FFI 实现了 MoonBit 与 Python Qt 框架的互通。

## 📋 支持的控件

### 基础控件
- **QWidget** - 所有控件的基类
- **QLabel** - 标签控件
- **QPushButton** - 按钮控件
- **QLineEdit** - 单行文本输入框
- **QTextEdit** - 多行文本编辑器

### 选择控件
- **QCheckBox** - 复选框
- **QRadioButton** - 单选按钮
- **QComboBox** - 下拉选择框

### 数值控件
- **QSlider** - 滑块控件
- **QProgressBar** - 进度条

### 容器控件
- **QTabWidget** - 标签页控件
- **QMainWindow** - 主窗口

### 布局管理器
- **QVBoxLayout** - 垂直布局
- **QHBoxLayout** - 水平布局

## 🚀 快速开始

### 基本用法

```moonbit
import @qtgui.Sys as Sys
import @qtgui.QApplication as QApplication
import @qtgui.QMainWindow as QMainWindow
import @qtgui.QLabel as QLabel
import @qtgui.QPushButton as QPushButton

fn main() {
  let sys = Sys::new()
  let app = QApplication::new(sys.argv())
  
  let window = QMainWindow::new()
  window.set_geometry(100, 100, 400, 300)
  
  let label = QLabel::new("Hello, MoonBit!", window)
  label.setGeometry(50, 50, 200, 30)
  
  let button = QPushButton::new("点击我", window)
  button.setGeometry(50, 100, 100, 30)
  
  window.show()
  sys.exit(app.exec())
}
```

### 使用布局管理器

```moonbit
import @qtgui.QVBoxLayout as QVBoxLayout
import @qtgui.QHBoxLayout as QHBoxLayout

fn create_layout_demo() {
  let window = QMainWindow::new()
  let central_widget = QWidget::new(window)
  window.setCentralWidget(central_widget)
  
  let main_layout = QVBoxLayout::new_with_widget(central_widget)
  
  // 创建水平布局
  let button_layout = QHBoxLayout::new()
  let button1 = QPushButton::new("按钮 1", window)
  let button2 = QPushButton::new("按钮 2", window)
  
  button_layout.addWidget(button1)
  button_layout.addWidget(button2)
  
  main_layout.addLayout(button_layout)
}
```

## 📝 API 参考

### QPushButton

```moonbit
// 创建按钮
let button = QPushButton::new("按钮文本", window)

// 设置文本
button.setText("新文本")

// 获取文本
let text = button.getText()

// 设置样式
button.setStyleSheet("QPushButton { background-color: #3498db; color: white; }")

// 设置启用状态
button.setEnabled(true)

// 获取点击信号
let clicked_signal = button.clicked()
```

### QLineEdit

```moonbit
// 创建输入框
let line_edit = QLineEdit::new(window)

// 设置占位符文本
line_edit.setPlaceholderText("请输入...")

// 设置文本
line_edit.setText("初始文本")

// 获取文本
let text = line_edit.getText()

// 设置只读
line_edit.setReadOnly(true)

// 获取文本变化信号
let text_changed_signal = line_edit.textChanged()
```

### QComboBox

```moonbit
// 创建下拉框
let combo_box = QComboBox::new(window)

// 添加项目
combo_box.addItem("项目 1")
combo_box.addItem("项目 2")

// 设置当前索引
combo_box.setCurrentIndex(0)

// 获取当前文本
let current_text = combo_box.getCurrentText()

// 获取项目数量
let count = combo_box.count()

// 获取索引变化信号
let index_changed_signal = combo_box.currentIndexChanged()
```

### QSlider

```moonbit
// 创建水平滑块
let slider = QSlider::new_horizontal(window)

// 设置范围
slider.setRange(0, 100)

// 设置当前值
slider.setValue(50)

// 获取当前值
let value = slider.getValue()

// 设置刻度位置
slider.setTickPosition(1) // 1 = 刻度在下方

// 获取值变化信号
let value_changed_signal = slider.valueChanged()
```

### QProgressBar

```moonbit
// 创建进度条
let progress_bar = QProgressBar::new(window)

// 设置范围
progress_bar.setRange(0, 100)

// 设置当前值
progress_bar.setValue(75)

// 设置格式
progress_bar.setFormat("进度: %p%")

// 设置文本可见
progress_bar.setTextVisible(true)

// 重置进度条
progress_bar.reset()
```

### QTabWidget

```moonbit
// 创建标签页控件
let tab_widget = QTabWidget::new(window)

// 创建标签页内容
let tab1_widget = QWidget::new(window)
let tab2_widget = QWidget::new(window)

// 添加标签页
tab_widget.addTab(tab1_widget, "标签页 1")
tab_widget.addTab(tab2_widget, "标签页 2")

// 设置当前标签页
tab_widget.setCurrentIndex(0)

// 获取当前标签页索引
let current_index = tab_widget.getCurrentIndex()

// 设置标签页文本
tab_widget.setTabText(0, "新标签页名称")
```

## 🎨 样式设置

所有控件都支持 CSS 样式表：

```moonbit
// 按钮样式
button.setStyleSheet("""
  QPushButton {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
  }
  QPushButton:hover {
    background-color: #2980b9;
  }
""")

// 输入框样式
line_edit.setStyleSheet("""
  QLineEdit {
    padding: 8px;
    border: 2px solid #bdc3c7;
    border-radius: 4px;
  }
  QLineEdit:focus {
    border-color: #3498db;
  }
""")
```

## 🔧 信号与槽

虽然当前版本主要支持基本的控件操作，但信号系统已经预留：

```moonbit
// 获取信号对象（用于未来扩展）
let clicked_signal = button.clicked()
let text_changed_signal = line_edit.textChanged()
let value_changed_signal = slider.valueChanged()
```

## 📦 依赖要求

- MoonBit 语言环境
- Python 3.6+
- PySide6 库
- Kaida-Amethyst/python 包

## 🛠️ 构建与运行

```bash
# 运行示例
moon run src/main --target native

# 运行综合演示
moon run .mooncakes/WilliamZ1008/qtgui/src/example_comprehensive.mbt --target native
```

## 📚 更多示例

查看 `example_comprehensive.mbt` 文件获取完整的使用示例，展示了如何组合使用各种控件创建复杂的 GUI 应用。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个库！

## 📄 许可证

Apache 2.0 License