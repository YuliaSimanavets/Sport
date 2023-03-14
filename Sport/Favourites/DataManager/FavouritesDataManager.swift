//
//  FavouritesDataManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation
import UIKit

struct TeamFavouritesModel: Codable {
    let name: String
    let record: String
    let id: Int
}

struct ScheduleFavouritesModel: Codable {
    let homeTeam: String
    let dateEvent: Date
    let id: Int
}

class FavouritesDataManager {
    
    private var teamFavourites = [TeamDetailsViewModel]()
    private var scheduleFavourites = [ScheduleDetailsViewModel]()
    
    var storageManager: StorageManagerProtocol?

    func addTeam(_ data: TeamDetailsViewModel) {
        
        if !teamFavourites.contains(where: { $0 == data }) {
            teamFavourites.append(data)
            print(teamFavourites.count)
        }
    }
    
    func addSchedule(_ data: ScheduleDetailsViewModel) {
        
        if !scheduleFavourites.contains(where: { $0 == data }) {
            scheduleFavourites.append(data)
            print(scheduleFavourites.count)
        }
    }
    
    func getTeams() -> [TeamFavouritesModel] {
                
        print(teamFavourites.count)
        return teamFavourites.map({ .init(name: $0.name, record: $0.record, id: $0.teamID) })
        
    }
    
    func getSchedule() -> [ScheduleFavouritesModel] {

        return scheduleFavourites.map({ .init(homeTeam: $0.homeTeam, dateEvent: $0.dateEvent, id: $0.sportID) })
    }
    
    func removeTeam(with teamId: Int) {

        teamFavourites.removeAll(where: { $0.teamID == teamId })
        print(teamFavourites)
    }
    
    func removeSchedule(with sportId: Int) {

        scheduleFavourites.removeAll(where: { $0.sportID == sportId })
        print(scheduleFavourites)
    }

    func isFavourite() -> Bool {

        var likes : Bool {
            get {
                return UserDefaults.standard.bool(forKey: "likes")
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "likes")
            }
        }
        return likes
    }
}
