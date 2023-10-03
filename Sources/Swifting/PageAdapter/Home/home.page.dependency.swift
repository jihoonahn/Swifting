import Foundation
import Services

struct HomePageDependency {
    let page: HomePageAdapter
}

extension HomePageDependency {
    static func resolve(_ useCase: SwiftEvolutionUseCase) -> HomePageDependency {
        let viewModel = HomePageViewModel(fetchSwiftEvolutionUseCase: useCase)
        let page = HomePageAdapter(viewModel: viewModel)
        return HomePageDependency(page: page)
    }
}
