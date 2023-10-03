import Foundation

struct DetailPageDependency {
    let page: DetailPageAdapter
}

extension DetailPageDependency {
    static func resolve(url: String) -> DetailPageDependency {
        let viewModel = DetailPageViewModel(url: url)
        let page = DetailPageAdapter(viewModel: viewModel)
        return DetailPageDependency(page: page)
    }
}
