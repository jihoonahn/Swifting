import Foundation
import ScadeKit

public final class AuthorsEntity: EObject {
    public let link: String
    public let name: String

    public init(link: String, name: String) {
        self.link = link
        self.name = name
    }
}
