import ScadeKit

public final class Navigation {
	public enum Page: String, CaseIterable {
		case splash
		case home
		case search
		case detail
		var fileName: String {
			return "\(self.rawValue).page"
		}
		func createAdapter() -> SCDLatticePageAdapter {
			switch self {
				case .splash:
				return SplashPageAdapter()
				case .home:
				return HomePageAdapter()
				case .search:
				return SearchPageAdapter()
				case .detail:
				return DetailPageAdapter()
			}
		}
	}

  	private static var adapters: [Page: SCDLatticePageAdapter] = [:]
 	private static var transitionsStack: [Page] = []
 	private static var current: Page? {
 		return self.transitionsStack.last
 	}
 
 	/// Adapter Method
 	public static func adapter(by page: Page) -> SCDLatticePageAdapter? {
 		guard let adapter = self.adapters[page] else {
 			let adapter = page.createAdapter()
 			adapter.load(page.fileName)
 			self.adapters[page] = adapter
 			return adapter
 		}
 		return adapter
 	}
 
	public static func show(_ page: Page, in view: SCDLatticeView) {
		self.transitionsStack.append(page)
	    adapter(by: page)?.show(view: view)
	}
}

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
