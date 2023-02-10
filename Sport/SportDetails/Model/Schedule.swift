//
//  Schedule.swift
//  Sport
//
//  Created by Yuliya on 08/02/2023.
//

import Foundation

struct Schedules: Codable {
    let schedules: [Schedule]
}

struct Schedule: Codable {
    let attendance: Int
    let awayScore: Int
    let awayTeam: String
    let awayTeamID: Int
    let broadcast: Broadcast
    let conferenceCompetition: Bool
    let dateEvent: Date
    let eventID: String
    let eventLocation: String
    let eventName: String
    let eventStatus: EventStatus
    let eventStatusDetail: EventStatusDetail
    let eventUUID: String
    let homeScore: Int
    let homeTeam: String
    let homeTeamID: Int
    let id: String
    let leagueName: LeagueName
    let neutralSite: Bool
    let seasonType: SeasonType
    let seasonYear:Int
    let sportID: Int
    let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case attendance
        case awayScore = "away_score"
        case awayTeam = "away_team"
        case awayTeamID = "away_team_id"
        case broadcast
        case conferenceCompetition = "conference_competition"
        case dateEvent = "date_event"
        case eventID = "event_id"
        case eventLocation = "event_location"
        case eventName = "event_name"
        case eventStatus = "event_status"
        case eventStatusDetail = "event_status_detail"
        case eventUUID = "event_uuid"
        case homeScore = "home_score"
        case homeTeam = "home_team"
        case homeTeamID = "home_team_id"
        case id
        case leagueName = "league_name"
        case neutralSite = "neutral_site"
        case seasonType = "season_type"
        case seasonYear = "season_year"
        case sportID = "sport_id"
        case updatedAt = "updated_at"
    }
}

enum Broadcast: String, Codable {
    case cbs = "CBS"
    case espn = "ESPN"
    case fox = "FOX"
    case nbc = "NBC"
}

enum EventStatus: String, Codable {
    case statusCanceled = "STATUS_CANCELED"
    case statusFinal = "STATUS_FINAL"
    case statusScheduled = "STATUS_SCHEDULED"
}

enum EventStatusDetail: String, Codable {
    case canceled = "Canceled"
    case eventStatusDetailFinal = "Final"
    case finalOT = "Final/OT"
    case the212630PmEst = "2/12 - 6:30 PM EST"
}

enum LeagueName: String, Codable {
    case nationalFootballLeague = "National Football League"
}

enum SeasonType: String, Codable {
    case postseason = "Postseason"
    case regularSeason = "Regular Season"
}
