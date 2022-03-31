//
//  EditRecipeAddInstructionView.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 31/03/2022.
//

import SwiftUI

struct EditRecipeAddInstructionView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FocusState private var keyboardIsFocused: Bool
    
    var recipe: Recipe
    var instructions: [Instruction]
    @Binding var isShowing: Bool
    
    @State private var instructionBody = ""
    
    var body: some View {
        VStack {
            Text("Add Instruction")
                .font(.largeTitle)
                .padding(.top, 8)
            
            Form {
                TextField("Instruction", text: $instructionBody)
                    .focused($keyboardIsFocused)
                
                Button {
                    let instruction = Instruction(context: moc)
                    
                    if(instructions.last != nil) {
                        instruction.stepNumber = (instructions.last!.stepNumber + 1)
                    }
                    
                    instruction.body = instructionBody
                    
                    recipe.addToInstructions(instruction)
                    
                    PersistenceController.shared.save()
                    
                    isShowing = false
                } label: {
                    Text("Add Instruction")
                }
                .disabled(instructionBody.isEmpty)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    keyboardIsFocused = false
                }
            }
        }
    }
}

/*struct EditRecipeAddInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeAddInstructionView()
    }
}*/
