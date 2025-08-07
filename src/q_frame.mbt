pub struct QFrame {
  priv q_frame : PyObject
}

pub fn QFrame::new(window: QMainWindow) -> QFrame {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QFrame") is Some(PyCallable(q_frame_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_frame_class.invoke(args~)) is Ok(Some(PyClass(frame)))
  QFrame::{ q_frame: frame }
}

pub fn QFrame::setFixedHeight(self : QFrame, height: Int64) -> Unit {
  guard self.q_frame.get_attr("setFixedHeight") is Some(PyCallable(set_fixed_height_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(height))
  let _ = try? set_fixed_height_method.invoke(args~)
}

pub fn QFrame::setFixedWidth(self : QFrame, width: Int64) -> Unit {
  guard self.q_frame.get_attr("setFixedWidth") is Some(PyCallable(set_fixed_width_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(width))
  let _ = try? set_fixed_width_method.invoke(args~)
}

pub fn QFrame::setGeometry(self : QFrame, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_frame.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QFrame::setStyleSheet(self : QFrame, style_sheet: String) -> Unit {
  guard self.q_frame.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QFrame::setEnabled(self : QFrame, enabled: Bool) -> Unit {
  guard self.q_frame.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QFrame::toQWidget(self : QFrame) -> QWidget {
  QWidget::{ q_widget: self.q_frame }
} 