//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject var mealPlanViewModel: MealPlanViewModel
    @EnvironmentObject var recipeListViewModel: RecipeListViewModel
    @State var selectedDate: Date = Date.now
    
    var body: some View {
        NavigationView {
            Group {
                if(mealPlanViewModel.mealPlan == nil) {
                    VStack {
                        Text("No meal plan found")
                        Button("Create Meal Plan") {
                            mealPlanViewModel.createMealPlan(with: MealPlan(
                                date: selectedDate,
                                stages: [
                                    MealPlanStage(name: "stage1", recipes: [
                                        recipeListViewModel.recipeList[0]
                                    ]),
                                    MealPlanStage(name: "stage2", recipes: [
                                        recipeListViewModel.recipeList[5],
                                        recipeListViewModel.recipeList[7]
                                    ]),
                                    MealPlanStage(name: "stage3", recipes: [
                                        recipeListViewModel.recipeList[2]
                                    ])
                                ]
                            ))
                        }
                    }
                    
                } else {
                    List {
                        ForEach(mealPlanViewModel.mealPlan!.stages) { stage in
                            Section(header: Text(stage.name)) {
                                ForEach(stage.recipes) { recipe in
                                    RecipeListItemView(name: recipe.name)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(dateToString(date: selectedDate))
        }
        .onAppear(perform: {
            mealPlanViewModel.fetchMealPlan(date: selectedDate)
        })
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
            .environmentObject(MealPlanViewModel())
            .environmentObject(RecipeListViewModel())
    }
}
