pub struct SignalSlotManager {
  q_manager: PyObject
}

pub fn SignalSlotManager::new() -> SignalSlotManager {
  guard @python.pyimport("signal_slot_manager") is Some(signal_module)
  guard signal_module.get_attr("SignalSlotManager") is Some(PyCallable(manager_class))
  guard (try? manager_class.invoke()) is Ok(Some(PyClass(manager)))
  SignalSlotManager::{ q_manager: manager }
}

pub fn connect_button_to_label(self: SignalSlotManager, button: QPushButton, label: QLabel, text: String) -> Unit {
  guard self.q_manager.get_attr("connect_button_to_label") is Some(PyCallable(connect_func))
  let args = PyTuple::new(3)
  args..set(0, button.getPyObject())
  args..set(1, label.getPyObject())
  args..set(2, PyString::from(text))
  let _ = try? connect_func.invoke(args~)
}

pub fn connect_button_to_increment_label(self: SignalSlotManager, button: QPushButton, label: QLabel, prefix: String, suffix: String, initial_value~ : Int64 = 0) -> Unit {
  guard self.q_manager.get_attr("connect_button_to_increment_label") is Some(PyCallable(connect_func))
  let args = PyTuple::new(5)
  args..set(0, button.getPyObject())
  args..set(1, label.getPyObject())
  args..set(2, PyString::from(prefix))
  args..set(3, PyString::from(suffix))
  args..set(4, PyInteger::from(initial_value))
  let _ = try? connect_func.invoke(args~)
}
