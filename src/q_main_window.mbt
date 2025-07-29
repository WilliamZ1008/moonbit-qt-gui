pub struct QMainWindow {
  priv q_main_window : PyObject
}

///|
pub fn QMainWindow::new() -> QMainWindow {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QMainWindow") is Some(PyCallable(q_mainwindow))
  guard (try? q_mainwindow.invoke()) is Ok(Some(PyClass(window)))

  QMainWindow::{ q_main_window: window }
}

pub fn QMainWindow::set_geometry(self : QMainWindow, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_main_window.get_attr("setGeometry") is Some(PyCallable(set_geometry))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry.invoke(args~)
}


///| show
pub fn QMainWindow::show(self : QMainWindow) -> Unit {
  guard self.q_main_window.get_attr("show") is Some(PyCallable(show))
  let _ = try? show.invoke()
}
