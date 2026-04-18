import MapKit
import WeatherKit

@Observable @MainActor
final class LocationLookup {
    private(set) var temperatureString: String?

    func performLookup(location: String) async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = location
        let search = MKLocalSearch(request: request)
        
        do {
            let response = try await search.start()
            if let firstItem = response.mapItems.first {
                // We access the location directly; WeatherService handles the optionality.
                if let coord = firstItem.placemark.location {
                    let weather = try await WeatherService.shared.weather(for: coord, including: .current)
                    self.temperatureString = "\(weather.temperature.value.formatted())°\(weather.temperature.unit.symbol)"
                }
            }
        } catch {
            print("Weather lookup failed")
        }
    }
}
