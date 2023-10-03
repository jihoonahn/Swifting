import Foundation

public protocol SwiftEvolutionRepository {
    func fetchSwiftEvolution() async throws -> [SwiftEvolutionEntity]
}

final class SwiftEvolutionRepositoryImpl: SwiftEvolutionRepository {
    
    private let datasource: SwiftEvolutionRemote
    
    public init(datasource: SwiftEvolutionRemote) {
        self.datasource = datasource
    }
    
    func fetchSwiftEvolution() async throws -> [SwiftEvolutionEntity] {
        try await datasource.fetchSwiftEvolution()
    }
}
