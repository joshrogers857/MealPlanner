//
//  SwiftUIView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct CalorieView: View {
    @ObservedObject private var healthStore = HealthStore.shared
    var dates: [Date]
    
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
                    Text("Recommended: \(UserDefaults.standard.string(forKey: "sex") == "Male" ? 2500 : 2000)/day")
                        .font(.caption)
                }
                .padding(.top, 0.1)
            }
            .onAppear {
                healthStore.activeCaloriesQuery(startDate: dates[0], endDate: dates[1])
                healthStore.basalCaloriesQuery(startDate: dates[0], endDate: dates[1])
            }
            .onChange(of: dates) {
                newValue in
                
                healthStore.activeCaloriesQuery(startDate: newValue[0], endDate: newValue[1])
                healthStore.basalCaloriesQuery(startDate: newValue[0], endDate: newValue[1])
            }
        }
    }
}

/*struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieView()
    }
}*/
