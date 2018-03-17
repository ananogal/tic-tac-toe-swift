//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameShould: XCTestCase {

    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    override func tearDown() {
        game = nil
        super.tearDown()
    }

    func test_startGameWithPlayerX() {
        let nextTurn = game.currentTurn
        let playerXMark = Player.x.rawValue

        XCTAssertEqual(nextTurn, playerXMark)
    }

    func test_returnIfACellIsEmptyOrFull() {
        XCTAssertTrue(game.isCellEmpty(at: Position(column: .left, row: .bottom)))
    }

    func test_startInWaintingMoveState() {
        XCTAssertEqual(game.state, GameState.waitingMove)
    }

    func test_updateStateToPlayerXPlayedAfterPlayerXHasPlayed() {
        game.markCell(at: Position(column: .left, row: .bottom))

        XCTAssertEqual(game.state, .playerXPlayed)
    }

    func test_updateStateToPlayerOPlayedAfterPlayerOHasPlayed() {
        game.markCell(at: Position(column: .left, row: .bottom))
        game.markCell(at: Position(column: .left, row: .bottom))

        XCTAssertEqual(game.state, .playerOPlayed)
    }

    func test_setStateToPlayerXWinsForColumns() {
        game.markCell(at: Position(column: .left, row: .bottom))
        game.markCell(at: Position(column: .center, row: .bottom))
        game.markCell(at: Position(column: .left, row: .middle))
        game.markCell(at: Position(column: .right, row: .bottom))
        game.markCell(at: Position(column: .left, row: .top))

        XCTAssertEqual(game.state, .playerXWins)
    }

    func test_setStateToPlayerOWinsForColumns() {
        game.markCell(at: Position(column: .center, row: .bottom))
        game.markCell(at: Position(column: .left, row: .bottom))
        game.markCell(at: Position(column: .right, row: .bottom))
        game.markCell(at: Position(column: .left, row: .middle))
        game.markCell(at: Position(column: .center, row: .middle))
        game.markCell(at: Position(column: .left, row: .top))

        XCTAssertEqual(game.state, .playerOWins)
    }

    func test_setStateToPlayerXWinsForRows() {
        game.markCell(at: Position(column: .left, row: .bottom))
        game.markCell(at: Position(column: .left, row: .middle))
        game.markCell(at: Position(column: .center, row: .bottom))
        game.markCell(at: Position(column: .left, row: .top))
        game.markCell(at: Position(column: .right, row: .bottom))

        XCTAssertEqual(game.state, .playerXWins)
    }

    func test_setStateToPlayerXWinsForDiagonal() {
        game.markCell(at: Position(column: .left, row: .bottom))
        game.markCell(at: Position(column: .left, row: .middle))
        game.markCell(at: Position(column: .center, row: .middle))
        game.markCell(at: Position(column: .left, row: .top))
        game.markCell(at: Position(column: .right, row: .top))

        XCTAssertEqual(game.state, .playerXWins)
    }
}
