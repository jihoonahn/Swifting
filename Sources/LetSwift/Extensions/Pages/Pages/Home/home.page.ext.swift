import ScadeKit

extension HomePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var logoImage: SCDWidgetsImage {
    return self.page?.getWidgetByName("logoImage") as! SCDWidgetsImage
  }
}