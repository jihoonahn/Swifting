import Foundation

public struct NetworkDependency {
    public let requestable: NetworkRequestable
    public let network: Network
}

public extension NetworkDependency {
    static func resolve() -> NetworkDependency {
        let requestable: NetworkRequestable = URLSession.shared

        let network = NetworkImpl(requestable: requestable)

        return NetworkDependency(
            requestable: requestable,
            network: network
        )
    }
}
