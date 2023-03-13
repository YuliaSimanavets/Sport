//
//  UserDefaultsStorageManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation

protocol StorageManagerProtocol {
    func addTeamToFavourites()
    func addScheduleToFavourites()
    func getTeamsFavourites() -> [TeamFavouritesModel]
    func getScheduleFavourites() -> [ScheduleFavouritesModel]
}

class UserDefaultsStorageManager: StorageManagerProtocol {
    
    private enum UserDefaultKeys: String {
        case team
        case schedule
    }
    
    var favouritesDataManager: FavouritesDataManager?
    var userDefaults = UserDefaults.standard

    private var arrayTeamsFavourites = [TeamFavouritesModel]()
    private var arrayScheduleFavourites = [ScheduleFavouritesModel]()
    
    init() {
        if let myData = userDefaults.data(forKey: UserDefaultKeys.team.rawValue) {
            arrayTeamsFavourites = (try? JSONDecoder().decode([TeamFavouritesModel].self, from: myData)) ?? []
        } else if let myData = userDefaults.data(forKey: UserDefaultKeys.schedule.rawValue) {
            arrayScheduleFavourites = (try? JSONDecoder().decode([ScheduleFavouritesModel].self, from: myData)) ?? []
        }
    }
    
    func addTeamToFavourites() {
        arrayTeamsFavourites = favouritesDataManager?.getTeams().map({ TeamFavouritesModel(name: $0.name,
                                                                                           record: $0.record,
                                                                                           id: $0.id)
        }) ?? []
        
        let dataJSON = try? JSONEncoder().encode(arrayTeamsFavourites)
        userDefaults.set(dataJSON, forKey: UserDefaultKeys.team.rawValue)
    }
    
    func addScheduleToFavourites() {
        arrayScheduleFavourites = favouritesDataManager?.getSchedule().map({ ScheduleFavouritesModel(homeTeam: $0.homeTeam,
                                                                                                     dateEvent: $0.dateEvent,
                                                                                                     id: $0.id)
        }) ?? []
        
        let dataJSON = try? JSONEncoder().encode(arrayScheduleFavourites)
        userDefaults.set(dataJSON, forKey: UserDefaultKeys.schedule.rawValue)
    }
    
    func getTeamsFavourites() -> [TeamFavouritesModel] {
        print("userDefaults teams: \(arrayTeamsFavourites)")
        return arrayTeamsFavourites
    }
    
    func getScheduleFavourites() -> [ScheduleFavouritesModel] {
        print("userDefaults schedule: \(arrayScheduleFavourites)")
        return arrayScheduleFavourites
    }

    
    func setDataFromMananger(_ data: FavouritesDataManager) {
        favouritesDataManager = data
    }
}

