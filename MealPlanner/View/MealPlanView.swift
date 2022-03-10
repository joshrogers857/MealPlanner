//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject var mealPlanViewModel: MealPlanViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if(mealPlanViewModel.mealPlan == nil) {
                    VStack {
                        Text("No meal plan found")
                        Button("Create Meal Plan") {
                            
                        }
                    }
                    
                } else {
                    List {
                        ForEach(mealPlanViewModel.mealPlan!.stages) {
                            stage in
                            Text(stage.name)
                        }
                    }
                }
            }
            .navigationTitle(dateToString(date: Date.now))
        }
    }
    
    func dateToString(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY"
        
        return df.string(from: date)
    }
}

struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanView()
            .environmentObject(MealPlanViewModel(date: Date.now))
    }
}
