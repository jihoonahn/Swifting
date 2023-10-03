import Foundation
import Core

enum SwiftEvolutionAPI {
    case fetchData
}

extension SwiftEvolutionAPI: API {
    var baseURL: URL {
        URL.bundleBaseURL
    }
    var method: HTTPMethod {
        switch self {
        case .fetchData:
            return .get("/swift-evolution/proposals.json")
        }
    }
}
