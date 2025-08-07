pub struct QLabel {
  priv q_label : PyObject
}

pub fn QLabel::new(text: String, window: QMainWindow) -> QLabel {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QLabel") is Some(PyCallable(q_label_class))

  let args = PyTuple::new(2)
  args..set(0, PyString::from(text))
  args..set(1, window.q_main_window)

  guard (try? q_label_class.invoke(args~)) is Ok(Some(PyClass(label)))
  QLabel::{ q_label: label }
}

pub fn QLabel::getPyObject(self : QLabel) -> PyObject {
  self.q_label
}

pub fn QLabel::move_to(self : QLabel, x: Int64, y: Int64) -> Unit {
  guard self.q_label.get_attr("move") is Some(PyCallable(move_method))
  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  let _ = try? move_method.invoke(args~)
}

pub fn QLabel::setStyleSheet(self : QLabel, style_sheet: String) -> Unit {
  guard self.q_label.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QLabel::setGeometry(self : QLabel, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_label.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}


pub fn QLabel::setPixmap(self : QLabel, pixmap: QPixmap) -> Unit {
  guard self.q_label.get_attr("setPixmap") is Some(PyCallable(set_pixmap_method))
  let args = PyTuple::new(1)
  args..set(0, pixmap.q_pixmap)
  let _ = try? set_pixmap_method.invoke(args~)
}

pub fn QLabel::setText(self : QLabel, text: String) -> Unit {
  guard self.q_label.get_attr("setText") is Some(PyCallable(set_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_text_method.invoke(args~)
}

pub fn QLabel::getText(self : QLabel) -> String {
  guard self.q_label.get_attr("text") is Some(PyCallable(get_text_method))
  let result = try? get_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QLabel::setAlignment(self : QLabel, alignment: Int64) -> Unit {
  guard self.q_label.get_attr("setAlignment") is Some(PyCallable(set_alignment_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(alignment))
  let _ = try? set_alignment_method.invoke(args~)
}

pub fn QLabel::setWordWrap(self : QLabel, wrap: Bool) -> Unit {
  guard self.q_label.get_attr("setWordWrap") is Some(PyCallable(set_word_wrap_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if wrap { 1L } else { 0L }))
  let _ = try? set_word_wrap_method.invoke(args~)
}

pub fn QLabel::toQWidget(self : QLabel) -> QWidget {
  QWidget::{ q_widget: self.q_label }
}