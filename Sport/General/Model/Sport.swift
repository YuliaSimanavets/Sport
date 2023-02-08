//
//  SportType.swift
//  Sport
//
//  Created by Yuliya on 25/01/2023.
//

import UIKit

enum Sport: Int, CaseIterable {

    case ncaaFootball
    case nfl
    case mlb
    case nba
    case ncaaMensBasket
    case fra1
    case ger1
    case esp1
    case ita1
    case uefaChamp
    case fifa
    case nhl
    case ufsMma
    case wnba
    case mls
    case epl
    
    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .ncaaFootball
        case 2: self = .nfl
        case 3: self = .mlb
        case 4: self = .nba
        case 5: self = .ncaaMensBasket
        case 6: self = .nhl
        case 7: self = .ufsMma
        case 8: self = .wnba
        case 10: self = .mls
        case 11: self = .epl
        case 12: self = .fra1
        case 13: self = .ger1
        case 14: self = .esp1
        case 15: self = .ita1
        case 16: self = .uefaChamp
        case 18: self = .fifa
        default: return nil
        }
    }
    
    var image: UIImage? {
        switch self {
        case .ncaaFootball:
            return UIImage(named: "ncaaFootball")
        case .nfl:
            return UIImage(named: "NFL")
        case .mlb:
            return UIImage(named: "MLB")
        case .nba:
            return UIImage(named: "NBA")
        case .ncaaMensBasket:
            return UIImage(named: "NCAAMensBask")
        case .nhl:
            return UIImage(named: "NHL")
        case .ufsMma:
            return UIImage(named: "UFC")
        case .wnba:
            return UIImage(named: "WNBA")
        case .mls:
            return UIImage(named: "MLS")
        case .epl:
            return UIImage(named: "EPL")
        case .fra1:
            return UIImage(named: "FRA1")
        case .ger1:
            return UIImage(named: "GER1")
        case .esp1:
            return UIImage(named: "ESP1")
        case .ita1:
            return UIImage(named: "ITA1")
        case .uefaChamp:
            return UIImage(named: "UEFA")
        case .fifa:
            return UIImage(named: "FIFA")
        }
    }
}
