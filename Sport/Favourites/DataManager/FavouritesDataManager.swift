//
//  FavouritesDataManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation
import UIKit

class FavouritesDataManager {
    
    private var teamFavourites = [TeamFavouritesModel]()
    private var scheduleFavourites = [ScheduleDetailsViewModel]()
    
    var storageManager: StorageManagerProtocol?
      
    func addTeam(_ data: TeamFavouritesModel) {
        
        teamFavourites.append(data)
        print("add team count: \(teamFavourites.count)")
    }
    
    func addSchedule(_ data: ScheduleDetailsViewModel) {
        scheduleFavourites.append(data)
        print(scheduleFavourites.count)
    }
    
    var arrayCommon: [TeamFavouritesModel] = [
        .init(name: "a", record: "3-2"),
        .init(name: "b", record: "3-2"),
        .init(name: "c", record: "3-2"),
        .init(name: "d", record: "3-2")
    ]
    
    func get() -> [TeamFavouritesModel] {

//        print("teamFavourites count: \(teamFavourites.count)")
//        return teamFavourites
       
        return arrayCommon
    }
    
    func removeItem(at data: Int) {
        arrayCommon.remove(at: data)
//        teamFavourites.remove(at: data)
    }

    func isFavourite() -> Bool {

        return true
    }
}


struct TeamFavouritesModel: Codable {
    let name: String
    let record: String
}
