import ScadeKit

final class Swifting: SCDApplication {

	let window = SCDLatticeWindow()
 
	override func onFinishLaunching() {
		#if os(iOS)
		Navigation.show(.splash, in: window)
		#elseif os(Android)
		Navigation.show(.home, in: window)
		#endif
	}
}
