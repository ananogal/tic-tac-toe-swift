//
//  LineView.swift
//  TicTacToe
//
//  Created by Ana Nogal on 17/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import UIKit

enum LineOrientation {
    case horizontal
    case vertical
    case diagonal
}

class LineView: UIView
{
    var strike: Strike?
    var startingPoint = CGPoint.zero

    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        if let context = UIGraphicsGetCurrentContext()
        {
            context.setStrokeColor(UIColor.red.cgColor)
            context.setLineWidth(20)
            startingPoint = self.center

            if let strike = strike {
                switch strike.orientation {
                case .vertical:
                    drawVerticalLine(with: context)
                case .horizontal:
                    drawHorizontalLine(with: context)
                case .diagonal:
                    drawDiagonalLine(with: context)
                }
            }
            context.strokePath()
        }
    }

    func addConstraintsToView(_ view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func drawVerticalLine(with context: CGContext) {
        if let strike = strike {
            let thrirdOfXStartingPoint = startingPoint.x/3
            let sixthOfYStartingPoint = startingPoint.y/6
            let xValues = [frame.origin.x + thrirdOfXStartingPoint, startingPoint.x, frame.size.width - thrirdOfXStartingPoint]
            let yTop = frame.origin.y + sixthOfYStartingPoint
            let yBottom = frame.size.height - sixthOfYStartingPoint
            startingPoint.x = xValues[strike.index]

            context.move(to: startingPoint)
            context.addLine(to: CGPoint(x: xValues[strike.index], y: yTop))
            context.addLine(to: CGPoint(x: xValues[strike.index], y: yBottom))
        }
    }

    private func drawHorizontalLine(with context: CGContext) {
        if let strike = strike {
            let thrirdOfYStartingPoint = startingPoint.y/3
            let tenthOfXStartingPoint = startingPoint.x/10
            let yValues = [frame.size.height - thrirdOfYStartingPoint, startingPoint.y, frame.origin.y + thrirdOfYStartingPoint]
            let xLeft = frame.origin.x + tenthOfXStartingPoint
            let xRight = frame.size.width - tenthOfXStartingPoint
            startingPoint.y = yValues[strike.index]

            context.move(to: startingPoint)
            context.addLine(to: CGPoint(x: xLeft, y: yValues[strike.index]))
            context.addLine(to: CGPoint(x: xRight, y: yValues[strike.index]))
        }
    }

    private func drawDiagonalLine(with context: CGContext) {
        if let strike = strike {
            let fourthOfXStartingPoint = startingPoint.x/4
            let xValues = [[frame.origin.x + fourthOfXStartingPoint, frame.size.width - fourthOfXStartingPoint],
                           [frame.origin.x + fourthOfXStartingPoint, frame.size.width - fourthOfXStartingPoint]]
            let yValues = [[frame.origin.y + fourthOfXStartingPoint, frame.size.height - fourthOfXStartingPoint],
                           [frame.size.height - fourthOfXStartingPoint, frame.origin.y + fourthOfXStartingPoint]]

            context.move(to: startingPoint)
            context.addLine(to: CGPoint(x: xValues[strike.index][0], y: yValues[strike.index][0]))
            context.addLine(to: CGPoint(x: xValues[strike.index][1], y: yValues[strike.index][1]))
        }
    }
}
