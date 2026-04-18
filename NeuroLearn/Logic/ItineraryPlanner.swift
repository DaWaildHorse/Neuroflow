import FoundationModels
import Observation

@Observable @MainActor
final class ItineraryPlanner {
    private(set) var itinerary: Itinerary.PartiallyGenerated?
    private(set) var poiTool: FindPointsOfInterestTool
    private var session: LanguageModelSession
    var error: Error?

    init(landmark: Landmark) {
        let tool = FindPointsOfInterestTool(landmarkName: landmark.name)
        self.poiTool = tool
        self.session = LanguageModelSession(
            tools: [tool],
            instructions: Instructions {
                "You are a helpful travel assistant. Create a 3-day itinerary for \(landmark.name)."
                "If you don't have specific data, use your general knowledge of the world."
                "Always use the findPointsOfInterest tool to find specific hotels and restaurants."
            }
        )
    }

    func suggestItinerary() async throws {
        let stream = session.streamResponse(generating: Itinerary.self) {
            "Generate a fun itinerary for a trip to \(poiTool.landmarkName)."
        }
        for try await partialResponse in stream {
            itinerary = partialResponse.content
        }
    }
}
