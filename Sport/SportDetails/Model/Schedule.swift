//
//  Schedule.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import Foundation

struct SchedulesData: Codable {
    let schedules: [ScheduleModel]
}

struct ScheduleModel: Codable {
    let dateEvent: Date
    let eventLocation: String
    let homeTeam: String
    let leagueName: String
    let sportID: Int

    enum CodingKeys: String, CodingKey {
        case dateEvent = "date_event"
        case eventLocation = "event_location"
        case homeTeam = "home_team"
        case leagueName = "league_name"
        case sportID = "sport_id"
    }
}
