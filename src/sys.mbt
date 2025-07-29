pub struct Sys {
  priv sys : PyModule
}

///|
pub fn Sys::new() -> Sys {
  guard @python.pyimport("sys") is Some(sys)
  Sys::{ sys, }
}

///| getVersion
pub fn Sys::getVersion(self : Sys) -> String {
  guard self.sys.get_attr("version") is Some(PyString(version))
  return version.to_string()
}

///| exit
pub fn Sys::exit(self : Sys, code : Int64) -> Unit {
  guard self.sys.get_attr("exit") is Some(PyCallable(exit))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(code))
  let _ = try? exit.invoke(args~)
}

///| argv
pub fn Sys::argv(self : Sys) -> PyList {
  guard self.sys.get_attr("argv") is Some(PyList(argv))
  return argv
}