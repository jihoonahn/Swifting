import ScadeKit

class BasePageAdapter: SCDLatticePageAdapter {
	override func load(_ path: String) {
		super.load(path)
		configUI()
		action()
	}
	
	func configUI() {}
	func action() {}
}