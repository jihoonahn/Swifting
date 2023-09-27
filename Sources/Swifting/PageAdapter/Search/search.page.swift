import ScadeKit
  
final class SearchPageAdapter: BasePageAdapter {
	override func action() {
		backButton.onClick { _ in
			Navigation.back()
		}
	}
}
