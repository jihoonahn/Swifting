import Foundation

extension URL {
    public static var bundleBaseURL: URL {
        guard let bundleURL = Bundle.main.path(forResource: "Services", ofType: "plist"),
              let dictionary = NSDictionary(contentsOfFile: bundleURL),
              let baseURLString = dictionary["BaseURL"] as? String,
              let baseURL = URL(string: baseURLString)
        else {
            fatalError("BaseURL Not Found")
        }
        return baseURL
    }
    
    public static var bundleSwiftEvolutionURL: URL {
        guard let bundleURL = Bundle.main.path(forResource: "Services", ofType: "plist"),
              let dictionary = NSDictionary(contentsOfFile: bundleURL),
              let baseURLString = dictionary["EvolutionURL"] as? String,
              let baseURL = URL(string: baseURLString)
        else {
        	fatalError("SwiftEvolution Github URL Not Found")
        }
        return baseURL
   	}
}
