//
//  Game.swift
//  Foosball
//
//  Created by Michael DiGuiseppi on 2/15/18.
//  Copyright © 2018 Michael DiGuiseppi. All rights reserved.
//

import UIKit

class Game {
    //MARK: Properties
    
    var p1_name: String
    var p1_score: Int
    var p2_name: String
    var p2_score: Int
    var p1_winner: Bool
    var p2_winner: Bool
    
    //MARK: Initialization
    
    init?(p1_name: String, p1_score: Int, p2_name: String, p2_score: Int, p1_winner: Bool, p2_winner: Bool) {
        
        guard !p1_name.isEmpty else {
            return nil
        }
        
        guard !p2_name.isEmpty else {
            return nil
        }
        
        guard !(p1_score < 0) else {
            return nil
        }
        
        guard !(p1_score > 10) else {
            return nil
        }
        
        guard !(p2_score < 0) else {
            return nil
        }
        
        guard !(p2_score > 10) else {
            return nil
        }
        
        self.p1_name = p1_name
        self.p1_score = p1_score
        self.p2_name = p2_name
        self.p2_score = p2_score
        self.p1_winner = p1_winner
        self.p2_winner = p2_winner
    }
}
