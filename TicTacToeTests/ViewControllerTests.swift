//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Ana Nogal on 14/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import XCTest
import UIKit
@testable import TicTacToe

class ViewControllerTests: XCTestCase {

    var controller: ViewController!

    override func setUp() {
        super.setUp()
        controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller.loadViewIfNeeded()
    }

    override func tearDown() {
        controller = nil
        super.tearDown()
    }

    func test_shouldBeInitializedWithAGame() {
        XCTAssertNotNil(controller.game)
    }

    func test_shouldInitializeGameWithTurnForPlayerX() {
        XCTAssertEqual(controller.gameStateLabel.text, "Turn: Player X")
    }

    func test_inicializeButtonWithBorderAndCornerRadius() {
        XCTAssertEqual(controller.resetGameButton.layer.borderWidth, 1)
        XCTAssertEqual(controller.resetGameButton.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(controller.resetGameButton.layer.cornerRadius, 5)
    }

    func test_shouldUpdateButtonImageToPlayerInTurnWhenButtonIsTappedAndCellIsEmpty() {
        let button = DesignableButton()
        let image = UIImage(named: "X")
        XCTAssertTrue(controller.game.isCellEmpty(at: button.position))

        controller.buttonTapped(button)

        XCTAssertEqual(button.currentBackgroundImage, image)
    }

    func test_shouldUpdateUIToReflectNewTurn() {
        let buttonX00 = DesignableButton()
        buttonX00.position = Position(column: .left, row: .bottom)

        controller.buttonTapped(buttonX00)

        XCTAssertEqual(controller.gameStateLabel.text, "Turn: Player O")
    }

    func test_shouldNotUpdateImageOfButtonIfCellIsNotEmptyAndStayInSameTurn() {
        let button = DesignableButton()
        button.position = Position(column: .left, row: .bottom)
        let imageX = UIImage(named: "X")
        XCTAssertEqual(controller.game.currentTurn, "X")

        controller.buttonTapped(button)
        XCTAssertEqual(controller.game.currentTurn, "O")

        controller.buttonTapped(button)

        XCTAssertEqual(button.currentBackgroundImage, imageX)
        XCTAssertEqual(controller.game.currentTurn, "O")
    }

    func test_shouldUpdateUIToPlayerXWins() {
        createColumnsScenario()

        XCTAssertEqual(controller.gameStateLabel.text, "Player X Wins!")
        XCTAssertEqual(controller.helperImageView.subviews.count, 1)
    }

    func test_updateUIToTieGameWhenThereIsNoWinners() {
        createTieScenario()
        XCTAssertEqual(controller.gameStateLabel.text, "Game is Tie")
        XCTAssertEqual(controller.helperImageView.subviews.count, 0)
    }

    func test_restartGameOnResartGame() {
        let imageEmpty = UIImage(named: "empty")

        controller.retartGame()

        XCTAssertEqual(controller.gameStateLabel.text, "Turn: Player X")

        for button in controller.movesButtons {
            XCTAssertEqual(button.currentBackgroundImage, imageEmpty)
        }

        XCTAssertEqual(controller.helperImageView.subviews.count, 0)
        XCTAssertEqual(controller.game.state, .waitingMove)
    }

    func createColumnsScenario() {
        let buttonX00 = DesignableButton()
        buttonX00.position = Position(column: .left, row: .bottom)
        let buttonO10 = DesignableButton()
        buttonO10.position = Position(column: .center, row: .bottom)
        let buttonX01 = DesignableButton()
        buttonX01.position = Position(column: .left, row: .middle)
        let buttonO20 = DesignableButton()
        buttonO20.position = Position(column: .right, row: .bottom)
        let buttonX02 = DesignableButton()
        buttonX02.position = Position(column: .left, row: .top)

        controller.buttonTapped(buttonX00)
        controller.buttonTapped(buttonO10)
        controller.buttonTapped(buttonX01)
        controller.buttonTapped(buttonO20)
        controller.buttonTapped(buttonX02)
    }

    func createTieScenario() {
        let buttonX10 = DesignableButton()
        buttonX10.position = Position(column: .center, row: .bottom)
        let buttonO00 = DesignableButton()
        buttonO00.position = Position(column: .left, row: .bottom)
        let buttonX20 = DesignableButton()
        buttonX20.position = Position(column: .right, row: .bottom)
        let buttonO11 = DesignableButton()
        buttonO11.position = Position(column: .center, row: .middle)
        let buttonX01 = DesignableButton()
        buttonX01.position = Position(column: .left, row: .middle)
        let buttonO21 = DesignableButton()
        buttonO21.position = Position(column: .right, row: .middle)
        let buttonX02 = DesignableButton()
        buttonX02.position = Position(column: .left, row: .top)
        let buttonO12 = DesignableButton()
        buttonO12.position = Position(column: .center, row: .top)
        let buttonX22 = DesignableButton()
        buttonX22.position = Position(column: .right, row: .top)

        controller.buttonTapped(buttonX10)
        controller.buttonTapped(buttonO00)
        controller.buttonTapped(buttonX20)
        controller.buttonTapped(buttonO11)
        controller.buttonTapped(buttonX01)
        controller.buttonTapped(buttonO21)
        controller.buttonTapped(buttonX02)
        controller.buttonTapped(buttonO12)
        controller.buttonTapped(buttonX22)
    }

}
