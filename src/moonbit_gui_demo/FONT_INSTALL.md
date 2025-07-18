# 中文字体安装指南

如果界面中的中文显示为方框，请按照以下步骤安装中文字体：

## Ubuntu/Debian 系统

```bash
# 安装中文字体包
sudo apt update
sudo apt install fonts-wqy-microhei fonts-wqy-zenhei

# 安装思源黑体
sudo apt install fonts-noto-cjk

# 安装 emoji 字体
sudo apt install fonts-noto-color-emoji

# 刷新字体缓存
sudo fc-cache -fv
```

## CentOS/RHEL 系统

```bash
# 安装中文字体
sudo yum install wqy-microhei-fonts wqy-zenhei-fonts

# 或者使用 dnf (新版本)
sudo dnf install wqy-microhei-fonts wqy-zenhei-fonts

# 安装 emoji 字体
sudo yum install google-noto-emoji-fonts
# 或者
sudo dnf install google-noto-emoji-fonts
```

## WSL (Windows Subsystem for Linux)

```bash
# 在 WSL 中安装字体
sudo apt update
sudo apt install fonts-wqy-microhei fonts-wqy-zenhei fonts-noto-cjk

# 安装 emoji 字体
sudo apt install fonts-noto-color-emoji

# 或者从 Windows 复制字体
sudo cp /mnt/c/Windows/Fonts/msyh.ttc /usr/share/fonts/
sudo cp /mnt/c/Windows/Fonts/simhei.ttf /usr/share/fonts/
sudo cp /mnt/c/Windows/Fonts/seguiemj.ttf /usr/share/fonts/
sudo fc-cache -fv
```

## 手动安装字体

1. 下载字体文件（.ttf 或 .otf）
2. 创建字体目录：
   ```bash
   sudo mkdir -p /usr/share/fonts/chinese
   ```
3. 复制字体文件：
   ```bash
   sudo cp *.ttf /usr/share/fonts/chinese/
   ```
4. 刷新字体缓存：
   ```bash
   sudo fc-cache -fv
   ```

## 验证字体安装

运行字体测试脚本：

```bash
python3 test_fonts.py
```

如果看到测试窗口中的中文正常显示，说明字体安装成功。

运行 emoji 测试脚本：

```bash
python3 test_emoji.py
```

如果看到测试窗口中的 emoji 正常显示，说明 emoji 字体安装成功。

## 常见问题

### 1. 字体仍然显示为方框
- 确保安装了支持中文的字体
- 重启应用程序
- 检查字体缓存是否刷新

### 2. 特定字体不可用
- 程序会自动回退到系统默认字体
- 可以修改 `font_utils.py` 中的字体列表

### 3. WSL 中的字体问题
- 确保 WSL 版本支持字体
- 尝试从 Windows 复制字体文件
- 使用 WSLg 或 WSL2 以获得更好的字体支持

### 4. Emoji 显示为方框
- 安装 Noto Color Emoji 字体
- 在 WSL 中从 Windows 复制 Segoe UI Emoji 字体
- 确保系统支持彩色字体渲染 