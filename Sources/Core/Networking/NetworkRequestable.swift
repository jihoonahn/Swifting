import Foundation

public protocol NetworkRequestable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkRequestable {}
