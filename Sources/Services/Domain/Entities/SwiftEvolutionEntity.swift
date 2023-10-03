import Foundation
import ScadeKit

public final class SwiftEvolutionEntity: EObject {
    public let authors: [AuthorsEntity]
    public let id: String
    public let link: String
    public let sha: String
    public let status: StatusEntity
    public let summary: String
    public let title: String

    public init(
        authors: [AuthorsEntity],
        id: String,
        link: String,
        sha: String,
        status: StatusEntity,
        summary: String,
        title: String
    ) {
        self.authors = authors
        self.id = id
        self.link = link
        self.sha = sha
        self.status = status
        self.summary = summary
        self.title = title
    }
}
