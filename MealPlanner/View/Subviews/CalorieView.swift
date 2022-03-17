//
//  SwiftUIView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct CalorieView: View {
    @ObservedObject private var healthStore = HealthStore.shared
    
    var body: some View {
        if(healthStore.store == nil) {
            Text("HealthStore unavailable. Calories could not be retrieved.")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .padding()
        } else {
            Text("Active calories: \(healthStore.activeCalories)")
            Text("Basal calories: \(healthStore.basalCalories)")
            Text("Total calories: \(healthStore.totalCalories)")
            
            VStack(alignment: .leading) {
                Text("Recommended (men): 2500/day")
                    .font(.caption)
                Text("Recommended (women): 2000/day")
                    .font(.caption)
            }
            .padding(.top, 0.1)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieView()
    }
}
