//
//  PlistStorageManager.swift
//  Sport
//
//  Created by Yuliya on 02/03/2023.
//

import Foundation

class PlistStorageManager: StorageManagerProtocol {

    let manager = FileManager.default
    let teamsFile = "Teams.plist"
    let scheduleFile = "Schedule.plist"

    private func getDocument(by name: String) -> URL {
        let path = try! manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = path.appendingPathComponent(name)
        return fileURL
    }

    func save(teams: [TeamFavouritesModel]) {

         let encodedData = try! PropertyListEncoder().encode(teams)
         
         do {
             try? encodedData.write(to: getDocument(by: teamsFile))
         } catch {
             print(error)
         }
    }

    func save(schedule: [ScheduleFavouritesModel]) {
        let encodedData = try! PropertyListEncoder().encode(schedule)
        
        do {
            try? encodedData.write(to: getDocument(by: scheduleFile))
        } catch {
            print(error)
        }
    }
    
    func getTeams() -> [TeamFavouritesModel] {
        guard let data = try? Data(contentsOf: getDocument(by: teamsFile)) else { return [] }
        let teams = (try? PropertyListDecoder().decode([TeamFavouritesModel].self, from: data)) ?? []
        return teams
    }
    
    func getSchedule() -> [ScheduleFavouritesModel] {
        guard let data = try? Data(contentsOf: getDocument(by: scheduleFile)) else { return [] }
        let schedule = (try? PropertyListDecoder().decode([ScheduleFavouritesModel].self, from: data)) ?? []
        return schedule
    }

}
