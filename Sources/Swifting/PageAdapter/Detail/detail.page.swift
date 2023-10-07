import ScadeKit
  
final class DetailPageAdapter: BasePageAdapter<DetailPageViewModel> {

	/// Appear
    override func onAppear(data: Any) {
        if let url = data as? String {
            viewModel.updateURL(url: url)
            webView.load(viewModel.url)
        }
    }

	/// Bind Action
	override func bind() {
		closeButton.onClick { _ in
			self.viewModel.closeAction()
		}
        webView.onLoaded.append(
            SCDWidgetsLoadEventHandler { _ in
                self.viewModel.webViewOnLoaded()
            }
        )
        webView.onLoadFailed.append(
            SCDWidgetsLoadFailedEventHandler { _ in
                self.viewModel.webViewOnLoadedFailed()
            }
        )
	}
}
