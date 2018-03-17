//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ana Nogal on 14/03/2018.
//  Copyright © 2018 Ana Nogal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet var movesButtons: [DesignableButton]!
    @IBOutlet weak var gridImageView: UIImageView!
    @IBOutlet weak var helperImageView: UIImageView!
    @IBOutlet weak var resetGameButton: UIButton!

    let GAME_TIE = "Game is Tie"
    let LINE_VIEW_IDENTIFIER = "liveView"
    let EMPTY_IMAGE = "empty"
    let TURN = "Turn: Player"
    let PLAYER = "Player"
    let WINS = "Wins!"
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUp()
    }
    
    private func updateButtonImage(_ sender: DesignableButton, imageName: String) {
        let image = UIImage(named: imageName)
        sender.setBackgroundImage(image, for: .normal)
    }

    private func updateGame(_ sender: DesignableButton) {
        game.markCell(at: sender.position)
    }

    @IBAction func buttonTapped(_ sender: DesignableButton) {
        if game.isCellEmpty(at: sender.position) {
            updateButtonImage(sender, imageName: game.currentTurn)
            updateGame(sender)
            updateUI()
        }
    }

    fileprivate func setEmptyImageToButtons() {
        for button in movesButtons {
            updateButtonImage(button, imageName: EMPTY_IMAGE)
        }
    }

    @IBAction func retartGame() {
        clearHelperView()
        setEmptyImageToButtons()
        startUp()
    }

    private func startUp(){
        game = Game()
        initialiseResetButton()
        updateUI()
    }

    private func initialiseResetButton() {
        resetGameButton.layer.borderWidth = 1
        resetGameButton.layer.borderColor = UIColor.black.cgColor
        resetGameButton.layer.cornerRadius = 5
    }

    private func clearHelperView() {
        view.sendSubview(toBack: helperImageView)
        for view in helperImageView.subviews {
            view.removeFromSuperview()
        }
    }

    private func updateUI() {
        switch game.state {
        case .waitingMove, .playerXPlayed, .playerOPlayed:
            gameStateLabel.text = "\(TURN) \(game.currentTurn)"
        case .playerXWins, .playerOWins:
            gameStateLabel.text = "\(PLAYER) \(game.currentTurn) \(WINS)"
            drawLine()
        case .tie:
            gameStateLabel.text = GAME_TIE
        }
    }

    private func drawLine() {
        let lineView = LineView(frame: CGRect(x: helperImageView.frame.origin.x, y: helperImageView.frame.origin.y, width: helperImageView.frame.size.width, height: helperImageView.frame.size.height))
        lineView.accessibilityIdentifier = LINE_VIEW_IDENTIFIER
        lineView.strike = game.strike
        helperImageView.addSubview(lineView)
        view.bringSubview(toFront: helperImageView)
        lineView.backgroundColor = UIColor.clear

        lineView.addConstraintsToView(helperImageView)
        lineView.layoutIfNeeded()
    }
}
