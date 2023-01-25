//
//  SportType.swift
//  Sport
//
//  Created by Yuliya on 25/01/2023.
//

import UIKit

enum Sport: String {
    
    case ncaaFootball = "NCAA Football"
    case nfl = "NFL"
    case mlb = "MLB"
    case nba = "NBA"
    case ncaaMensBasket = "NCAA Men's Basketball"
    case nhl = "NHL"
    case ufsMma = "UFC/MMA"
    case wnba = "WNBA"
    case mls = "MLS"
    case epl = "EPL"
    case fra1 = "FRA1"
    case ger1 = "GER1"
    case esp1 = "ESP1"
    case ita1 = "ITA1"
    case uefaChamp = "UEFACHAMP"
    case fifa = "FIFA"
    
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
            return UIImage(named: "NCAAMansBask")
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
            return UIImage(named: "")
        case .ger1:
            return UIImage(named: "")
        case .esp1:
            return UIImage(named: "")
        case .ita1:
            return UIImage(named: "")
        case .uefaChamp:
            return UIImage(named: "UEFA")
        case .fifa:
            return UIImage(named: "FIFA")
        }
    }

//    var title: String {
//
//    }
}
