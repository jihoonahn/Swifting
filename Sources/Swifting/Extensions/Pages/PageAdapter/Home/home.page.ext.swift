import ScadeKit

extension HomePageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var logoImage: SCDWidgetsImage {
    return self.page?.getWidgetByName("logoImage") as! SCDWidgetsImage
  }

  var listTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("listTitle") as! SCDWidgetsLabel
  }

  var mainList: SCDWidgetsList {
    return self.page?.getWidgetByName("mainList") as! SCDWidgetsList
  }
}