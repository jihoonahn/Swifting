import Foundation

public protocol API {
	var baseURL: URL { get }
	var method: HTTPMethod { get }
    var query: [String: String]? { get }
    var body: Encodable? { get }
    var validationCode: ClosedRange<Int> { get }
    var errorDict: [Int: Error]? { get }
    var header: [String: String]? { get }
}

public extension API {
    var query: [String: String]? { nil }
    var body: Encodable? { nil }
    var validationCode: ClosedRange<Int> { 200...299 }
    var errorDict: [Int: Error]? { nil }
    var header: [String: String]? { nil }
}

public extension API {
    func toRequest() throws -> URLRequest {
        let url = URL.bundleBaseURL.appendingPathComponent(method.path)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)

        if let query {
            let queryItem = query.map { key, value in
                URLQueryItem(name: key, value: value)
            }
            urlComponents?.queryItems = queryItem
        }

        guard let requestURL = urlComponents?.url else {
            throw NetworkingError(reason: .invalidURL)
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        
        if let body, let httpBody = try? JSONEncoder().encode(body) {
            request.httpBody = httpBody
        }
        return request
    }
}
