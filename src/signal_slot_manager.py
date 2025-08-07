from PySide6.QtCore import QObject
from PySide6.QtWidgets import QPushButton, QLabel

class SignalSlotManager(QObject):
    def __init__(self):
        super().__init__()

    def connect_button_to_label(self, button: QPushButton, label: QLabel, text: str):
        """
        使用 lambda 函数连接按钮的 clicked 信号到标签的 setText 槽，
        当按钮被点击时，标签的文本将被更新为指定的文本。
        """
        button.clicked.connect(lambda: label.setText(text))

    def connect_button_to_increment_label(self, button: QPushButton, label: QLabel, prefix: str, suffix: str, initial_value: int = 0):
        """
        使用 lambda 函数连接按钮的 clicked 信号到标签的 setText 槽，
        当按钮被点击时，标签的文本将递增。
        """
        # 使用 lambda 函数递增标签中的数字
        button.clicked.connect(lambda: self._increment_label(label, prefix, suffix, initial_value))

    def _increment_label(self, label: QLabel, prefix: str, suffix: str, value: int):
        """
        内部方法，用于递增标签中的数字。
        """
        value_str = label.text().lstrip(prefix).rstrip(suffix)
        value_int = int(value_str) if value_str.isdigit() else value
        value_int += 1
        label.setText(f"{prefix}{value_int}{suffix}")
