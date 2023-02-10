//
//  Team.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import Foundation

struct Empty: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let abbreviation: String
    let conference: Conference?
    let mascot: String
    let name: String
    let record: String
    let teamID: Int
    let division: Conference?

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case conference
        case mascot
        case name
        case record
        case teamID = "team_id"
        case division
    }
}

struct Conference: Codable {
    let conferenceID: Int?
    let divisionID: Int
    let name: String
    let sportID: Int

    enum CodingKeys: String, CodingKey {
        case conferenceID = "conference_id"
        case divisionID = "division_id"
        case name
        case sportID = "sport_id"
    }
}
