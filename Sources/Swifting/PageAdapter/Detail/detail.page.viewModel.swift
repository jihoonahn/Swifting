import Foundation
import Services
import Core

final class DetailPageViewModel: BaseViewModel {
    var url: String
    
    init(url: String) {
        let websiteURL = URL.bundleSwiftEvolutionURL.appendingPathComponent(url)
        self.url = websiteURL.absoluteString
    }
    
    func closeAction() {
        Navigation.dismiss()
    }
}
