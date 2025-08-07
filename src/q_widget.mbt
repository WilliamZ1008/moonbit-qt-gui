pub struct QWidget {
  priv q_widget : PyObject
}

pub fn QWidget::new(window: QMainWindow) -> QWidget {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QWidget") is Some(PyCallable(q_widget_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_widget_class.invoke(args~)) is Ok(Some(PyClass(widget)))
  QWidget::{ q_widget: widget }
}

pub fn QWidget::setGeometry(self : QWidget, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_widget.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QWidget::setStyleSheet(self : QWidget, style_sheet: String) -> Unit {
  guard self.q_widget.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QWidget::setEnabled(self : QWidget, enabled: Bool) -> Unit {
  guard self.q_widget.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QWidget::show(self : QWidget) -> Unit {
  guard self.q_widget.get_attr("show") is Some(PyCallable(show_method))
  let _ = try? show_method.invoke()
}

pub fn QWidget::hide(self : QWidget) -> Unit {
  guard self.q_widget.get_attr("hide") is Some(PyCallable(hide_method))
  let _ = try? hide_method.invoke()
}

pub fn QWidget::setVisible(self : QWidget, visible: Bool) -> Unit {
  guard self.q_widget.get_attr("setVisible") is Some(PyCallable(set_visible_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(visible))
  let _ = try? set_visible_method.invoke(args~)
}

pub fn QWidget::isVisible(self : QWidget) -> Bool {
  guard self.q_widget.get_attr("isVisible") is Some(PyCallable(is_visible_method))
  let result = try? is_visible_method.invoke()
  match result {
    Ok(Some(PyInteger(visible))) => visible.to_int64() != 0L
    _ => false
  }
} 