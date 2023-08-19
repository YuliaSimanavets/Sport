//
//  Team.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import Foundation

struct TeamsData: Codable {
    let teams: [TeamModel]
}

struct TeamModel: Codable {
    let abbreviation: String
    let mascot: String
    let name: String
    let record: String
    let teamID: Int
    let conference: Conference?

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case mascot
        case name
        case record
        case teamID = "team_id"
        case conference
    }
}

struct Conference: Codable {
    let sportID: Int

    enum CodingKeys: String, CodingKey {
        case sportID = "sport_id"
    }
}
