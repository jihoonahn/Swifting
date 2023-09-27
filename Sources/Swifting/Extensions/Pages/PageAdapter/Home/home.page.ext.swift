import ScadeKit

extension HomePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var logoImage: SCDWidgetsImage {
    return self.page?.getWidgetByName("logoImage") as! SCDWidgetsImage
  }

  var searchButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("searchButton") as! SCDWidgetsButton
  }

  var listTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("listTitle") as! SCDWidgetsLabel
  }

  var list: SCDWidgetsList {
    return self.page?.getWidgetByName("list") as! SCDWidgetsList
  }
}