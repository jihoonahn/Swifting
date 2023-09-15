import ScadeKit

final class LetSwift: SCDApplication {

	let window = SCDLatticeWindow()
  
	override func onFinishLaunching() {
		Navigation.show(.splash, in: window)
	}
}
