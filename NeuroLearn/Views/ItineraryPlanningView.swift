//
//  ItineraryPlanningView.swift
//  NeuroLearn
//
//  Created by Dev Jr. 15 on 18/04/26.
//

import SwiftUI

struct ItineraryPlanningView: View {
    let landmark: Landmark
    let planner: ItineraryPlanner

    var body: some View {
        VStack(alignment: .leading) {
            Text("Planning for \(landmark.name)...").font(.title.bold())
            
            ForEach(planner.poiTool.lookupHistory) { lookup in
                HStack {
                    Image(systemName: "location.magnifyingglass")
                    Text("Searching for **\(lookup.category.rawValue)**...")
                }
                .padding().background(.white).cornerRadius(12).shadow(radius: 2)
            }
        }.padding()
    }
}
