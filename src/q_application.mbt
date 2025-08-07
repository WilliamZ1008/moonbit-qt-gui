///|
typealias @python.(PyObject, PyModule, PyString, PyTuple, PyInteger, PyList, PyBool, PyCallable, PyDict)

pub struct QApplication {
  priv q_application : PyObject
}


pub fn QApplication::new(argv: PyList) -> QApplication {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)

  guard qtwidgets_module.get_attr("QApplication") is Some(PyCallable(qapplication))
  
  let args = PyTuple::new(1)
  args..set(0, argv)

  guard (try? qapplication.invoke(args~)) is Ok(Some(PyClass(app)))
  QApplication::{ q_application: app }
}

///| setApplicationName
pub fn QApplication::setApplicationName(self : QApplication, name: String) -> Unit {
  guard self.q_application.get_attr("setApplicationName") is Some(PyCallable(setApplicationName))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(name))
  let _ = try? setApplicationName.invoke(args~)
}

///| setApplicationVersion
pub fn QApplication::setApplicationVersion(self : QApplication, version: String) -> Unit {
  guard self.q_application.get_attr("setApplicationVersion") is Some(PyCallable(setApplicationVersion))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(version))
  let _ = try? setApplicationVersion.invoke(args~)
}

///|setOrganizationName
pub fn QApplication::setOrganizationName(self : QApplication, name: String) -> Unit {
  guard self.q_application.get_attr("setOrganizationName") is Some(PyCallable(setOrganizationName))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(name))
  let _ = try? setOrganizationName.invoke(args~)
}


///| exec
pub fn QApplication::exec(self : QApplication) -> Int64 {
  guard self.q_application.get_attr("exec") is Some(PyCallable(exec))
  let result = try? exec.invoke()
  match result {
    Ok(Some(PyInteger(code))) => code.to_int64()
    Ok(_) => {
      println("Error: exec did not return an integer")
      -1
    }
    Err(_) => {
      println("Error: exec call failed")
      -1
    }
  }
}
