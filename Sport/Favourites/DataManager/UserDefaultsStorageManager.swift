//
//  UserDefaultsStorageManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation

protocol StorageManagerProtocol {
    func save(teams: [TeamFavouritesModel])
    func save(schedule: [ScheduleFavouritesModel])
    func getTeams() -> [TeamFavouritesModel]
    func getSchedule() -> [ScheduleFavouritesModel]
}

class UserDefaultsStorageManager: StorageManagerProtocol {
    
    private enum UserDefaultKeys: String {
        case team
        case schedule
    }
    
    private var userDefaults = UserDefaults.standard

    func save(teams: [TeamFavouritesModel]) {
        
        let dataJSON = try? JSONEncoder().encode(teams)
        userDefaults.set(dataJSON, forKey: UserDefaultKeys.team.rawValue)
        print(dataJSON ?? [])
    }
    
    func save(schedule: [ScheduleFavouritesModel]) {
        
        let dataJSON = try? JSONEncoder().encode(schedule)
        userDefaults.set(dataJSON, forKey: UserDefaultKeys.schedule.rawValue)
        print(dataJSON ?? [])
    }

    func getTeams() -> [TeamFavouritesModel] {
        
        let teamsData = userDefaults.object(forKey: UserDefaultKeys.team.rawValue)
        let teams = (try? JSONDecoder().decode([TeamFavouritesModel].self, from: teamsData as! Data)) ?? []
        return teams
    }

    func getSchedule() -> [ScheduleFavouritesModel] {

        let scheduleData = userDefaults.object(forKey: UserDefaultKeys.schedule.rawValue)
        let schedule = (try? JSONDecoder().decode([ScheduleFavouritesModel].self, from: scheduleData as! Data)) ?? []
        return schedule
    }
}

