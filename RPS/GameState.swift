//
//  GameState.swift
//  RPS
//
//  Created by Ednan R. Frizzera Filho on 28/04/23.
//

import Foundation
import UIKit

enum GameState {
    case start, win, lose, draw
    
    var statusLabelProperty: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors!"
        case .win:
            return "You Win!"
        case .lose:
            return "You Lose!"
        case .draw:
            return "It's a Draw!"
        }
    }
    
    var color: UIColor {
        switch self {
        case .start:
            return .blue
        case .win:
            return .green
        case .lose:
            return .red
        case .draw:
            return .yellow
        }
    }
}
