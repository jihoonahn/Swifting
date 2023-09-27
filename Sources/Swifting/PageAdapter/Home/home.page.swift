import ScadeKit
  
final class HomePageAdapter: BasePageAdapter {
	
	override func action() {
		searchButton.onClick { _ in
			Navigation.go(.search, transition: .fromRight)
		}
	}
}
