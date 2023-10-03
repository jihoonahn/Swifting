import Foundation

final class SplashPageViewModel: BaseViewModel {
    func splashAction() {
        #if os(iOS)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Navigation.go(.home, clearHistrory: true)
        }
        #endif
    }
}
