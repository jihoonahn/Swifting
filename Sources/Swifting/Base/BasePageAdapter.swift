import ScadeKit

class BasePageAdapter<ViewModel: BaseViewModel>: SCDLatticePageAdapter {

    let viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
	override func load(_ path: String) {
		super.load(path)
        configUI()
		bindAction()
		bindState()
	}
	
	override func show(view: (SCDLatticeView)?, data: Any) {
		super.show(view: view, data: data)
        onAppear()
	}

	func configUI() {}
    func onAppear() {}
	func bindAction() {}
	func bindState() {}
}
