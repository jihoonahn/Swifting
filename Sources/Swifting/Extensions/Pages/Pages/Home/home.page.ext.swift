import ScadeKit

extension HomePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var searchButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("searchButton") as! SCDWidgetsButton
  }

  var logoImage: SCDWidgetsImage {
    return self.page?.getWidgetByName("logoImage") as! SCDWidgetsImage
  }
}