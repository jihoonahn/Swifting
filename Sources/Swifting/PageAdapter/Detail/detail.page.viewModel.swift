import Foundation
import Services
import Core

final class DetailPageViewModel: BaseViewModel {
    var url: String = ""
    
    func closeAction() {
        Navigation.dismiss()
    }
    
    func updateURL(url: String) {
        let websiteURL = URL.bundleSwiftEvolutionURL.appendingPathComponent(url)
        self.url = websiteURL.absoluteString
    }
    
    func webViewOnLoaded() {
        log(type: .info, "Website is Loaded")
    }
    
    func webViewOnLoadedFailed() {
        log(type: .error, "Website is Loaded Failed")
    }
}
