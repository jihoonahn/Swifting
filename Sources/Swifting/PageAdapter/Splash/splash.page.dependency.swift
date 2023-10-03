import Foundation
import Services

struct SplashPageDependency {
    let page: SplashPageAdapter
}

extension SplashPageDependency {
    static func resolve() -> SplashPageDependency {
        let viewModel = SplashPageViewModel()
        let page = SplashPageAdapter(viewModel: viewModel)
        return SplashPageDependency(page: page)
    }
}
