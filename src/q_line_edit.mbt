pub struct QLineEdit {
  priv q_line_edit : PyObject
}

pub fn QLineEdit::new(window: QMainWindow) -> QLineEdit {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QLineEdit") is Some(PyCallable(q_line_edit_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_line_edit_class.invoke(args~)) is Ok(Some(PyClass(line_edit)))
  QLineEdit::{ q_line_edit: line_edit }
}

pub fn QLineEdit::new_with_text(text: String, window: QMainWindow) -> QLineEdit {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QLineEdit") is Some(PyCallable(q_line_edit_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_line_edit_class.invoke(args~)) is Ok(Some(PyClass(line_edit)))
  QLineEdit::{ q_line_edit: line_edit }
}

pub fn QLineEdit::setText(self : QLineEdit, text: String) -> Unit {
  guard self.q_line_edit.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QLineEdit::getText(self : QLineEdit) -> String {
  guard self.q_line_edit.get_attr("text") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QLineEdit::setPlaceholderText(self : QLineEdit, placeholder: String) -> Unit {
  guard self.q_line_edit.get_attr("setPlaceholderText") is Some(PyCallable(set_placeholder_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(placeholder))
  let _ = try? set_placeholder_method.invoke(args~)
}

pub fn QLineEdit::setGeometry(self : QLineEdit, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_line_edit.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QLineEdit::setStyleSheet(self : QLineEdit, style_sheet: String) -> Unit {
  guard self.q_line_edit.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QLineEdit::setEnabled(self : QLineEdit, enabled: Bool) -> Unit {
  guard self.q_line_edit.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QLineEdit::setReadOnly(self : QLineEdit, read_only: Bool) -> Unit {
  guard self.q_line_edit.get_attr("setReadOnly") is Some(PyCallable(set_read_only_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(read_only))
  let _ = try? set_read_only_method.invoke(args~)
}

pub fn QLineEdit::textChanged(self : QLineEdit) -> PyCallable {
  guard self.q_line_edit.get_attr("textChanged") is Some(PyCallable(signal))
  signal
}

pub fn QLineEdit::returnPressed(self : QLineEdit) -> PyCallable {
  guard self.q_line_edit.get_attr("returnPressed") is Some(PyCallable(signal))
  signal
} 