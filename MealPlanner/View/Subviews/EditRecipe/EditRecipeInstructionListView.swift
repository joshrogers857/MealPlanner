//
//  EditRecipeInstructionListView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 31/03/2022.
//

import SwiftUI

struct EditRecipeInstructionListView: View {
    @Environment(\.managedObjectContext) private var moc
    
    var recipe: Recipe
    @Binding var instructions: [Instruction]
    @State private var isShowing = false
    
    var body: some View {
        List {
            HStack {
                Spacer()
                
                Button {
                    isShowing = true
                } label: {
                    Label("Add instruction", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
            }
            
            if(instructions.isEmpty) {
                Text("No instructions")
            } else {
                ForEach(instructions, id: \.self) {
                    instruction in
                    
                    HStack {
                        Text("\(instruction.stepNumber). \(instruction.wrappedBody)")
                    
                        Spacer()
                        
                        Button {
                            moc.delete(instruction)
                            
                            PersistenceController.shared.save()
                            
                            let instructions = recipe.instructionsArray
                            
                            for (index, instruction) in instructions.enumerated() {
                                instruction.stepNumber = Int16(index + 1)
                            }
                            
                            PersistenceController.shared.save()
                        } label: {
                            Label("Delete instruction", systemImage: "trash.fill")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                }
            }
        }
        .sheet(isPresented: $isShowing) {
            EditRecipeAddInstructionView(recipe: recipe, instructions: instructions, isShowing: $isShowing)
        }
    }
}

/*struct EditRecipeInstructionListView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeInstructionListView()
    }
}*/
