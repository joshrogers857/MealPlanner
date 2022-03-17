//
//  NutritionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct NutritionView: View {
    @State private var selectedTimePeriod = TimePeriod.today
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Time Period", selection: $selectedTimePeriod) {
                        ForEach(TimePeriod.allCases, id: \.self) {
                            value in
                            
                            Text(value.localizedName).tag(value)
                        }
                    }
                }
                
                Section("Calories") {
                    CalorieView()
                }
            }
            .navigationTitle("Nutrition")
            Spacer()
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
