import Foundation

struct DetailPageDependency {
    let page: DetailPageAdapter
}

extension DetailPageDependency {
    static func resolve() -> DetailPageDependency {
        let viewModel = DetailPageViewModel()
        let page = DetailPageAdapter(viewModel: viewModel)
        return DetailPageDependency(page: page)
    }
}
