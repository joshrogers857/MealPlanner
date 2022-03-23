//
//  SettingsView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 23/03/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var sex: String
    
    var body: some View {
        Form {
            Section("User") {
                Picker("Sex", selection: $sex) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
            }
        }
        .onAppear {
            //Can assert not nil because it will always have a value
            sex = UserDefaults.standard.string(forKey: "sex")!
        }
        .onChange(of: sex) {
            newValue in
            
            UserDefaults.standard.set(newValue, forKey: "sex")
        }
        .navigationTitle("Settings")
    }
    
    init() {
        if(UserDefaults.standard.string(forKey: "sex") == nil) {
            UserDefaults.standard.set("Male", forKey: "sex")
        }
        
        //Can assert not nil because of the if statement above
        sex = UserDefaults.standard.string(forKey: "sex")!
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
