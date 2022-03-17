//
//  SwiftUIView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct CalorieView: View {
    @ObservedObject private var healthStore = HealthStore.shared
    var startDate: Date
    var endDate: Date
    
    var body: some View {
        if(healthStore.store == nil) {
            Text("HealthStore unavailable. Calories could not be retrieved.")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .padding()
        } else {
            Group {
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
            .onAppear {
                healthStore.activeCaloriesQuery(startDate: startDate, endDate: endDate)
                healthStore.basalCaloriesQuery(startDate: startDate, endDate: endDate)
            }
            .onChange(of: startDate) {
                newValue in
                
                healthStore.activeCaloriesQuery(startDate: newValue, endDate: endDate)
                healthStore.basalCaloriesQuery(startDate: newValue, endDate: endDate)
            }
            .onChange(of: endDate) {
                newValue in
                
                healthStore.activeCaloriesQuery(startDate: startDate, endDate: newValue)
                healthStore.basalCaloriesQuery(startDate: startDate, endDate: newValue)
            }
        }
    }
}

/*struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieView()
    }
}*/
