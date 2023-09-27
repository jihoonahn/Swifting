import ScadeKit
  
final class SplashPageAdapter: BasePageAdapter {
	override func action() {
		#if os(iOS)
	    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			Navigation.go(.home, clearHistrory: false)
    	}
    	#endif
	}
}
