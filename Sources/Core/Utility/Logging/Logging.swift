import ScadeKit
import os

public enum SCDLoggingType : Int {
    case info = 1
    case error = 2
    case fault = 3
    case debug = 4
    case `default` = 5
}

public func oslog(type: SCDLoggingType, _ msg: StaticString) {
    let targetLoggingType : OSLogType = {
        switch type {
        case .info : return OSLogType.info
        case .fault : return OSLogType.fault
        case .error : return OSLogType.error
        case .debug : return OSLogType.debug
        case .`default` : return OSLogType.default
        }
    }()
    os_log(msg, type: targetLoggingType)
}

// convienence log function nicer syntax
public func log( _ type: SCDLoggingType, msg: StaticString) {
    oslog(type: type, msg)
}
