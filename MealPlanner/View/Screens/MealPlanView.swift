//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    //@FetchRequest private var mealPlans: FetchedResults<MealPlan>
    //@FetchRequest private var mealPlanStages: FetchedResults<MealPlanStage>
    //@FetchRequest private var recipes: FetchedResults<Recipe>
    //@FetchRequest private var ingredients: FetchedResults<Ingredient>
    
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectorView()
                
                Spacer()
                
                MealPlanList(selectedDate: selectedDate.date)
                
                Spacer()
                
                /* Button("DELETE ALL") {
                    for plan in mealPlans {
                        moc.delete(plan)
                    }
                    
                    for stage in mealPlanStages {
                        moc.delete(stage)
                    }
                    
                    for recipe in recipes {
                        moc.delete(recipe)
                    }
                    
                    for ingredient in ingredients {
                        moc.delete(ingredient)
                    }
                    
                    PersistenceController.shared.save()
                } */
            }
            .navigationTitle("Meal Plan")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
    
    /* init() {
        _mealPlans = FetchRequest<MealPlan>(
            sortDescriptors: []
        )
        
        _mealPlanStages = FetchRequest<MealPlanStage>(
            sortDescriptors: []
        )
        
        _recipes = FetchRequest<Recipe>(
            sortDescriptors: []
        )
        
        _ingredients = FetchRequest<Ingredient>(
            sortDescriptors: []
        )
    } */
    
    private func dateToString(_ date: Date) -> (String, String) {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/YYYY"
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return (df.string(from: date), "\(hour):\(minute):\(second)")
    }
}

struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(SelectedDate())
    }
}
