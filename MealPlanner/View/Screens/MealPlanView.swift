//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI

struct MealPlanView: View {
    @EnvironmentObject private var selectedDate: SelectedDate
    @Binding var refresh: Bool
    //@FetchRequest private var mealPlans: FetchedResults<MealPlan>
    //@FetchRequest private var mealPlanStages: FetchedResults<MealPlanStage>
    //@FetchRequest private var recipes: FetchedResults<Recipe>
    //@FetchRequest private var recipeIngredients: FetchedResults<RecipeIngredient>
    //@FetchRequest private var ingredients: FetchedResults<Ingredient>
    //@FetchRequest private var instructions: FetchedResults<Instruction>
    
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectorView()
                
                Spacer()
                
                MealPlanList(selectedDate: selectedDate.date)
                
                Spacer()
                
                /*List {
                    ForEach(instructions) {
                        instruction in
                        
                        Text(instruction.wrappedBody)
                    }
                }*/
                
                /*Button("DELETE ALL") {
                    for plan in mealPlans {
                        moc.delete(plan)
                    }
                    
                    for stage in mealPlanStages {
                        moc.delete(stage)
                    }
                    
                    for recipe in recipes {
                        moc.delete(recipe)
                    }
                    
                    for recipeIngredient in recipeIngredients {
                        moc.delete(recipeIngredient)
                    }
                    
                    for ingredient in ingredients {
                        moc.delete(ingredient)
                    }
                    
                    for instruction in instructions {
                        moc.delete(instruction)
                    }
                    
                    PersistenceController.shared.save()
                }*/
            }
            .navigationTitle("Meal Plan")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                }
            }
            .onDisappear {
                refresh = true
            }
        }
    }
    
    /*init() {
        /* _mealPlans = FetchRequest<MealPlan>(
            sortDescriptors: []
        )
        
        _mealPlanStages = FetchRequest<MealPlanStage>(
            sortDescriptors: []
        )
        
        _recipes = FetchRequest<Recipe>(
            sortDescriptors: []
        )
        
        _recipeIngredients = FetchRequest<RecipeIngredient>(
            sortDescriptors: []
        )
        
        _ingredients = FetchRequest<Ingredient>(
            sortDescriptors: []
        ) */
        
        _instructions = FetchRequest<Instruction>(
            sortDescriptors: []
        )
    }*/
    
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

/*struct MealPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(SelectedDate())
    }
}*/
