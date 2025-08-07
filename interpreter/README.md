# Python 环境设置指南

本指南将帮助您为 MoonBit Qt GUI 项目创建轻量级的 Python 环境。

## 🎯 目标

创建一个最小化的 Python 环境，仅包含运行 MoonBit Qt GUI 项目所需的依赖项，避免大型的 conda 环境。

## 📋 系统要求

- Python 3.8 或更高版本
- pip（Python 包管理器）
- 支持的操作系统：Linux、macOS、Windows

## 🚀 快速设置

### 方法一：使用 venv（推荐）

```bash
# 1. 创建虚拟环境
python3 -m venv .mooncakes/WilliamZ1008/qtgui/interpreter/.env_qt_python

# 2. 激活虚拟环境
# Linux/macOS:
source .mooncakes/WilliamZ1008/qtgui/interpreter/.env_qt_python/bin/activate
# Windows:
# .env_qt_python\Scripts\activate

# 3. 升级 pip
pip install --upgrade pip

# 4. 安装依赖
pip install -r .mooncakes/WilliamZ1008/qtgui/interpreter/requirements.txt

# 5. 验证安装

```bash
# 检查 Python 版本
python --version

# 检查已安装的包
pip list

# 测试 PySide6 导入
python -c "import PySide6; print('PySide6 安装成功')"
```

## 🔧 环境验证

安装完成后，可以通过以下方式验证环境：

```bash
# 检查 Python 版本
python --version

# 检查已安装的包
pip list

# 测试 PySide6 导入
python -c "import PySide6; print('PySide6 安装成功')"
```
```

### 方法二：使用 conda（如果需要）

```bash
# 1. 创建 conda 环境
conda create -n MoonBit_QT python=3.10

# 2. 激活环境
conda activate MoonBit_QT

# 3. 安装依赖
pip install -r .mooncakes/WilliamZ1008/qtgui/interpreter/requirements.txt

# 4. 验证安装

```bash
# 检查 Python 版本
python --version

# 检查已安装的包
pip list

# 测试 PySide6 导入
python -c "import PySide6; print('PySide6 安装成功')"
```
```

## 📦 依赖项说明

当前项目需要以下核心依赖：

- **PySide6==6.9.0** - Qt for Python 绑定
- **PySide6_Addons==6.9.0** - PySide6 附加模块
- **PySide6_Essentials==6.9.0** - PySide6 核心模块
- **shiboken6==6.9.0** - Python/C++ 绑定工具
- **setuptools==78.1.1** - Python 包管理工具
- **wheel==0.45.1** - Python 包分发工具

## 🔧 环境验证

安装完成后，可以通过以下方式验证环境：

```bash
# 检查 Python 版本
python --version

# 检查已安装的包
pip list

# 测试 PySide6 导入
python -c "import PySide6; print('PySide6 安装成功')"
```

## 🗂️ 目录结构

```
interpreter/
├── .env_qt_python/          # Python 虚拟环境（使用 venv 创建）
├── requirements.txt          # Python 依赖列表
└── README.md               # 本文件
```

## ⚠️ 注意事项

1. **避免使用大型 conda 环境**：conda 环境通常包含大量不必要的包，会增加环境大小
2. **使用虚拟环境**：始终使用虚拟环境来隔离项目依赖
3. **定期清理**：定期清理不需要的包以保持环境轻量
4. **版本锁定**：使用 `requirements.txt` 确保依赖版本一致性

## 🧹 清理旧环境

如果之前创建了大型的 conda 环境，可以按以下步骤清理：

```bash
# 删除旧的 conda 环境（如果存在）
conda env remove -n qtgui

# 删除旧的虚拟环境目录
rm -rf .env_qt_python

# 重新创建轻量级环境
python3 -m venv .env_qt_python
```

## 🔍 故障排除

### 常见问题

1. **PySide6 安装失败**
   ```bash
   # 尝试使用系统包管理器安装 Qt 依赖
   # Ubuntu/Debian:
   sudo apt-get install qt6-base-dev
   # macOS:
   brew install qt6
   ```

2. **权限问题**
   ```bash
   # 确保有写入权限
   chmod +w .env_qt_python
   ```

3. **网络问题**
   ```bash
   # 使用国内镜像源
   pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
   ```

## 📚 相关链接

- [PySide6 官方文档](https://doc.qt.io/qtforpython/)
- [Python venv 文档](https://docs.python.org/3/library/venv.html)
- [MoonBit 官方文档](https://www.moonbitlang.com/)

## 🚀 运行脚本示例

### 使用 venv 的运行脚本

在你的项目目录创建 `run.sh` 文件：

```bash
#!/bin/bash

# 激活虚拟环境
source .mooncakes/WilliamZ1008/qtgui/interpreter/.env_qt_python/bin/activate

# 设置环境变量
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.env_qt_python/lib
export PYTHONPATH="$PYTHONPATH:.mooncakes/WilliamZ1008/qtgui/src"

# 设置 Python 版本变量
export PY_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

# 设置编译器标志
export CC_FLAGS="-I$(python3-config --prefix)/include/python$PY_VERSION -O2 -DNDEBUG"
export CC_LINK_FLAGS="$(python3-config --ldflags) -lpython$PY_VERSION"
export C_INCLUDE_PATH="$(python3-config --prefix)/include/python$PY_VERSION:$C_INCLUDE_PATH"

# 运行 MoonBit 应用
moon run src/main --target native
```

### 使用 conda 的运行脚本

创建 `run.sh` 文件：

```bash
#!/bin/bash

# 激活 conda 环境
eval "$(conda shell.bash hook)"
conda activate MoonBit_QT

# 设置环境变量
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
export PYTHONPATH="$PYTHONPATH:.mooncakes/WilliamZ1008/qtgui/src"

# 设置 Python 版本变量
export PY_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

# 设置编译器标志
export CC_FLAGS="-I$(python3-config --prefix)/include/python$PY_VERSION -O2 -DNDEBUG"
export CC_LINK_FLAGS="$(python3-config --ldflags) -lpython$PY_VERSION"
export C_INCLUDE_PATH="$(python3-config --prefix)/include/python$PY_VERSION:$C_INCLUDE_PATH"

# 运行 MoonBit 应用
moon run src/main --target native
```

使用方法：

```bash
# 给脚本执行权限
chmod +x run.sh

# 运行脚本
./run.sh
```

## 🤝 贡献

如果您发现任何问题或有改进建议，请提交 Issue 或 Pull Request。
