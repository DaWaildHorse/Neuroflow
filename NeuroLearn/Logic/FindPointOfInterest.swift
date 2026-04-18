import FoundationModels
import SwiftUI

@Observable
final class FindPointsOfInterestTool: Tool {
    let name = "findPointsOfInterest"
    let description = "Finds points of interest for a landmark."
    let landmarkName: String
    @MainActor var lookupHistory: [Lookup] = []

    init(landmarkName: String) { self.landmarkName = landmarkName }

    @Generable
    enum Category: String, CaseIterable {
        case hotel, cafe, museum, restaurant, park
    }

    @Generable
    struct Arguments {
        let pointOfInterest: Category
        let naturalLanguageQuery: String
    }

    func call(arguments: Arguments) async throws -> String {
        await MainActor.run { lookupHistory.append(Lookup(category: arguments.pointOfInterest)) }
        return "Found several \(arguments.pointOfInterest) in \(landmarkName)."
    }

    struct Lookup: Identifiable {
        let id = UUID()
        let category: Category
    }
}
