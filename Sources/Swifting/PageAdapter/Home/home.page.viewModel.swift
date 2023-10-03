import Foundation
import Services

final class HomePageViewModel: BaseViewModel {

    var swiftEvolution: [SwiftEvolutionEntity] = []

	/// UseCase
    private  let fetchSwiftEvolutionUseCase: SwiftEvolutionUseCase

	/// Initalizer
    public init(
        fetchSwiftEvolutionUseCase: SwiftEvolutionUseCase
    ) {
        self.fetchSwiftEvolutionUseCase = fetchSwiftEvolutionUseCase
    }

    /// Swift Evolution API Networking Action
   	func networkingAction(_ context: @escaping () -> Void) {
   		Task { @MainActor in
            let item = try await fetchSwiftEvolutionUseCase.execute()
            swiftEvolution = item.reversed()
            context()
    	}
   	}

	/// Item Select Action
    func listItemSelect(_ url: String) {
    	print(url)
    	Navigation.go(.detail(url), transition: .fromTop)
    }
}
