import Foundation
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var shortDescription: String
    
    static func virtual(name: String) -> Landmark {
        Landmark(
            id: Int.random(in: 1000...9999),
            name: name,
            description: "",
            shortDescription: "Personalized exploration of \(name)."
        )
    }
}
