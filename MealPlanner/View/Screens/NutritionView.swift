//
//  NutritionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct NutritionView: View {
    @State private var selectedTimePeriod = TimePeriod.today
    @State private var startDate = NutritionService.getStartAndEndDates(timePeriod: .today).0
    @State private var endDate = NutritionService.getStartAndEndDates(timePeriod: .today).1
    
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
                
                Section("Nutrition") {
                    NutritionalInformationView(
                        startDate: startDate, endDate: endDate
                    )
                }
            }
            .navigationTitle("Nutrition")
            Spacer()
        }
        .onChange(of: selectedTimePeriod) {
            newValue in
            
            let dates = NutritionService.getStartAndEndDates(timePeriod: newValue)
            
            startDate = dates.0
            endDate = dates.1
        }
    }
}

/*struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}*/
