///|
typealias @python.(PyModule, PyObject, PyTuple, PyDict, PyString)

pub struct Demo {
  priv demo : PyModule
}

///|
pub type! DemoError {
  LoadDemoError
} derive(Show)


///|
fn new() -> Demo!Error {
  guard @python.pyimport("moonbit_gui_demo.run") is Some(demo) else {
    raise LoadDemoError
  }
  Demo::{ demo, }
}

///|
pub fn Demo::run_demo(self : Demo) -> Unit {
  guard self.demo.get_attr("run_demo") is Some(PyCallable(run_demo))
  let _ = run_demo.invoke?()

}