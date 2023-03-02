//
//  FavouritesDataManager.swift
//  Sport
//
//  Created by Yuliya on 28/02/2023.
//

import Foundation
import UIKit

class FavouritesDataManager {
    
    enum CellType: Codable {
        case team(TeamModel)
        case schedule(ScheduleModel)
    }
    
    init() {
        if let dataFavourites = defaults.object(forKey: "item") as? [CellType] {
            arrayFavourites = dataFavourites
        }
    }
    
    private var arrayFavourites = [CellType]()
    private let defaults = UserDefaults.standard
    
    private enum UserDefaultKeys: String {
        case team
        case schedule
    }
    
    func addTeamSchedule(_ data: CellType) {
        
        arrayFavourites.append(data)
        let dataJSON = try? JSONEncoder().encode(arrayFavourites)
        defaults.set(dataJSON, forKey: "item")
    }
    
    func removeItem() {
        
        
    }
    
    func getData() -> [CellType] {
        
        return arrayFavourites
        
    }
}

//struct FavouritesTeamViewModel: Codable {
//
//}
//
//struct FavouritesScheduleViewModel: Codable {
//
//}


