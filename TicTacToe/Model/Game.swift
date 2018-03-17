//
//  Game.swift
//  TicTacToe
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import Foundation

enum GameState {
    case playerXPlayed
    case playerOPlayed
    case waitingMove
    case playerXWins
    case playerOWins
    case tie
}

struct Game {
    private var turn: Turn
    private var grid: Grid
    private(set) var state: GameState

    var strike: Strike? {
        return grid.strike
    }

    var currentTurn: String {
        return turn.toString()
    }

    init() {
        turn = Turn()
        grid = Grid()
        state = .waitingMove
    }
    
    func isCellEmpty(at position: Position) -> Bool {
        return grid.cellState(at: position) == .empty
    }

    mutating func markCell(at position: Position) {
        grid.markCell(turn.currentPlayer, at: position)
        updateState()
    }

    private mutating func updateState() {
        let stateCalculator = GameStateCalculator(with: grid, for: turn.currentPlayer)
        state = stateCalculator.applyRules()
        if !gameIsOver() {
            turn.update()
        }
    }

    func gameIsOver() -> Bool {
        return state == .playerOWins || state == .playerXWins || state == .tie
    }
}
