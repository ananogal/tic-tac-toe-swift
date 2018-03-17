//
//  GameStateCalculator.swift
//  TicTacToe
//
//  Created by Ana Nogal on 16/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

struct GameStateCalculator {
    private var grid: Grid
    private var player: Player

    init(with grid: Grid, for player:Player) {
        self.grid = grid
        self.player = player
    }

    func applyRules() -> GameState {
        if hasColumnsFilled() {
            return winner()
        }

        if hasRowsFilled() {
            return winner()
        }

        if hasDiagonalsFilled() {
            return winner()
        }

        if grid.isFilled {
            return .tie
        }

        return player == .x ? .playerXPlayed : .playerOPlayed
    }

    private func winner() -> GameState {
        return player == .x ? .playerXWins : .playerOWins
    }

    private func hasColumnsFilled() -> Bool {
       return grid.hasColumnFilled(with: player)
    }

    private func hasRowsFilled() -> Bool {
        return grid.hasRowsFilled(with: player)
    }

    private func hasDiagonalsFilled() -> Bool {
        return grid.hasDiagonalFilled(with: player)
    }
}
