//
//  SportData.swift
//  Sport
//
//  Created by Yuliya on 01/02/2023.
//

import Foundation
import UIKit

struct SportData: Decodable {
    let sports: [SportModel]
}

struct SportModel: Decodable {
    let sportID: Int
    let sportName: String

    enum CodingKeys: String, CodingKey {
        case sportID = "sport_id"
        case sportName = "sport_name"
    }
}

struct GeneralSportModel {
    let sportID: Int
    let sportName: String
    let sportType: Sport
    
    var image: UIImage? {
        switch sportType {
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
        case .uefaEuro:
            return UIImage(named: "UEFAEURO")
        case .fifa:
            return UIImage(named: "FIFA")
        case .jpn1:
            return UIImage(named: "")
        }
    }
}
