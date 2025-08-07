pub struct QHBoxLayout {
  priv q_hbox_layout : PyObject
}

pub fn QHBoxLayout::new() -> QHBoxLayout {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QHBoxLayout") is Some(PyCallable(q_hbox_layout_class))

  guard (try? q_hbox_layout_class.invoke()) is Ok(Some(PyClass(hbox_layout)))
  QHBoxLayout::{ q_hbox_layout: hbox_layout }
}

pub fn QHBoxLayout::new_with_widget(widget: QWidget) -> QHBoxLayout {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QHBoxLayout") is Some(PyCallable(q_hbox_layout_class))

  let args = PyTuple::new(1)
  args..set(0, widget.q_widget)

  guard (try? q_hbox_layout_class.invoke(args~)) is Ok(Some(PyClass(hbox_layout)))
  QHBoxLayout::{ q_hbox_layout: hbox_layout }
}

pub fn QHBoxLayout::addWidget(self : QHBoxLayout, widget: QWidget) -> Unit {
  guard self.q_hbox_layout.get_attr("addWidget") is Some(PyCallable(add_widget_method))
  let args = PyTuple::new(1)
  args..set(0, widget.q_widget)
  let _ = try? add_widget_method.invoke(args~)
}

pub fn QHBoxLayout::addLayout(self : QHBoxLayout, layout: QVBoxLayout) -> Unit {
  guard self.q_hbox_layout.get_attr("addLayout") is Some(PyCallable(add_layout_method))
  let args = PyTuple::new(1)
  args..set(0, layout.q_vbox_layout)
  let _ = try? add_layout_method.invoke(args~)
}

pub fn QHBoxLayout::addStretch(self : QHBoxLayout) -> Unit {
  guard self.q_hbox_layout.get_attr("addStretch") is Some(PyCallable(add_stretch_method))
  let _ = try? add_stretch_method.invoke()
}

pub fn QHBoxLayout::addStretch_with_stretch(self : QHBoxLayout, stretch: Int64) -> Unit {
  guard self.q_hbox_layout.get_attr("addStretch") is Some(PyCallable(add_stretch_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(stretch))
  let _ = try? add_stretch_method.invoke(args~)
}

pub fn QHBoxLayout::setSpacing(self : QHBoxLayout, spacing: Int64) -> Unit {
  guard self.q_hbox_layout.get_attr("setSpacing") is Some(PyCallable(set_spacing_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(spacing))
  let _ = try? set_spacing_method.invoke(args~)
}

pub fn QHBoxLayout::setContentsMargins(self : QHBoxLayout, left: Int64, top: Int64, right: Int64, bottom: Int64) -> Unit {
  guard self.q_hbox_layout.get_attr("setContentsMargins") is Some(PyCallable(set_contents_margins_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(left))
  args..set(1, PyInteger::from(top))
  args..set(2, PyInteger::from(right))
  args..set(3, PyInteger::from(bottom))
  let _ = try? set_contents_margins_method.invoke(args~)
} 