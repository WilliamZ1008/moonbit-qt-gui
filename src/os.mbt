pub struct PyOS{
  priv os : PyModule
}

pub fn PyOS::new() -> PyOS {
  guard @python.pyimport("os") is Some(os_module)
  PyOS::{ os: os_module }
}

pub fn PyOS::getcwd(self : PyOS) -> String {
  guard self.os.get_attr("getcwd") is Some(PyCallable(getcwd))
  guard (try? getcwd.invoke()) is Ok(Some(PyString(cwd)))
  return cwd.to_string()
}