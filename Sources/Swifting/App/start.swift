import ScadeKit

final class Swifting: SCDApplication {
    /// Properties
    static let appDependency = AppDependency()
	let window = SCDLatticeWindow()
    /// App Launching
    override func onFinishLaunching() {
        Navigation.show(Navigation.root, in: window)
	}
}
