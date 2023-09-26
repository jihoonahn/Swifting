import ScadeKit

extension SplashPageAdapter {
  var image: SCDWidgetsImage {
    return self.page?.getWidgetByName("image") as! SCDWidgetsImage
  }
}