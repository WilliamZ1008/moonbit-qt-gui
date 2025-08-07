pub struct QRadioButton {
  priv q_radio_button : PyObject
}

pub fn QRadioButton::new(text: String, window: QMainWindow) -> QRadioButton {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QRadioButton") is Some(PyCallable(q_radio_button_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_radio_button_class.invoke(args~)) is Ok(Some(PyClass(radio_button)))
  QRadioButton::{ q_radio_button: radio_button }
}

pub fn QRadioButton::setText(self : QRadioButton, text: String) -> Unit {
  guard self.q_radio_button.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QRadioButton::getText(self : QRadioButton) -> String {
  guard self.q_radio_button.get_attr("text") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QRadioButton::setChecked(self : QRadioButton, checked: Bool) -> Unit {
  guard self.q_radio_button.get_attr("setChecked") is Some(PyCallable(set_checked_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(checked))
  let _ = try? set_checked_method.invoke(args~)
}

pub fn QRadioButton::isChecked(self : QRadioButton) -> Bool {
  guard self.q_radio_button.get_attr("isChecked") is Some(PyCallable(is_checked_method))
  let result = try? is_checked_method.invoke()
  match result {
    Ok(Some(PyInteger(checked))) => checked.to_int64() != 0L
    _ => false
  }
}

pub fn QRadioButton::setGeometry(self : QRadioButton, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_radio_button.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QRadioButton::setStyleSheet(self : QRadioButton, style_sheet: String) -> Unit {
  guard self.q_radio_button.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QRadioButton::setEnabled(self : QRadioButton, enabled: Bool) -> Unit {
  guard self.q_radio_button.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QRadioButton::toggled(self : QRadioButton) -> PyCallable {
  guard self.q_radio_button.get_attr("toggled") is Some(PyCallable(signal))
  signal
} 