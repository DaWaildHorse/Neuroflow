import FoundationModels
import SwiftUI
import MapKit

struct ItineraryView: View {
    let itinerary: Itinerary.PartiallyGenerated

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let title = itinerary.title {
                    Text(title).font(.largeTitle).bold()
                }
                
                if let rationale = itinerary.rationale {
                    Text(rationale).font(.subheadline).italic().padding().background(.ultraThinMaterial).cornerRadius(12)
                }
                
                if let days = itinerary.days {
                    ForEach(days) { plan in
                        DayCard(plan: plan)
                    }
                }
            }
            .padding()
        }
    }
}

struct DayCard: View {
    let plan: DayPlan.PartiallyGenerated
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(plan.title ?? "Planning...").font(.headline)
            
            // Map for the specific destination
            LandmarkDetailMapView(locationName: plan.destination ?? "")
                .frame(height: 150)
                .cornerRadius(12)
            
            if let activities = plan.activities {
                ForEach(activities) { activity in
                    HStack {
                        Image(systemName: "mappin.circle.fill").foregroundStyle(.indigo)
                        VStack(alignment: .leading) {
                            Text(activity.title ?? "").bold()
                            Text(activity.description ?? "").font(.caption)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }
}
