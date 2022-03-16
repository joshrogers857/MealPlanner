//
//  SwiftUIView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct CalorieView: View {
    var activeCalories: Double
    var basalCalories: Double
    var totalCalories: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Calories Burned Today")
                .font(.title)
            Text("Active calories: \(activeCalories)")
            Text("Basal calories: \(basalCalories)")
            Text("Total calories: \(totalCalories)")
            
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

/* struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieView()
    }
} */
