pub struct QVBoxLayout {
  priv q_vbox_layout : PyObject
}

pub fn QVBoxLayout::new() -> QVBoxLayout {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QVBoxLayout") is Some(PyCallable(q_vbox_layout_class))

  guard (try? q_vbox_layout_class.invoke()) is Ok(Some(PyClass(vbox_layout)))
  QVBoxLayout::{ q_vbox_layout: vbox_layout }
}

pub fn QVBoxLayout::new_with_widget(widget: QWidget) -> QVBoxLayout {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QVBoxLayout") is Some(PyCallable(q_vbox_layout_class))

  let args = PyTuple::new(1)
  args..set(0, widget.q_widget)

  guard (try? q_vbox_layout_class.invoke(args~)) is Ok(Some(PyClass(vbox_layout)))
  QVBoxLayout::{ q_vbox_layout: vbox_layout }
}

pub fn QVBoxLayout::addWidget(self : QVBoxLayout, widget: QWidget) -> Unit {
  guard self.q_vbox_layout.get_attr("addWidget") is Some(PyCallable(add_widget_method))
  let args = PyTuple::new(1)
  args..set(0, widget.q_widget)
  let _ = try? add_widget_method.invoke(args~)
}

pub fn QVBoxLayout::addLayout(self : QVBoxLayout, layout: QHBoxLayout) -> Unit {
  guard self.q_vbox_layout.get_attr("addLayout") is Some(PyCallable(add_layout_method))
  let args = PyTuple::new(1)
  args..set(0, layout.q_hbox_layout)
  let _ = try? add_layout_method.invoke(args~)
}

pub fn QVBoxLayout::addStretch(self : QVBoxLayout) -> Unit {
  guard self.q_vbox_layout.get_attr("addStretch") is Some(PyCallable(add_stretch_method))
  let _ = try? add_stretch_method.invoke()
}

pub fn QVBoxLayout::addStretch_with_stretch(self : QVBoxLayout, stretch: Int64) -> Unit {
  guard self.q_vbox_layout.get_attr("addStretch") is Some(PyCallable(add_stretch_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(stretch))
  let _ = try? add_stretch_method.invoke(args~)
}

pub fn QVBoxLayout::setSpacing(self : QVBoxLayout, spacing: Int64) -> Unit {
  guard self.q_vbox_layout.get_attr("setSpacing") is Some(PyCallable(set_spacing_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(spacing))
  let _ = try? set_spacing_method.invoke(args~)
}

pub fn QVBoxLayout::setContentsMargins(self : QVBoxLayout, left: Int64, top: Int64, right: Int64, bottom: Int64) -> Unit {
  guard self.q_vbox_layout.get_attr("setContentsMargins") is Some(PyCallable(set_contents_margins_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(left))
  args..set(1, PyInteger::from(top))
  args..set(2, PyInteger::from(right))
  args..set(3, PyInteger::from(bottom))
  let _ = try? set_contents_margins_method.invoke(args~)
} 