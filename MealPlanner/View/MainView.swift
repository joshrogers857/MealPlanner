//
//  MainView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/02/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MealPlanView()
                .tabItem {
                    Label("Meal Plan", systemImage: "list.dash")
                }
            
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RecipeListViewModel())
            .environmentObject(MealPlanViewModel())
    }
}
