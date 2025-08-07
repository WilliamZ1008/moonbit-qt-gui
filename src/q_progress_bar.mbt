pub struct QProgressBar {
  priv q_progress_bar : PyObject
}

pub fn QProgressBar::new(window: QMainWindow) -> QProgressBar {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QProgressBar") is Some(PyCallable(q_progress_bar_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_progress_bar_class.invoke(args~)) is Ok(Some(PyClass(progress_bar)))
  QProgressBar::{ q_progress_bar: progress_bar }
}

pub fn QProgressBar::setRange(self : QProgressBar, minimum: Int64, maximum: Int64) -> Unit {
  guard self.q_progress_bar.get_attr("setRange") is Some(PyCallable(set_range_method))
  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(minimum))
  args..set(1, PyInteger::from(maximum))
  let _ = try? set_range_method.invoke(args~)
}

pub fn QProgressBar::setValue(self : QProgressBar, value: Int64) -> Unit {
  guard self.q_progress_bar.get_attr("setValue") is Some(PyCallable(set_value_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(value))
  let _ = try? set_value_method.invoke(args~)
}

pub fn QProgressBar::getValue(self : QProgressBar) -> Int64 {
  guard self.q_progress_bar.get_attr("value") is Some(PyCallable(get_value_method))
  let result = try? get_value_method.invoke()
  match result {
    Ok(Some(PyInteger(value))) => value.to_int64()
    _ => 0L
  }
}

pub fn QProgressBar::setMinimum(self : QProgressBar, minimum: Int64) -> Unit {
  guard self.q_progress_bar.get_attr("setMinimum") is Some(PyCallable(set_minimum_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(minimum))
  let _ = try? set_minimum_method.invoke(args~)
}

pub fn QProgressBar::setMaximum(self : QProgressBar, maximum: Int64) -> Unit {
  guard self.q_progress_bar.get_attr("setMaximum") is Some(PyCallable(set_maximum_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(maximum))
  let _ = try? set_maximum_method.invoke(args~)
}

pub fn QProgressBar::getMinimum(self : QProgressBar) -> Int64 {
  guard self.q_progress_bar.get_attr("minimum") is Some(PyCallable(get_minimum_method))
  let result = try? get_minimum_method.invoke()
  match result {
    Ok(Some(PyInteger(minimum))) => minimum.to_int64()
    _ => 0L
  }
}

pub fn QProgressBar::getMaximum(self : QProgressBar) -> Int64 {
  guard self.q_progress_bar.get_attr("maximum") is Some(PyCallable(get_maximum_method))
  let result = try? get_maximum_method.invoke()
  match result {
    Ok(Some(PyInteger(maximum))) => maximum.to_int64()
    _ => 100L
  }
}

pub fn QProgressBar::setFormat(self : QProgressBar, format: String) -> Unit {
  guard self.q_progress_bar.get_attr("setFormat") is Some(PyCallable(set_format_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(format))
  let _ = try? set_format_method.invoke(args~)
}

pub fn QProgressBar::setTextVisible(self : QProgressBar, visible: Bool) -> Unit {
  guard self.q_progress_bar.get_attr("setTextVisible") is Some(PyCallable(set_text_visible_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(visible))
  let _ = try? set_text_visible_method.invoke(args~)
}

pub fn QProgressBar::setGeometry(self : QProgressBar, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_progress_bar.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QProgressBar::setStyleSheet(self : QProgressBar, style_sheet: String) -> Unit {
  guard self.q_progress_bar.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QProgressBar::setEnabled(self : QProgressBar, enabled: Bool) -> Unit {
  guard self.q_progress_bar.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QProgressBar::reset(self : QProgressBar) -> Unit {
  guard self.q_progress_bar.get_attr("reset") is Some(PyCallable(reset_method))
  let _ = try? reset_method.invoke()
}

pub fn QProgressBar::valueChanged(self : QProgressBar) -> PyCallable {
  guard self.q_progress_bar.get_attr("valueChanged") is Some(PyCallable(signal))
  signal
} 