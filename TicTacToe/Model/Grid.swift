//
//  Grid.swift
//  TicTacToe
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import Foundation

enum CellState {
    case empty
    case full
}

class Grid {
    private var cells: [Position: Player]
    private let MAX_COLUMNS = 3
    private let MAX_ROWS = 3
    private(set) var strike: Strike?

    var isFilled: Bool {
        return cells.filter{ $0.value != .none }.count == MAX_ROWS * MAX_COLUMNS
            ? true
            : false
    }

    init() {
        cells = [Position: Player]()
        initGridCells()
    }

    func cellState(at position: Position) -> CellState {
        return cells[position] == Player.none ? .empty : .full
    }

    func hasColumnFilled(with player: Player) -> Bool {
        for index in 0..<Row.allValues.count {
            let row = Row.allValues[index]
            if cells[Position(column: .left, row: row)] == player
                && cells[Position(column: .center, row: row)] == player
                && cells[Position(column: .right, row: row)] == player {
                strike = Strike(orientation: .horizontal, index: MAX_ROWS - index - 1)
                return true
            }
        }

        return false
    }

    func hasRowsFilled(with player: Player) -> Bool {
        for index in 0..<Column.allValues.count {
            let column = Column.allValues[index]
            if cells[Position(column: column, row: .top)] == player
                && cells[Position(column: column, row: .middle)] == player
                && cells[Position(column: column, row: .bottom)] == player {
                strike = Strike(orientation: .vertical, index: index)
                return true
            }
        }

        return false
    }

    func hasDiagonalFilled(with player: Player) -> Bool{
        if cells[Position(column: .left, row: .bottom)] == player
            && cells[Position(column: .center, row: .middle)] == player
            && cells[Position(column: .right, row: .top)] == player {
            strike = Strike(orientation: .diagonal, index: 1)
            return true
        }

        if cells[Position(column: .left, row: .top)] == player
            && cells[Position(column: .center, row: .middle)] == player
            && cells[Position(column: .right, row: .bottom)] == player {
            strike = Strike(orientation: .diagonal, index: 0)
            return true
        }
        return false
    }

    func markCell(_ mark: Player, at position: Position) {
        cells[position] = mark
    }

    private func initGridCells() {
        cells = [Position(column: .left, row: .top): .none,
                Position(column: .left, row: .middle): .none,
                Position(column: .left, row: .bottom): .none,
                Position(column: .center, row: .top): .none,
                Position(column: .center, row: .middle): .none,
                Position(column: .center, row: .bottom): .none,
                Position(column: .right, row: .top): .none,
                Position(column: .right, row: .middle): .none,
                Position(column: .right, row: .bottom): .none
        ]
    }

}
