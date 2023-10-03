import Foundation

public protocol SwiftEvolutionUseCase {
    func execute() async throws -> [SwiftEvolutionEntity]
}

final class SwiftEvolutionUseCaseImpl: SwiftEvolutionUseCase {
    
    private let repository: SwiftEvolutionRepository
    
    public init(repository: SwiftEvolutionRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [SwiftEvolutionEntity] {
        try await repository.fetchSwiftEvolution()
    }
}
