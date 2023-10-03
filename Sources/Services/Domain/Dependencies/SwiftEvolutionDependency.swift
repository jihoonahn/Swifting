import Foundation
import Core

public struct SwiftEvolutionDependency {
    public let swiftEvolutionRepository: SwiftEvolutionRepository
    public let swiftEvolutionUseCase: SwiftEvolutionUseCase
}

public extension SwiftEvolutionDependency {
    static func resolve(network: Network) -> SwiftEvolutionDependency {
        let dataSource = SwiftEvolutionRemoteImpl(network)
        let repository = SwiftEvolutionRepositoryImpl(datasource: dataSource)
        let usecase = SwiftEvolutionUseCaseImpl(repository: repository)
        return SwiftEvolutionDependency(swiftEvolutionRepository: repository, swiftEvolutionUseCase: usecase)
    }
}
