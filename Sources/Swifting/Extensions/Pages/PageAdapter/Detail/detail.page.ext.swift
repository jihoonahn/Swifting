import ScadeKit

extension DetailPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var closeButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("closeButton") as! SCDWidgetsButton
  }

  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}