//
//  SportsData.swift
//  Sport
//
//  Created by Yuliya on 20/01/2023.
//

import UIKit

class SportsDataManager {
    
    
    func loadData(dataCollected: @escaping ([SportModel]) -> ()) {

        let url = "https://api.apilayer.com/therundown/sports"
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
        request.addValue("aS3uw8tWrnagNUqFY0QYeAkFe9psTdE3", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                print("error")

            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let responseData = data {

                let sportData = try? JSONDecoder().decode(SportData.self, from: responseData)

                DispatchQueue.main.async {
                    dataCollected(sportData?.sports ?? [])
                }
            }
        }
        task.resume()
    }
    
    func getTeam(sportId: Int, complition: @escaping ([TeamModel]) -> ()) {

        let url = "https://api.apilayer.com/therundown/sports/" + String(sportId) + "/teams"
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.addValue("aS3uw8tWrnagNUqFY0QYeAkFe9psTdE3", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                print("error")

            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let responseData = data {

                let teamData = try? JSONDecoder().decode(TeamsData.self, from: responseData)

                DispatchQueue.main.async {
                    complition(teamData?.teams ?? [])
                }
            }
        }
        task.resume()
    }
    
    func getSchedule(sportId: Int, from date: Date, limit: Int, complition: @escaping ([ScheduleModel]) -> ()) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let url = "https://api.apilayer.com/therundown/sports/" + String(sportId) + "/schedule?limit=" + String(limit) + "&from=" + dateFormatter.string(from: date)
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.addValue("aS3uw8tWrnagNUqFY0QYeAkFe9psTdE3", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print("error")
                
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200 ,
                      let responseData = data {
                
                let scheduleData = try? JSONDecoder().decode(SchedulesData.self, from: responseData)
                
                DispatchQueue.main.async {
                    complition(scheduleData?.schedules ?? [])
                }
            }
        }
        task.resume()
    }
}
