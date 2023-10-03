import ScadeKit
  
final class DetailPageAdapter: BasePageAdapter<DetailPageViewModel> {

	/// Appear
	override func onAppear() {
		print("Appear: \(viewModel.url)")
		webView.load(viewModel.url)
		webView.onLoaded.append(
			SCDWidgetsLoadEventHandler { event in
				print("On Loaded: \(String(describing: event?.url))")
			}
		)
		webView.onLoadFailed.append(
      		SCDWidgetsLoadFailedEventHandler { event in
        		print("NonLoaded: \(String(describing: event?.url))")
        		print("NonLoaded: \(String(describing: event?.message))")
      		}
    	)
	}	

	/// Bind Action
	override func bindAction() {
		closeButton.onClick { _ in
			self.viewModel.closeAction()
		}
	}
}
