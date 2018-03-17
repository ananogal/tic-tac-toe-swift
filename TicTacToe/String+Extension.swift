//
//  String+Extension.swift
//  TicTacToe
//
//  Created by Ana Nogal on 17/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import Foundation
extension String {
    var djb2hash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
}
