pub struct QComboBox {
  priv q_combo_box : PyObject
}

pub fn QComboBox::new(window: QMainWindow) -> QComboBox {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QComboBox") is Some(PyCallable(q_combo_box_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_combo_box_class.invoke(args~)) is Ok(Some(PyClass(combo_box)))
  QComboBox::{ q_combo_box: combo_box }
}

pub fn QComboBox::addItem(self : QComboBox, text: String) -> Unit {
  guard self.q_combo_box.get_attr("addItem") is Some(PyCallable(add_item_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? add_item_method.invoke(args~)
}

pub fn QComboBox::addItems(self : QComboBox, texts: Array[String]) -> Unit {
  guard self.q_combo_box.get_attr("addItems") is Some(PyCallable(add_items_method))
  // let py_texts = PyList::from(texts.map(PyString::from))
  let py_texts = PyList::new()
  for text in texts {
    py_texts.append(PyString::from(text))
  }
  let args = PyTuple::new(1)
  args..set(0, py_texts)
  let _ = try? add_items_method.invoke(args~)
}

pub fn QComboBox::setCurrentIndex(self : QComboBox, index: Int64) -> Unit {
  guard self.q_combo_box.get_attr("setCurrentIndex") is Some(PyCallable(set_current_index_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(index))
  let _ = try? set_current_index_method.invoke(args~)
}

pub fn QComboBox::getCurrentIndex(self : QComboBox) -> Int64 {
  guard self.q_combo_box.get_attr("currentIndex") is Some(PyCallable(get_current_index_method))
  let result = try? get_current_index_method.invoke()
  match result {
    Ok(Some(PyInteger(index))) => index.to_int64()
    _ => -1L
  }
}

pub fn QComboBox::getCurrentText(self : QComboBox) -> String {
  guard self.q_combo_box.get_attr("currentText") is Some(PyCallable(get_current_text_method))
  let result = try? get_current_text_method.invoke()
  match result {
    Ok(Some(PyString(text))) => text.to_string()
    _ => "".to_string()
  }
}

pub fn QComboBox::setCurrentText(self : QComboBox, text: String) -> Unit {
  guard self.q_combo_box.get_attr("setCurrentText") is Some(PyCallable(set_current_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_current_text_method.invoke(args~)
}

pub fn QComboBox::clear(self : QComboBox) -> Unit {
  guard self.q_combo_box.get_attr("clear") is Some(PyCallable(clear_method))
  let _ = try? clear_method.invoke()
}

pub fn QComboBox::count(self : QComboBox) -> Int64 {
  guard self.q_combo_box.get_attr("count") is Some(PyCallable(count_method))
  let result = try? count_method.invoke()
  match result {
    Ok(Some(PyInteger(count))) => count.to_int64()
    _ => 0L
  }
}

pub fn QComboBox::setGeometry(self : QComboBox, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_combo_box.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QComboBox::setStyleSheet(self : QComboBox, style_sheet: String) -> Unit {
  guard self.q_combo_box.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QComboBox::setEnabled(self : QComboBox, enabled: Bool) -> Unit {
  guard self.q_combo_box.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QComboBox::currentIndexChanged(self : QComboBox) -> PyCallable {
  guard self.q_combo_box.get_attr("currentIndexChanged") is Some(PyCallable(signal))
  signal
}

pub fn QComboBox::currentTextChanged(self : QComboBox) -> PyCallable {
  guard self.q_combo_box.get_attr("currentTextChanged") is Some(PyCallable(signal))
  signal
} 