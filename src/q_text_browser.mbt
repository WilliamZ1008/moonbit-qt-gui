pub struct QTextBrowser {
  priv q_text_browser : PyObject
}

pub fn QTextBrowser::new(window: QMainWindow) -> QTextBrowser {
  guard @python.pyimport("PySide6.QtWidgets") is Some(qtwidgets_module)
  guard qtwidgets_module.get_attr("QTextBrowser") is Some(PyCallable(q_text_browser_class))

  let args = PyTuple::new(1)
  args..set(0, window.q_main_window)

  guard (try? q_text_browser_class.invoke(args~)) is Ok(Some(PyClass(text_browser)))
  QTextBrowser::{ q_text_browser: text_browser }
}

pub fn QTextBrowser::setHtml(self : QTextBrowser, html: String) -> Unit {
  guard self.q_text_browser.get_attr("setHtml") is Some(PyCallable(set_html_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(html))
  let _ = try? set_html_method.invoke(args~)
}

pub fn QTextBrowser::setPlainText(self : QTextBrowser, text: String) -> Unit {
  guard self.q_text_browser.get_attr("setPlainText") is Some(PyCallable(set_plain_text_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(text))
  let _ = try? set_plain_text_method.invoke(args~)
}

pub fn QTextBrowser::setOpenExternalLinks(self : QTextBrowser, open: Bool) -> Unit {
  guard self.q_text_browser.get_attr("setOpenExternalLinks") is Some(PyCallable(set_open_external_links_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(open))
  let _ = try? set_open_external_links_method.invoke(args~)
}

pub fn QTextBrowser::setGeometry(self : QTextBrowser, x: Int64, y: Int64, width: Int64, height: Int64) -> Unit {
  guard self.q_text_browser.get_attr("setGeometry") is Some(PyCallable(set_geometry_method))
  let args = PyTuple::new(4)
  args..set(0, PyInteger::from(x))
  args..set(1, PyInteger::from(y))
  args..set(2, PyInteger::from(width))
  args..set(3, PyInteger::from(height))
  let _ = try? set_geometry_method.invoke(args~)
}

pub fn QTextBrowser::setStyleSheet(self : QTextBrowser, style_sheet: String) -> Unit {
  guard self.q_text_browser.get_attr("setStyleSheet") is Some(PyCallable(set_style_sheet_method))
  let args = PyTuple::new(1)
  args..set(0, PyString::from(style_sheet))
  let _ = try? set_style_sheet_method.invoke(args~)
}

pub fn QTextBrowser::setEnabled(self : QTextBrowser, enabled: Bool) -> Unit {
  guard self.q_text_browser.get_attr("setEnabled") is Some(PyCallable(set_enabled_method))
  let args = PyTuple::new(1)
  args..set(0, PyInteger::from(if enabled { 1L } else { 0L }))
  let _ = try? set_enabled_method.invoke(args~)
}

pub fn QTextBrowser::setReadOnly(self : QTextBrowser, read_only: Bool) -> Unit {
  guard self.q_text_browser.get_attr("setReadOnly") is Some(PyCallable(set_read_only_method))
  let args = PyTuple::new(1)
  args..set(0, PyBool::from(read_only))
  let _ = try? set_read_only_method.invoke(args~)
} 