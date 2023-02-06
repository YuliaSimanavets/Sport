//
//  SportType.swift
//  Sport
//
//  Created by Yuliya on 25/01/2023.
//

import UIKit

enum Sport: CaseIterable {
    
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
