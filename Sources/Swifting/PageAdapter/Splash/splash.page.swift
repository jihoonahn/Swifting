import ScadeKit
  
final class SplashPageAdapter: BasePageAdapter<SplashPageViewModel> {
	override func bindAction() {
        viewModel.splashAction()
	}
}
