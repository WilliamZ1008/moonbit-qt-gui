pub struct QTabWidget {
  priv q_tab_widget : PyObject
}

pub fn QTabWidget::new(window: QMainWindow) -> QTabWidget {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QTabWidget") is Some(PyCallable(q_tab_widget_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_tab_widget_class.invoke(args~)) is Ok(Some(PyClass(tab_widget)))
  QTabWidget::{ q_tab_widget: tab_widget }
}

pub fn QTabWidget::addTab(self : QTabWidget, widget: QWidget, text: String) -> Int64 {
  guard self.q_tab_widget.get_attr("addTab") is Some(PyCallable(add_tab_method))
  let args = PyTuple::new(2)
  args..set(0, widget.q_widget)
  args..set(1, PyString::from(text))
  let result = try? add_tab_method.invoke(args~)
  match result {
    Ok(Some(PyInteger(index))) => index.to_int64()
    _ => -1L
  }
}

pub fn QTabWidget::insertTab(self : QTabWidget, index: Int64, widget: QWidget, text: String) -> Int64 {
  guard self.q_tab_widget.get_attr("insertTab") is Some(PyCallable(insert_tab_method))
  let args = PyTuple::new(3)
  args..set(0, PyInteger::from(index))
  args..set(1, widget.q_widget)
  args..set(2, PyString::from(text))
  let result = try? insert_tab_method.invoke(args~)
  match result {
    Ok(Some(PyInteger(new_index))) => new_index.to_int64()
    _ => -1L
  }
}

pub fn QTabWidget::removeTab(self : QTabWidget, index: Int64) -> Unit {
  guard self.q_tab_widget.get_attr("removeTab") is Some(PyCallable(remove_tab_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(index))
  let _ = try? remove_tab_method.invoke(args~)
}

pub fn QTabWidget::setCurrentIndex(self : QTabWidget, index: Int64) -> Unit {
  guard self.q_tab_widget.get_attr("setCurrentIndex") is Some(PyCallable(set_current_index_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(index))
  let _ = try? set_current_index_method.invoke(args~)
}

pub fn QTabWidget::getCurrentIndex(self : QTabWidget) -> Int64 {
  guard self.q_tab_widget.get_attr("currentIndex") is Some(PyCallable(get_current_index_method))
  let result = try? get_current_index_method.invoke()
  match result {
    Ok(Some(PyInteger(index))) => index.to_int64()
    _ => -1L
  }
}

pub fn QTabWidget::setTabText(self : QTabWidget, index: Int64, text: String) -> Unit {
  guard self.q_tab_widget.get_attr("setTabText") is Some(PyCallable(set_tab_text_method))
  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(index))
  args..set(1, PyString::from(text))
  let _ = try? set_tab_text_method.invoke(args~)
}

pub fn QTabWidget::getTabText(self : QTabWidget, index: Int64) -> String {
  guard self.q_tab_widget.get_attr("tabText") is Some(PyCallable(get_tab_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(index))
  let result = try? get_tab_text_method.invoke(args~)
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QTabWidget::count(self : QTabWidget) -> Int64 {
  guard self.q_tab_widget.get_attr("count") is Some(PyCallable(count_method))
  let result = try? count_method.invoke()
  match result {
    Ok(Some(PyInteger(count))) => count.to_int64()
    _ => 0L
  }
}

pub fn QTabWidget::setGeometry(self : QTabWidget, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_tab_widget.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QTabWidget::setStyleSheet(self : QTabWidget, style_sheet: String) -> Unit {
  guard self.q_tab_widget.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QTabWidget::setEnabled(self : QTabWidget, enabled: Bool) -> Unit {
  guard self.q_tab_widget.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QTabWidget::currentChanged(self : QTabWidget) -> PyCallable {
  guard self.q_tab_widget.get_attr("currentChanged") is Some(PyCallable(signal))
  signal
}

pub fn QTabWidget::tabCloseRequested(self : QTabWidget) -> PyCallable {
  guard self.q_tab_widget.get_attr("tabCloseRequested") is Some(PyCallable(signal))
  signal
} 