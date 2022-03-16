//
//  NutritionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI
import HealthKit

struct NutritionView: View {
    @ObservedObject var healthStore = HealthStore.shared
    
    var body: some View {
        NavigationView {
            VStack {
                if(healthStore.store == nil) {
                    Text("HealthStore unavailable")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .padding()
                } else {
                    CalorieView(
                        activeCalories: healthStore.activeCalories,
                        basalCalories: healthStore.basalCalories,
                        totalCalories: healthStore.totalCalories
                    )
                }
                
                Spacer()
            }
            .navigationTitle("Nutrition")
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
