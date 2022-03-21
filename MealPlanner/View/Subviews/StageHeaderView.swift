//
//  StageHeaderView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct StageHeaderView: View {
    var stage: MealPlanStage
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var showing: Bool = false
    
    var body: some View {
            HStack {
                Text(stage.wrappedName)
                
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Button {
                    showing = true
                } label: {
                    if(orientation.isLandscape) {
                        Label("Add Recipe",
                              systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    } else {
                        Label("Add Recipe",
                              systemImage: "plus")
                            .labelStyle(.iconOnly)
                    }
                }
                
                Spacer()
            }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        .sheet(isPresented: $showing) {
            AddRecipePickerView(
                isDone: $showing,
                stage: stage
            )
        }
    }
}

/* struct StageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StageHeaderView(stageName: "Example")
    }
}*/
