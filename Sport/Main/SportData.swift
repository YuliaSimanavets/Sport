//
//  SportData.swift
//  Sport
//
//  Created by Yuliya on 01/02/2023.
//

import Foundation

struct SportData: Codable {
    let sports: [SportModel]
}

struct SportModel: Codable {
    let sportID: Int
    let sportName: String

    enum CodingKeys: String, CodingKey {
        case sportID = "sport_id"
        case sportName = "sport_name"
    }
}
