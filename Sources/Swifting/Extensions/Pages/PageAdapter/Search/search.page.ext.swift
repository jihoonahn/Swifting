import ScadeKit

extension SearchPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var rowView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView") as! SCDWidgetsRowView
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var searchTextbox: SCDWidgetsTextbox {
    return self.page?.getWidgetByName("searchTextbox") as! SCDWidgetsTextbox
  }

  var searchList: SCDWidgetsList {
    return self.page?.getWidgetByName("searchList") as! SCDWidgetsList
  }
}