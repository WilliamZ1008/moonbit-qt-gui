pub struct Demo {
  priv demo : PyModule
}

///|
pub fn Demo::new() -> Demo {
  guard @python.pyimport("moonbit_gui_demo.run") is Some(demo)
  Demo::{ demo, }
}


pub fn Demo::demoRun(self : Demo) -> Unit {
  guard self.demo.get_attr("run_demo") is Some(PyCallable(run_demo))
  let _ = try? run_demo.invoke()
}
