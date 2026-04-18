//
//  LandmarkTripView.swift
//  NeuroLearn
//
//  Created by Dev Jr. 15 on 18/04/26.
//

import SwiftUI

struct LandmarkTripView: View {
    let landmark: Landmark
    @State private var planner: ItineraryPlanner?
    @State private var hasStarted = false

    var body: some View {
        VStack {
            if let planner = planner {
                if let itinerary = planner.itinerary {
                    ItineraryView(itinerary: itinerary) // The final result
                } else {
                    ItineraryPlanningView(landmark: landmark, planner: planner) // The animation
                }
            }
        }
        .task {
            planner = ItineraryPlanner(landmark: landmark)
            try? await planner?.suggestItinerary()
        }
    }
}
