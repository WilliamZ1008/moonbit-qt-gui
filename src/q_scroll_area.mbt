pub struct QScrollArea {
  priv q_scroll_area : PyObject
}

pub fn QScrollArea::new(window: QMainWindow) -> QScrollArea {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QScrollArea") is Some(PyCallable(q_scroll_area_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_scroll_area_class.invoke(args~)) is Ok(Some(PyClass(scroll_area)))
  QScrollArea::{ q_scroll_area: scroll_area }
}

pub fn QScrollArea::setWidget(self : QScrollArea, widget: QWidget) -> Unit {
  guard self.q_scroll_area.get_attr("setWidget") is Some(PyCallable(set_widget_method))
  let args = PyTuple::new(1)
  args..set(0, widget.q_widget)
  let _ = try? set_widget_method.invoke(args~)
}

pub fn QScrollArea::setWidgetResizable(self : QScrollArea, resizable: Bool) -> Unit {
  guard self.q_scroll_area.get_attr("setWidgetResizable") is Some(PyCallable(set_widget_resizable_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(resizable))
  let _ = try? set_widget_resizable_method.invoke(args~)
}

pub fn QScrollArea::setGeometry(self : QScrollArea, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_scroll_area.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QScrollArea::setStyleSheet(self : QScrollArea, style_sheet: String) -> Unit {
  guard self.q_scroll_area.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QScrollArea::setEnabled(self : QScrollArea, enabled: Bool) -> Unit {
  guard self.q_scroll_area.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
} 