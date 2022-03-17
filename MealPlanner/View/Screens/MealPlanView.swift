//
//  MealPlanView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import SwiftUI
import CoreData

struct MealPlanView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @State private var mealPlanService: MealPlanService!
    @State private var selectedDate: Date = Date.now
    @State private var mealPlan: MealPlan? = nil
    @State private var refresh: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectorView(date: $selectedDate)
                
                Spacer()
                
                if(mealPlan == nil) {
                    Button {
                        mealPlan = try? mealPlanService.createMealPlan(date: selectedDate)
                    } label: {
                        Label("Create Meal Plan", systemImage: "plus")
                    }
                } else {
                    List {
                        ForEach(mealPlan!.stagesArray) {
                            stage in
                            
                            Section(header: StageHeaderView(
                                stage: stage,
                                refresh: $refresh
                            )) {
                                
                                if(stage.recipesArray.isEmpty) {
                                    Text("No recipes")
                                } else {
                                    ForEach(stage.recipesArray) {
                                        recipe in
                                        
                                        RecipeListItemView(name: recipe.wrappedName)
                                    }
                                    .onDelete { offsets in
                                        for index in offsets {
                                            stage.removeFromRecipes(stage.recipesArray[index])
                                            
                                            PersistenceController.shared.save()
                                            refresh = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("MealPlanner")
            .toolbar {
                EditButton()
            }
            
        }
        .onAppear(perform: {
            mealPlanService = MealPlanService(moc: moc)
            
            mealPlan = mealPlanService.fetchMealPlan(date: selectedDate)
        })
        .onChange(of: selectedDate, perform: { newValue in
            mealPlan = mealPlanService.fetchMealPlan(date: newValue)
        })
        .onChange(of: refresh, perform: { newValue in
            if(newValue == true) {
                mealPlan = mealPlanService.fetchMealPlan(date: selectedDate)
                refresh = false
            }
        })
    }
    
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
        MealPlanView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
