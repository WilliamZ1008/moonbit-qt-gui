pub struct QSlider {
  priv q_slider : PyObject
}

pub fn QSlider::new(window: QMainWindow) -> QSlider {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QSlider") is Some(PyCallable(q_slider_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_slider_class.invoke(args~)) is Ok(Some(PyClass(slider)))
  QSlider::{ q_slider: slider }
}

pub fn QSlider::new_horizontal(window: QMainWindow) -> QSlider {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QSlider") is Some(PyCallable(q_slider_class))

  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(1))  // Qt.Horizontal = 1
  args..set(1, window.q_main_window)

  guard (try? q_slider_class.invoke(args~)) is Ok(Some(PyClass(slider)))
  QSlider::{ q_slider: slider }
}

pub fn QSlider::new_vertical(window: QMainWindow) -> QSlider {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QSlider") is Some(PyCallable(q_slider_class))

  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(2))  // Qt.Vertical = 2
  args..set(1, window.q_main_window)

  guard (try? q_slider_class.invoke(args~)) is Ok(Some(PyClass(slider)))
  QSlider::{ q_slider: slider }
}

pub fn QSlider::setRange(self : QSlider, minimum: Int64, maximum: Int64) -> Unit {
  guard self.q_slider.get_attr("setRange") is Some(PyCallable(set_range_method))
  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(minimum))
  args..set(1, PyInteger::from(maximum))
  let _ = try? set_range_method.invoke(args~)
}

pub fn QSlider::setValue(self : QSlider, value: Int64) -> Unit {
  guard self.q_slider.get_attr("setValue") is Some(PyCallable(set_value_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(value))
  let _ = try? set_value_method.invoke(args~)
}

pub fn QSlider::getValue(self : QSlider) -> Int64 {
  guard self.q_slider.get_attr("value") is Some(PyCallable(get_value_method))
  let result = try? get_value_method.invoke()
  match result {
    Ok(Some(PyInteger(value))) => value.to_int64()
    _ => 0L
  }
}

pub fn QSlider::setMinimum(self : QSlider, minimum: Int64) -> Unit {
  guard self.q_slider.get_attr("setMinimum") is Some(PyCallable(set_minimum_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(minimum))
  let _ = try? set_minimum_method.invoke(args~)
}

pub fn QSlider::setMaximum(self : QSlider, maximum: Int64) -> Unit {
  guard self.q_slider.get_attr("setMaximum") is Some(PyCallable(set_maximum_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(maximum))
  let _ = try? set_maximum_method.invoke(args~)
}

pub fn QSlider::getMinimum(self : QSlider) -> Int64 {
  guard self.q_slider.get_attr("minimum") is Some(PyCallable(get_minimum_method))
  let result = try? get_minimum_method.invoke()
  match result {
    Ok(Some(PyInteger(minimum))) => minimum.to_int64()
    _ => 0L
  }
}

pub fn QSlider::getMaximum(self : QSlider) -> Int64 {
  guard self.q_slider.get_attr("maximum") is Some(PyCallable(get_maximum_method))
  let result = try? get_maximum_method.invoke()
  match result {
    Ok(Some(PyInteger(maximum))) => maximum.to_int64()
    _ => 100L
  }
}

pub fn QSlider::setGeometry(self : QSlider, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_slider.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QSlider::setStyleSheet(self : QSlider, style_sheet: String) -> Unit {
  guard self.q_slider.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QSlider::setEnabled(self : QSlider, enabled: Bool) -> Unit {
  guard self.q_slider.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QSlider::setTickPosition(self : QSlider, position: Int64) -> Unit {
  guard self.q_slider.get_attr("setTickPosition") is Some(PyCallable(set_tick_position_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(position))
  let _ = try? set_tick_position_method.invoke(args~)
}

pub fn QSlider::setTickInterval(self : QSlider, interval: Int64) -> Unit {
  guard self.q_slider.get_attr("setTickInterval") is Some(PyCallable(set_tick_interval_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(interval))
  let _ = try? set_tick_interval_method.invoke(args~)
}

pub fn QSlider::valueChanged(self : QSlider) -> PyCallable {
  guard self.q_slider.get_attr("valueChanged") is Some(PyCallable(signal))
  signal
}

pub fn QSlider::sliderMoved(self : QSlider) -> PyCallable {
  guard self.q_slider.get_attr("sliderMoved") is Some(PyCallable(signal))
  signal
} 