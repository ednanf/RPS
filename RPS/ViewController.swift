//
//  ViewController.swift
//  RPS
//
//  Created by Ednan R. Frizzera Filho on 28/04/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var appSign: UILabel! // Represents the computer's sign
    @IBOutlet var statusOfTheGame: UILabel!
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
        
        
    }
    // MARK: - IBActions
    
    @IBAction func rockButton(_ sender: UIButton) {
        play(userSign: .rock)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsButton(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        updateUI(forState: .start)
    }
    
    // MARK: - Functions
    
    func updateUI(forState state: GameState) {
        statusOfTheGame.text = state.statusLabelProperty
        switch state {
        case .start:
            view.backgroundColor          = UIColor.systemBackground
            
            statusOfTheGame.textColor     = .label // .label adapts to light and dark modes.
            
            appSign.text                  = "🤖"
            
            playAgainButton.isHidden      = true
            rockButton.isHidden           = false
            paperButton.isHidden          = false
            scissorsButton.isHidden       = false
            
            rockButton.isEnabled          = true
            paperButton.isEnabled         = true
            scissorsButton.isEnabled      = true
        case .win:
            statusOfTheGame.textColor     = state.color // The color was already setup in GameState.color
        case .lose:
            statusOfTheGame.textColor     = state.color
        case .draw:
            statusOfTheGame.textColor     = state.color
        }
    }
 
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameMatch = userSign.match(against: computerSign)
        updateUI(forState: gameMatch)
        
        appSign.text = computerSign.emoji
        
        rockButton.isHidden           = true
        paperButton.isHidden          = true
        scissorsButton.isHidden       = true
        
        rockButton.isEnabled          = false
        paperButton.isEnabled         = false
        scissorsButton.isEnabled      = false
        
        playAgainButton.isHidden      = false
    }
    
}
