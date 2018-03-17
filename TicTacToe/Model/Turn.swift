//
//  Turn.swift
//  TicTacToe
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import Foundation

enum Player: String, Equatable {
    case x = "X"
    case o = "O"
    case none = ""

    static func ==(lhs: Player, rhs:Player) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

struct Turn {
    private(set) var currentPlayer: Player
    
    init() {
        currentPlayer = .x
    }
    
    func toString() -> String {
        return currentPlayer.rawValue
    }

    mutating func update() {
        currentPlayer = currentPlayer == .x ? .o : .x
    }
}
