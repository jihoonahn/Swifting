import ScadeKit
import Services

public final class Navigation {
    public static var root: Page {
        #if os(iOS)
        return Page.splash
        #elseif os(Android)
        return Page.home
        #endif
    }
    
	public enum Page {
		case splash
		case home
		case detail(String)
		var fileName: String {
			switch self {
                case .splash:
                return "splash.page"
                case .home:
                return "home.page"
                case .detail:
                return "detail.page"
			}
		}
		func createAdapter() -> SCDLatticePageAdapter {
			switch self {
				case .splash:
                return Swifting.appDependency.splashPageDependency.page
				case .home:
                return Swifting.appDependency.homePageDependency.page
				case let .detail(url):
                return detailPage(url: url)
			}
		}
	}

  	private static var adapters: [String: SCDLatticePageAdapter] = [:]
 	private static var transitionsStack: [Page] = []
 	private static var current: Page? {
 		return self.transitionsStack.last
 	}

 	/// Adapter Method
 	public static func adapter(by page: Page) -> SCDLatticePageAdapter? {
 		guard let adapter = self.adapters[page.fileName] else {
 			let adapter = page.createAdapter()
 			adapter.load(page.fileName)
 			self.adapters[page.fileName] = adapter
 			return adapter
 		}
 		return adapter
 	}
 
	public static func show(_ page: Page, in view: SCDLatticeView) {
		self.transitionsStack.append(page)
	    adapter(by: page)?.show(view: view)
	}
}

private extension Navigation.Page {
    func detailPage(url: String) -> DetailPageAdapter {
        let viewModel = DetailPageViewModel(url: url)
        let page = DetailPageAdapter(viewModel: viewModel)
        return page
    }
}


// MARK: - Navigation Extension
/// Move Action
public extension Navigation {
	static func go(_ page: Page, clearHistrory: Bool = false) {
		navigation(by: page, clearHistroy: clearHistrory)?.go(page: page.fileName)
	}
	static func go(_ page: Page, with data: Any, clearHistrory: Bool = false) {
		navigation(by: page, clearHistroy: clearHistrory)?.goWith(page: page.fileName, data: data)
	}
	
	static func go(_ page: Page, clearHistrory: Bool = false, transition: SCDLatticeTransition = .fromRight) {
		navigation(by: page, clearHistroy: clearHistrory)?.go(page: page.fileName, transition: transition)
	}

	static func back() {
		guard self.transitionsStack.count > 1 else { return }
		let last = self.transitionsStack.popLast()
		let page = self.current!.fileName
		adapter(by: last!)?.navigation?.go(page: page, transition: .fromLeft)
	}

    static func dismiss() {
        guard self.transitionsStack.count > 1 else { return }
        let last = self.transitionsStack.popLast()
        let page = self.current!.fileName
        adapter(by: last!)?.navigation?.go(page: page, transition: .fromBottom)
    }
}

/// Utility
private extension Navigation {
	private static func navigation(by page: Page, clearHistroy: Bool = false) -> SCDLatticeNavigation? {
		guard let current = self.current else { return nil }
		if clearHistroy {
			self.transitionsStack.removeAll()
		}
		self.transitionsStack.append(page)
		let _ = adapter(by: page)
		return adapter(by: current)?.navigation
	}
}
