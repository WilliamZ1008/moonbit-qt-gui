pub struct QCheckBox {
  priv q_check_box : PyObject
}

pub fn QCheckBox::new(text: String, window: QMainWindow) -> QCheckBox {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QCheckBox") is Some(PyCallable(q_check_box_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_check_box_class.invoke(args~)) is Ok(Some(PyClass(check_box)))
  QCheckBox::{ q_check_box: check_box }
}

pub fn QCheckBox::setText(self : QCheckBox, text: String) -> Unit {
  guard self.q_check_box.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QCheckBox::getText(self : QCheckBox) -> String {
  guard self.q_check_box.get_attr("text") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QCheckBox::setChecked(self : QCheckBox, checked: Bool) -> Unit {
  guard self.q_check_box.get_attr("setChecked") is Some(PyCallable(set_checked_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(checked))
  let _ = try? set_checked_method.invoke(args~)
}

pub fn QCheckBox::isChecked(self : QCheckBox) -> Bool {
  guard self.q_check_box.get_attr("isChecked") is Some(PyCallable(is_checked_method))
  let result = try? is_checked_method.invoke()
  match result {
    Ok(Some(PyInteger(checked))) => checked.to_int64() != 0L
    _ => false
  }
}

pub fn QCheckBox::setGeometry(self : QCheckBox, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_check_box.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QCheckBox::setStyleSheet(self : QCheckBox, style_sheet: String) -> Unit {
  guard self.q_check_box.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QCheckBox::setEnabled(self : QCheckBox, enabled: Bool) -> Unit {
  guard self.q_check_box.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QCheckBox::setTristate(self : QCheckBox, tristate: Bool) -> Unit {
  guard self.q_check_box.get_attr("setTristate") is Some(PyCallable(set_tristate_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(tristate))
  let _ = try? set_tristate_method.invoke(args~)
}

pub fn QCheckBox::stateChanged(self : QCheckBox) -> PyCallable {
  guard self.q_check_box.get_attr("stateChanged") is Some(PyCallable(signal))
  signal
}

pub fn QCheckBox::toggled(self : QCheckBox) -> PyCallable {
  guard self.q_check_box.get_attr("toggled") is Some(PyCallable(signal))
  signal
} 