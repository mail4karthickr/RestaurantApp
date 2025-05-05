//
//  ContentView.swift
//  ResaurantApp
//
//  Created by Karthick Ramasamy on 05/05/25.
//

import SwiftUI
import RestaurantFinder
import RestaurantDetails
import Checkout

struct ContentView: View {
    var body: some View {
        VStack {
            RestaurantFinderView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
