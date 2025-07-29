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