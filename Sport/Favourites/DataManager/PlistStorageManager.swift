//
//  PlistStorageManager.swift
//  Sport
//
//  Created by Yuliya on 02/03/2023.
//

import Foundation

class PlistStorageManager: StorageManagerProtocol {
    
    func addToFavourites() {
        print("add to fav")
    }
    
    func getFavourites() -> [TeamFavouritesModel] {
        
        return [TeamFavouritesModel]()
    }
}
