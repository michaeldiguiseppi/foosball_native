//
//  FoosballTests.swift
//  FoosballTests
//
//  Created by Michael DiGuiseppi on 2/15/18.
//  Copyright © 2018 Michael DiGuiseppi. All rights reserved.
//

import XCTest
@testable import Foosball

class FoosballTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Game Class tests
    // Confirm that the Game initializer returns a Game object when passed valid parameters.
    func testGameInitializationSucceeds() {
        // Zero Score
        let zeroScoreGame = Game.init(p1_name: "Mike", p1_score: 0, p2_name: "Alan", p2_score: 10, p1_winner: false, p2_winner: true)
        XCTAssertNotNil(zeroScoreGame)
        
        // Maximum Score
        let maximumScoreGame = Game.init(p1_name: "Mike", p1_score: 0, p2_name: "Alan", p2_score: 10, p1_winner: false, p2_winner: true)
        XCTAssertNotNil(maximumScoreGame)
    }
    
    // Confirm that the Game initializer returns nil when passed an empty name or negative scores
    func testGameInitializationFails() {
        // Negative score
        let negativeScoreGame = Game.init(p1_name: "Mike", p1_score: -5, p2_name: "Alan", p2_score: 10, p1_winner: false, p2_winner: true)
        XCTAssertNil(negativeScoreGame)
        
        // Over Maximum score game
        let overMaxScoreGameP1 = Game.init(p1_name: "Mike", p1_score: 12, p2_name: "Alan", p2_score: 7, p1_winner: true, p2_winner: false)
        XCTAssertNil(overMaxScoreGameP1)
        
        let overMaxScoreGameP2 = Game.init(p1_name: "Mike", p1_score: 2, p2_name: "Alan", p2_score: 17, p1_winner: false, p2_winner: true)
        XCTAssertNil(overMaxScoreGameP2)
        
        // Empty name
        let emptyNameGame = Game.init(p1_name: "", p1_score: 0, p2_name: "Alan", p2_score: 10, p1_winner: false, p2_winner: true)
        XCTAssertNil(emptyNameGame)
    }
    
    
}
