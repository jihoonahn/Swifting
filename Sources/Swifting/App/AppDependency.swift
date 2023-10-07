import Foundation
import Services
import Core

final class AppDependency {
    /// Service Dependency
    var networkingDependency: NetworkDependency {
        return .resolve()
    }
    var swiftEvolutionDependency: SwiftEvolutionDependency {
        return .resolve(network: networkingDependency.network)
    }
}

/// Page Dependency
extension AppDependency {
    var splashPageDependency: SplashPageDependency {
        return .resolve()
    }
    var homePageDependency: HomePageDependency {
        return .resolve(swiftEvolutionDependency.swiftEvolutionUseCase)
    }
    var detailPageDependency: DetailPageDependency {
        return .resolve()
    }
}
