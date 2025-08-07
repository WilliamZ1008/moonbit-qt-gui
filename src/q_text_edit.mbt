pub struct QTextEdit {
  priv q_text_edit : PyObject
}

pub fn QTextEdit::new(window: QMainWindow) -> QTextEdit {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QTextEdit") is Some(PyCallable(q_text_edit_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_text_edit_class.invoke(args~)) is Ok(Some(PyClass(text_edit)))
  QTextEdit::{ q_text_edit: text_edit }
}

pub fn QTextEdit::new_with_text(text: String, window: QMainWindow) -> QTextEdit {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QTextEdit") is Some(PyCallable(q_text_edit_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_text_edit_class.invoke(args~)) is Ok(Some(PyClass(text_edit)))
  QTextEdit::{ q_text_edit: text_edit }
}

pub fn QTextEdit::setText(self : QTextEdit, text: String) -> Unit {
  guard self.q_text_edit.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QTextEdit::getText(self : QTextEdit) -> String {
  guard self.q_text_edit.get_attr("toPlainText") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QTextEdit::setHtml(self : QTextEdit, html: String) -> Unit {
  guard self.q_text_edit.get_attr("setHtml") is Some(PyCallable(set_html_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(html))
  let _ = try? set_html_method.invoke(args~)
}

pub fn QTextEdit::getHtml(self : QTextEdit) -> String {
  guard self.q_text_edit.get_attr("toHtml") is Some(PyCallable(get_html_method))
  let result = try? get_html_method.invoke()
  match result {
    Ok(Some(PyString(html))) => html.to_string()
    _ => "".to_string()
  }
}

pub fn QTextEdit::setGeometry(self : QTextEdit, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_text_edit.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QTextEdit::setStyleSheet(self : QTextEdit, style_sheet: String) -> Unit {
  guard self.q_text_edit.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QTextEdit::setEnabled(self : QTextEdit, enabled: Bool) -> Unit {
  guard self.q_text_edit.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QTextEdit::setReadOnly(self : QTextEdit, read_only: Bool) -> Unit {
  guard self.q_text_edit.get_attr("setReadOnly") is Some(PyCallable(set_read_only_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(read_only))
  let _ = try? set_read_only_method.invoke(args~)
}

pub fn QTextEdit::append(self : QTextEdit, text: String) -> Unit {
  guard self.q_text_edit.get_attr("append") is Some(PyCallable(append_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? append_method.invoke(args~)
}

pub fn QTextEdit::clear(self : QTextEdit) -> Unit {
  guard self.q_text_edit.get_attr("clear") is Some(PyCallable(clear_method))
  let _ = try? clear_method.invoke()
}

pub fn QTextEdit::textChanged(self : QTextEdit) -> PyCallable {
  guard self.q_text_edit.get_attr("textChanged") is Some(PyCallable(signal))
  signal
} 