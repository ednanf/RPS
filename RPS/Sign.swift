//
//  Sign.swift
//  RPS
//
//  Created by Ednan R. Frizzera Filho on 28/04/23.
//

import Foundation

// Random number generator.
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2) // Only needs 3 numbers, one for each hand possibility.
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐️"
        case .scissors:
            return "✌️"
        }
    }
    
    func match(against opponent: Sign) -> GameState {
        switch self {
        case .rock:
            if opponent == .scissors {
                return .win
            } else if opponent == .paper {
                return .lose
            } else {
                return .draw
            }
        case .paper:
            if opponent == .rock {
                return .win
            } else if opponent == .scissors {
                return .lose
            } else {
                return .draw
            }
        case .scissors:
            if opponent == .paper {
                return .win
            } else if opponent == .rock {
                return .lose
            } else {
                return .draw
            }
        }
    }
}
