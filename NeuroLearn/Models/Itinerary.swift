import Foundation
import FoundationModels

@Generable
struct Itinerary: Equatable {
    let title: String
    let description: String
    let rationale: String
    let days: [DayPlan]
}

@Generable
struct DayPlan: Equatable, Identifiable {
    var id: String { title }
    let title: String
    let subtitle: String
    let destination: String
    let activities: [Activity]
}

@Generable
struct Activity: Equatable, Identifiable {
    var id: String { title }
    let type: Kind
    let title: String
    let description: String
}

@Generable
enum Kind {
    case sightseeing, foodAndDining, shopping, hotelAndLodging
}
