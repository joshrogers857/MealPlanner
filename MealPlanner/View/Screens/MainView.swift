//
//  MainView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/02/2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var selectedDate = SelectedDate()
    
    var body: some View {
        TabView {
            MealPlanView()
                .tabItem {
                    Label("Meal Plan", systemImage: "list.dash")
                }
            
            RecipeView()
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
            
            NutritionView()
                .tabItem {
                    Label("Nutrition", systemImage: "figure.stand")
                }
        }
        .environmentObject(selectedDate)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
