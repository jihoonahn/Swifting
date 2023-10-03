import Foundation

public protocol Network {
    func request<T: Decodable>(_ api: any API, dto: T.Type) async throws -> T
    func requestArray<T: Decodable>(_ api: API, dto: T.Type) async throws -> [T]
}
 
public final class NetworkImpl: Network {
    private let requestable: NetworkRequestable
    
    public init(requestable: NetworkRequestable) {
        self.requestable = requestable
    }
}

extension NetworkImpl {
    public func request<T: Decodable>(_ api: API, dto: T.Type) async throws -> T {
        let requestData = try await performRequest(context: api)
        return try JSONDecoder().decode(dto.self, from: requestData)
    }

    public func requestArray<T: Decodable>(_ api: API, dto: T.Type) async throws -> [T] {
        let requestData = try await performRequest(context: api)
        return try JSONDecoder().decode([T].self, from: requestData)
    }

    public func performRequest(context api: API) async throws -> Data {
        do {
            let request = try api.toRequest()
            let (data, response) = try await requestable.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkingError(reason: .noResponse)
            }
            guard api.validationCode ~= httpResponse.statusCode else {
                throw StatusError(reason: StatusErrorReason(statusCode: httpResponse.statusCode))
            }
            return data
        } catch {
            guard let errorDict = api.errorDict,
                  let statusError = error as? StatusError,
                  let apiError = errorDict[statusError.reason.statusCode] else {
                throw error
            }
            throw apiError
        }
    }
}
