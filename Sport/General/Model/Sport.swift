//
//  SportType.swift
//  Sport
//
//  Created by Yuliya on 25/01/2023.
//

import UIKit

enum Sport: Int, CaseIterable {

    case ncaaFootball = 1
    case nfl = 2
    case mlb = 3
    case nba = 4
    case ncaaMensBasket = 5
    case fra1 = 6
    case ger1 = 7
    case esp1 = 8
    case ita1 = 10
    case uefaChamp = 11
    case fifa = 12
    case nhl = 13
    case ufsMma = 14
    case wnba = 15
    case mls = 16
    case epl = 18
    
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
