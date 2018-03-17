//
//  GridTests.swift
//  TicTacToeTests
//
//  Created by Ana Nogal on 16/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GridShould: XCTestCase {

    var grid: Grid!

    override func setUp() {
        super.setUp()
        grid = Grid()
    }

    override func tearDown() {
        grid = nil
        super.tearDown()
    }

    func test_initializeWithAGridWithEmptyCells() {
        XCTAssertEqual(grid.cellState(at: Position(column: .left, row: .top)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .left, row: .middle)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .left, row: .bottom)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .center, row: .top)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .center, row: .middle)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .center, row: .bottom)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .right, row: .top)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .right, row: .middle)), .empty)
        XCTAssertEqual(grid.cellState(at: Position(column: .right, row: .bottom)), .empty)
    }

    func test_verifyIfIsEmpty() {
        grid.markCell(.x, at: Position(column: .left, row: .bottom))
        grid.markCell(.o, at: Position(column: .left, row: .middle))
        grid.markCell(.x, at: Position(column: .left, row: .top))

        XCTAssertFalse(grid.isFilled)
    }

    func test_verifyIfGridIsFull() {

        grid.markCell(.x, at: Position(column: .left, row: .bottom))
        grid.markCell(.o, at: Position(column: .left, row: .middle))
        grid.markCell(.x, at: Position(column: .left, row: .top))

        grid.markCell(.x, at: Position(column: .center, row: .bottom))
        grid.markCell(.o, at: Position(column: .center, row: .middle))
        grid.markCell(.x, at: Position(column: .center, row: .top))

        grid.markCell(.x, at: Position(column: .right, row: .bottom))
        grid.markCell(.o, at: Position(column: .right, row: .middle))
        grid.markCell(.x, at: Position(column: .right, row: .top))

        XCTAssertTrue(grid.isFilled)
    }
}
