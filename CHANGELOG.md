# 🌙 MoonBit Qt GUI 控件库 - 变更日志

## [1.1.0] - 2024-12-19

### 🆕 新增功能

#### 基础控件
- **QWidget** - 所有控件的基类
  - `new(window)` - 创建新的控件
  - `setGeometry(x, y, width, height)` - 设置几何位置
  - `setStyleSheet(style)` - 设置样式表
  - `setEnabled(enabled)` - 设置启用状态
  - `show()` / `hide()` - 显示/隐藏控件
  - `setVisible(visible)` / `isVisible()` - 设置/获取可见性

#### 交互控件
- **QPushButton** - 按钮控件
  - `new(text, window)` - 创建按钮
  - `setText(text)` / `getText()` - 设置/获取文本
  - `setEnabled(enabled)` - 设置启用状态
  - `clicked()` - 获取点击信号

- **QLineEdit** - 单行文本输入框
  - `new(window)` / `new_with_text(text, window)` - 创建输入框
  - `setText(text)` / `getText()` - 设置/获取文本
  - `setPlaceholderText(placeholder)` - 设置占位符
  - `setReadOnly(read_only)` - 设置只读模式
  - `textChanged()` / `returnPressed()` - 获取信号

- **QTextEdit** - 多行文本编辑器
  - `new(window)` / `new_with_text(text, window)` - 创建编辑器
  - `setText(text)` / `getText()` - 设置/获取纯文本
  - `setHtml(html)` / `getHtml()` - 设置/获取 HTML
  - `append(text)` - 追加文本
  - `clear()` - 清空内容
  - `setReadOnly(read_only)` - 设置只读模式

#### 选择控件
- **QCheckBox** - 复选框
  - `new(text, window)` - 创建复选框
  - `setText(text)` / `getText()` - 设置/获取文本
  - `setChecked(checked)` / `isChecked()` - 设置/获取选中状态
  - `setTristate(tristate)` - 设置三态模式
  - `stateChanged()` / `toggled()` - 获取信号

- **QRadioButton** - 单选按钮
  - `new(text, window)` - 创建单选按钮
  - `setText(text)` / `getText()` - 设置/获取文本
  - `setChecked(checked)` / `isChecked()` - 设置/获取选中状态
  - `toggled()` - 获取信号

- **QComboBox** - 下拉选择框
  - `new(window)` - 创建下拉框
  - `addItem(text)` - 添加项目
  - `addItems(texts)` - 批量添加项目
  - `setCurrentIndex(index)` / `getCurrentIndex()` - 设置/获取当前索引
  - `setCurrentText(text)` / `getCurrentText()` - 设置/获取当前文本
  - `clear()` - 清空所有项目
  - `count()` - 获取项目数量
  - `currentIndexChanged()` / `currentTextChanged()` - 获取信号

#### 数值控件
- **QSlider** - 滑块控件
  - `new(window)` / `new_horizontal(window)` / `new_vertical(window)` - 创建滑块
  - `setRange(min, max)` - 设置范围
  - `setValue(value)` / `getValue()` - 设置/获取当前值
  - `setMinimum(min)` / `getMinimum()` - 设置/获取最小值
  - `setMaximum(max)` / `getMaximum()` - 设置/获取最大值
  - `setTickPosition(position)` - 设置刻度位置
  - `setTickInterval(interval)` - 设置刻度间隔
  - `valueChanged()` / `sliderMoved()` - 获取信号

- **QProgressBar** - 进度条
  - `new(window)` - 创建进度条
  - `setRange(min, max)` - 设置范围
  - `setValue(value)` / `getValue()` - 设置/获取当前值
  - `setMinimum(min)` / `getMinimum()` - 设置/获取最小值
  - `setMaximum(max)` / `getMaximum()` - 设置/获取最大值
  - `setFormat(format)` - 设置显示格式
  - `setTextVisible(visible)` - 设置文本可见性
  - `reset()` - 重置进度条
  - `valueChanged()` - 获取信号

#### 容器控件
- **QTabWidget** - 标签页控件
  - `new(window)` - 创建标签页控件
  - `addTab(widget, text)` - 添加标签页
  - `insertTab(index, widget, text)` - 插入标签页
  - `removeTab(index)` - 移除标签页
  - `setCurrentIndex(index)` / `getCurrentIndex()` - 设置/获取当前索引
  - `setTabText(index, text)` / `getTabText(index)` - 设置/获取标签页文本
  - `count()` - 获取标签页数量
  - `currentChanged()` / `tabCloseRequested()` - 获取信号

#### 布局管理器
- **QVBoxLayout** - 垂直布局
  - `new()` / `new_with_widget(widget)` - 创建布局
  - `addWidget(widget)` - 添加控件
  - `addLayout(layout)` - 添加子布局
  - `addStretch()` / `addStretch_with_stretch(stretch)` - 添加弹性空间
  - `setSpacing(spacing)` - 设置间距
  - `setContentsMargins(left, top, right, bottom)` - 设置边距

- **QHBoxLayout** - 水平布局
  - `new()` / `new_with_widget(widget)` - 创建布局
  - `addWidget(widget)` - 添加控件
  - `addLayout(layout)` - 添加子布局
  - `addStretch()` / `addStretch_with_stretch(stretch)` - 添加弹性空间
  - `setSpacing(spacing)` - 设置间距
  - `setContentsMargins(left, top, right, bottom)` - 设置边距

### 📚 文档和示例

- 添加了详细的 README.md 文档
- 创建了综合示例 `example_comprehensive.mbt`
- 提供了完整的 API 参考和使用示例
- 包含了样式设置指南

### 🔧 技术改进

- 统一了所有控件的 API 设计模式
- 提供了完整的错误处理机制
- 支持信号系统（为未来扩展预留）
- 实现了类型安全的 MoonBit 到 Python 对象映射

### 🎯 使用场景

这些新增的控件支持以下使用场景：
- 创建复杂的表单界面
- 构建数据输入和验证界面
- 实现设置和配置面板
- 开发多标签页应用
- 创建进度显示和用户反馈界面
- 构建现代化的桌面应用

### 📦 兼容性

- 与现有的 QApplication、QMainWindow、QLabel 等控件完全兼容
- 支持所有现有的样式设置和布局管理功能
- 保持了与 Kaida-Amethyst/python 包的完全兼容性

---

## [1.0.0] - 2024-12-18

### 🎉 初始版本

- QApplication - 应用程序主类
- QMainWindow - 主窗口
- QLabel - 标签控件
- QPixmap - 图像处理
- Sys - 系统接口
- Demo - 演示类 