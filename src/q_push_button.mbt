pub struct QPushButton {
  priv q_push_button : PyObject
}

pub fn QPushButton::new(text: String, window: QMainWindow) -> QPushButton {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QPushButton") is Some(PyCallable(q_push_button_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_push_button_class.invoke(args~)) is Ok(Some(PyClass(button)))
  QPushButton::{ q_push_button: button }
}

pub fn QPushButton::getPyObject(self : QPushButton) -> PyObject {
  self.q_push_button
}

pub fn QPushButton::setText(self : QPushButton, text: String) -> Unit {
  guard self.q_push_button.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QPushButton::getText(self : QPushButton) -> String {
  guard self.q_push_button.get_attr("text") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QPushButton::setGeometry(self : QPushButton, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_push_button.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QPushButton::setStyleSheet(self : QPushButton, style_sheet: String) -> Unit {
  guard self.q_push_button.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QPushButton::setEnabled(self : QPushButton, enabled: Bool) -> Unit {
  guard self.q_push_button.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QPushButton::clicked(self : QPushButton) -> PyCallable {
  guard self.q_push_button.get_attr("clicked") is Some(PyCallable(signal))
  signal
}

pub fn QPushButton::toQWidget(self : QPushButton) -> QWidget {
  QWidget::{ q_widget: self.q_push_button }
} 