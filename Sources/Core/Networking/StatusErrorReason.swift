import Foundation

typealias StatusError = NetworkError<StatusErrorReason>

public enum StatusErrorReason {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case tooManyRequest
    case internalServerError
    case underlying(Int)
    
    public init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 409:
            self = .conflict
        case 429:
            self = .tooManyRequest
        case 500:
            self = .internalServerError
        default:
            self = .underlying(statusCode)
        }
    }
}

public extension StatusErrorReason {
    var statusCode: Int {
        switch self {
        case .badRequest:
            return 400
        case .unauthorized:
            return 401
        case .forbidden:
            return 403
        case .notFound:
            return 404
        case .conflict:
            return 409
        case .tooManyRequest:
            return 429
        case .internalServerError:
            return 500
        case let .underlying(statusCode):
            return statusCode
        }
    }
}
