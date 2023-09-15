import ScadeKit

extension DetailPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var webView: SCDWidgetsWebView {
    return self.page?.getWidgetByName("webView") as! SCDWidgetsWebView
  }
}