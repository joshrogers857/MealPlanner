//
//  StageHeaderView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//

import SwiftUI

struct StageHeaderView: View {
    @FetchRequest private var stage: FetchedResults<MealPlanStage>
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var showing: Bool = false
    
    var body: some View {
            HStack {
                Text(stage[0].wrappedName)
                
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
                stage: stage[0]
            )
        }
    }
    
    init(stage: MealPlanStage) {
        _stage = FetchRequest<MealPlanStage>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "self == %@", stage)
        )
    }
}

/* struct StageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StageHeaderView(stageName: "Example")
    }
}*/
