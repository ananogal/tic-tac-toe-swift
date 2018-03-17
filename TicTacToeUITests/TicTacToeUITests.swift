//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Ana Nogal on 17/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func test_verifiesThatADiagonalLineIsDrawInTheScreenWhenPlayerHasADiagonalWithHisSymbol() {

        XCTAssertFalse(app.isDisplayingLineView)

        let buttonLeftTop = app.buttons["ButtonLeftTop"]
        buttonLeftTop.tap()
        let buttonLeftMiddle = app.buttons["ButtonLeftMiddle"]
        buttonLeftMiddle.tap()
        let buttonCenterMiddle = app.buttons["ButtonCenterMiddle"]
        buttonCenterMiddle.tap()
        let buttonLeftBottom = app.buttons["ButtonLeftBottom"]
        buttonLeftBottom.tap()
        let buttonRightBottom = app.buttons["ButtonRightBottom"]
        buttonRightBottom.tap()

        XCTAssertTrue(app.isDisplayingLineView)
    }

    func test_verifyThatAVerticalLineIsDrawWhenPlayerHasAColumnWithHisSymbol() {

        XCTAssertFalse(app.isDisplayingLineView)

        let buttonLeftTop = app.buttons["ButtonLeftTop"]
        buttonLeftTop.tap()
        let buttonCenterTop = app.buttons["ButtonCenterTop"]
        buttonCenterTop.tap()
        let buttonLeftMiddle = app.buttons["ButtonLeftMiddle"]
        buttonLeftMiddle.tap()
        let buttonCenterMiddle = app.buttons["ButtonCenterMiddle"]
        buttonCenterMiddle.tap()
        let buttonLeftBottom = app.buttons["ButtonLeftBottom"]
        buttonLeftBottom.tap()

        XCTAssertTrue(app.isDisplayingLineView)
    }

    func test_verifyThatAHorizontalLineIsDrawWhenPlayerHasARowWithHisSymbol() {

        XCTAssertFalse(app.isDisplayingLineView)

        let buttonLeftBottom = app.buttons["ButtonLeftBottom"]
        buttonLeftBottom.tap()
        let buttonLeftMiddle = app.buttons["ButtonLeftMiddle"]
        buttonLeftMiddle.tap()
        let buttonCenterButtom = app.buttons["ButtonCenterButtom"]
        buttonCenterButtom.tap()
        let buttonCenterMiddle = app.buttons["ButtonCenterMiddle"]
        buttonCenterMiddle.tap()
        let buttonRightBottom = app.buttons["ButtonRightBottom"]
        buttonRightBottom.tap()

        XCTAssertTrue(app.isDisplayingLineView)
    }
}


extension XCUIApplication {
    var isDisplayingLineView: Bool {
        return otherElements["liveView"].exists
    }
}
