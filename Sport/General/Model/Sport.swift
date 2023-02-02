//
//  SportType.swift
//  Sport
//
//  Created by Yuliya on 25/01/2023.
//

import UIKit

enum Sport: Codable, CaseIterable {
    
    case ncaaFootball
    case nfl
    case mlb
    case nba
    case ncaaMensBasket
    case nhl
    case ufsMma
    case wnba
    case mls
    case epl
    case fra1
    case ger1
    case esp1
    case ita1
    case uefaChamp
    case fifa
    
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

    var title: String {
        switch self {
        case .ncaaFootball:
            return "NCAA Football"
        case .nfl:
            return "NFL"
        case .mlb:
            return "MLB"
        case .nba:
            return "NBA"
        case .ncaaMensBasket:
            return "NCAA Man's Basketball"
        case .nhl:
            return "NHL"
        case .ufsMma:
            return "UFC/MMA"
        case .wnba:
            return "WNBA"
        case .mls:
            return "MLS"
        case .epl:
            return "EPL"
        case .fra1:
            return "FRA1"
        case .ger1:
            return "GER1"
        case .esp1:
            return "ESP1"
        case .ita1:
            return "ITA1"
        case .uefaChamp:
            return "UEFACHAMP"
        case .fifa:
            return "FIFA"
        }
    }
}



//case ncaaFootball = "NCAA Football"
//case nfl = "NFL"
//case mlb = "MLB"
//case nba = "NBA"
//case ncaaMensBasket = "NCAA Men's Basketball"
//case nhl = "NHL"
//case ufsMma = "UFC/MMA"
//case wnba = "WNBA"
//case mls = "MLS"
//case epl = "EPL"
//case fra1 = "FRA1"
//case ger1 = "GER1"
//case esp1 = "ESP1"
//case ita1 = "ITA1"
//case uefaChamp = "UEFACHAMP"
//case fifa = "FIFA"
