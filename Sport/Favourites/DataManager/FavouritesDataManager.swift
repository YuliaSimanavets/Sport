//
//  FavouritesDataManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation
import UIKit

struct TeamFavouritesModel: Codable, Equatable {
    let name: String
    let record: String
    let id: Int
}

struct ScheduleFavouritesModel: Codable, Equatable {
    let homeTeam: String
    let dateEvent: Date
    let id: Int
}

class FavouritesDataManager {

    private var teamFavourites = [TeamFavouritesModel]()
    private var scheduleFavourites = [ScheduleFavouritesModel]()
    
    var storageManager: StorageManagerProtocol
    
    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }
    
    func addTeam(_ data: TeamFavouritesModel) {
        
        if !teamFavourites.contains(where: { $0 == data }) {
            teamFavourites.append(data)
            print(teamFavourites.count)
        }
        
        storageManager.save(teams: teamFavourites)
    }
    
    func addSchedule(_ data: ScheduleFavouritesModel) {
        
        if !scheduleFavourites.contains(where: { $0 == data }) {
            scheduleFavourites.append(data)
            print(scheduleFavourites.count)
        }
        
        storageManager.save(schedule: scheduleFavourites)
    }
    
    func removeTeam(with teamId: Int) {
        
        teamFavourites.removeAll(where: { $0.id == teamId })
        print(teamFavourites)
        storageManager.save(teams: teamFavourites)
    }
    
    func removeSchedule(with sportId: Int) {
        
        scheduleFavourites.removeAll(where: { $0.id == sportId })
        print(scheduleFavourites)
        storageManager.save(schedule: scheduleFavourites)
    }
    
    func getTeams() -> [TeamFavouritesModel] {
                
        return storageManager.getTeams()
    }
    
    func getSchedule() -> [ScheduleFavouritesModel] {

        return storageManager.getSchedule()
    }

//    func favoriteStatus(at index: Int) {
//
//    }
}
