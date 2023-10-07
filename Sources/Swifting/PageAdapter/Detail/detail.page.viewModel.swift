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
        log(.info, msg: "Website is Loaded")
    }
    
    func webViewOnLoadedFailed() {
        log(.error, msg: "Website is Loaded Failed")
    }
}
