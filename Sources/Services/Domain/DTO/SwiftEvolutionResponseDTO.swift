import Foundation
import Core
import ScadeKit

struct SwiftEvolutionResponseDTO: Decodable {
    let authors: [Authors]
    let id: String
    let link: String
    let reviewManager: ReviewManager?
    let sha: String
    let status: Status
    let summary: String
    let title: String
    let trackingBugs: [TrackingBugs]?
    let warnings: [Warnings]?

    struct Authors: Decodable {
        let link: String
        let name: String
    }

    struct ReviewManager: Decodable {
        let link: String
        let name: String
    }

    struct Status: Decodable {
        let state: String
        let version: String?
    }

    struct TrackingBugs: Decodable {
        let assignee: String
        let id: String
        let link: String
        let radar: String
        let resolution: String
        let status: String
        let title: String
        let updated: String
    }

    struct Warnings: Decodable {
        let kind: String
        let message: String
        let stage: String
    }
}

extension SwiftEvolutionResponseDTO {
    func toDomain() -> SwiftEvolutionEntity {
        return SwiftEvolutionEntity(
            authors: authors.map { $0.toDomain() },
            id: id,
            link: link,
            sha: sha,
            status: status.toDomain(),
            summary: summary,
            title: title
        )
    }
}

extension SwiftEvolutionResponseDTO.Authors {
    func toDomain() -> AuthorsEntity {
        AuthorsEntity(
            link: link,
            name: name
        )
    }
}

extension SwiftEvolutionResponseDTO.Status {
    func toDomain() -> StatusEntity {
        StatusEntity(
            state: state,
            version: version
        )
    }
}
