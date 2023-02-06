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
    let sportImage: UIImage
}
