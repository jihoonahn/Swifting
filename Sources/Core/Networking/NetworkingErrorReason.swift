import Foundation

typealias NetworkingError = NetworkError<NetworkingErrorReason>

public enum NetworkingErrorReason {
    case invalidURL
    case noResponse
    case underlying(Error)
}
