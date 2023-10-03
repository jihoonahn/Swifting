import Foundation

public struct NetworkError<Reason>: Error {
    public var reason: Reason
    
    public init(reason: Reason) {
        self.reason = reason
    }
}

extension NetworkError: CustomStringConvertible {
    public var description: String {
        return """
        Networking Error
        Reason: \(reason)
        """
    }
}
