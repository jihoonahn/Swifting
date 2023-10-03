import Foundation
import Core

public protocol SwiftEvolutionRemote {
    func fetchSwiftEvolution() async throws -> [SwiftEvolutionEntity]
}

public final class SwiftEvolutionRemoteImpl: SwiftEvolutionRemote {
    private let network: any Network
    
    init(_ network: any Network) {
        self.network = network
    }
    
    public func fetchSwiftEvolution() async throws -> [SwiftEvolutionEntity] {
        return try await network.requestArray(
            SwiftEvolutionAPI.fetchData,
            dto: SwiftEvolutionResponseDTO.self
        ).map { $0.toDomain() }
    }
}
