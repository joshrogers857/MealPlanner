//
//  SwiftUIView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct CalorieView: View {
    @Binding var activeCalories: Double
    @Binding var basalCalories: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Calories burned")
                .font(.title)
            Text("Active calories: \(activeCalories)")
            Text("Basal calories: \(basalCalories)")
        }
    }
}

/* struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieView()
    }
} */
