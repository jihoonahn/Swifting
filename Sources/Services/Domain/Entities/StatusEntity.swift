import Foundation
import ScadeKit

public final class StatusEntity: EObject {
    public let state: String
    public let version: String?

    public init(state: String, version: String?) {
        self.state = state
        self.version = version
    }

    public var transformedState: String {
        switch state {
        case ".awaitingReview":
            return "Awaiting Review"
        case ".scheduledForReview":
            return "Scheduled for Review"
        case ".activeReview":
            return "Active Review"
        case ".returnedForRevision":
            return "Returned for Revision"
        case ".withdrawn":
            return "Withdrawn"
        case ".accepted":
            return "Accepted"
        case ".acceptedWithRevisions":
            return "Accepted with revisions"
        case ".rejected":
            return "Rejected"
        case ".implemented":
            return "Implemented"
        case ".previewing":
            return "Previewing"
        case ".error":
            return "Error"
        default:
            return state
        }
    }
}
