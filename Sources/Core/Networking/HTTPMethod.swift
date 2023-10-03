import Foundation

public enum HTTPMethod {
    case connect(String)
    case delete(String)
    case get(String)
    case head(String)
    case options(String)
    case patch(String)
    case post(String)
    case put(String)
    case trace(String)
    
    public var rawValue: String {
    	switch self {
    	case .connect:
            return "CONNECT"
        case .delete:
            return "DELETE"
    	case .get:
            return "GET"
        case .head:
            return "HEAD"
        case .options:
            return "OPTIONS"
        case .patch:
            return "PATCH"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .trace:
            return "TRACE"
    	}
    }
    
    public var path: String {
    	switch self {
    		case let .connect(path),
    		let .delete(path),
    		let .get(path),
    		let .head(path),
    		let .options(path),
    		let .patch(path),
    		let .post(path),
    		let .put(path),
    		let .trace(path):
    		return path
    	}
    }
}
