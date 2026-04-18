//
//  utils.swift
//  NeuroLearn
//
//  Created by Dev Jr. 15 on 18/04/26.
//

import SwiftUI

extension View {
    func card() -> some View {
        self.padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

extension Kind {
    var icon: String {
        switch self {
        case .sightseeing: return "binoculars.fill"
        case .foodAndDining: return "fork.knife"
        case .shopping: return "bag.fill"
        case .hotelAndLodging: return "bed.double.fill"
        }
    }
}
