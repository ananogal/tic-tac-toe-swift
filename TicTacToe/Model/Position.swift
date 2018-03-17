//
//  Position.swift
//  TicTacToe
//
//  Created by Ana Nogal on 15/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

struct Position: Equatable, Hashable {
    var hashValue: Int
    
    var column: Column
    var row: Row

    static func ==(lsh: Position, rsh: Position) -> Bool {
        return lsh.column == rsh.column && lsh.row == rsh.row
    }

    init(column: Column, row: Row){
        self.column = column
        self.row = row
        self.hashValue = row.rawValue.djb2hash ^ column.rawValue.djb2hash
    }
}

enum Column: String {

    case left = "left"
    case center = "center"
    case right = "right"

    static let allValues = [left, center, right]
}

enum Row : String {
    case top = "top"
    case middle = "middle"
    case bottom = "bottom"

    static let allValues = [top, middle, bottom]
}

