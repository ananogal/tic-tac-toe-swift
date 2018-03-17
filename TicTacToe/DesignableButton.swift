//
//  PositionButton.swift
//  TicTacToe
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class DesignableButton: UIButton {
    var position: Position = Position(column: .left, row: .bottom)
}

extension DesignableButton {
    @IBInspectable
    var column: String {
        get{
            return position.column.rawValue
        }
        set{
            assert(newValue == Column.left.rawValue ||
                newValue == Column.center.rawValue ||
                newValue == Column.right.rawValue, "Invalid column")
            position.column = Column(rawValue: newValue)!
        }
    }

    @IBInspectable
    var row: String {
        get{
            return position.row.rawValue
        }
        set{
            assert(newValue == Row.top.rawValue ||
                newValue == Row.middle.rawValue ||
                newValue == Row.bottom.rawValue, "Invalid row")
            position.row = Row(rawValue: newValue)!
        }
    }

}


