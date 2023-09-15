import ScadeKit
  
final class SplashPageAdapter: BasePageAdapter {
	override func load(_ path: String) {
		super.load(path)
		splashAction()
	}
	
	private func splashAction() {
		#if os(iOS)
	    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			Navigation.go(.home, clearHistrory: false)
    	}
    	#endif
	}
}
