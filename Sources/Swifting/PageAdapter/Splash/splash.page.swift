import ScadeKit
  
final class SplashPageAdapter: BasePageAdapter<SplashPageViewModel> {
	override func bind() {
        viewModel.splashAction()
	}
}
