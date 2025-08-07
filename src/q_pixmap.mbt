pub struct QPixmap{
  priv q_pixmap : PyObject
}

pub fn QPixmap::new(file_path: String) -> QPixmap {
  guard @python.pyimport("PySide6.QtGui") is Some(qtgui_module)
  guard qtgui_module.get_attr("QPixmap") is Some(PyCallable(q_pixmap_class))

  let args = PyTuple::new(1)
  args..set(0, PyString::from(file_path))

  guard (try? q_pixmap_class.invoke(args~)) is Ok(Some(PyClass(pixmap)))
  QPixmap::{ q_pixmap: pixmap }
}

pub fn QPixmap::scaled(self: QPixmap, width: Int64, height: Int64) -> QPixmap {
  guard self.q_pixmap.get_attr("scaled") is Some(PyCallable(scaled_method))
  let args = PyTuple::new(2)
  args..set(0, PyInteger::from(width))
  args..set(1, PyInteger::from(height))
  
  guard (try? scaled_method.invoke(args~)) is Ok(Some(PyClass(scaled_pixmap)))
  QPixmap::{ q_pixmap: scaled_pixmap }
}