//
//  InstructionTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 17/03/2022.
//

import XCTest
@testable import MealPlanner

class InstructionTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_Instruction_WhenBodyIsNotNil_WrappedBodyShouldReturnBody() {
        let instruction = Instruction(context: persistenceController.container.viewContext)
        let body = "test"
        
        instruction.body = body
        
        XCTAssertEqual(instruction.wrappedBody, body)
    }
    
    func test_Instruction_WhenBodyIsNil_WrappedBodyShouldReturnUnknownBody() {
        let instruction = Instruction(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(instruction.wrappedBody, "Unknown body")
    }
}
