//
//  NutritionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct NutritionView: View {
    @State var activeCalories = 0.0
    @State var basalCalories = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                CalorieView(
                    activeCalories: $activeCalories,
                    basalCalories: $basalCalories
                )
                
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
