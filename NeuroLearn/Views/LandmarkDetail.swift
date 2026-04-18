import SwiftUI
import MapKit

struct LandmarkDetailMapView: View {
    let locationName: String
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $position)
            .onAppear { updateMap() }
            .onChange(of: locationName) { updateMap() }
    }

    private func updateMap() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = locationName
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            if let region = response?.boundingRegion {
                position = .region(region)
            }
        }
    }
}
