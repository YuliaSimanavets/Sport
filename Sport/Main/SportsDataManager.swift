//
//  SportsData.swift
//  Sport
//
//  Created by Yuliya on 20/01/2023.
//

import UIKit

class SportsDataManager {
    
    private let apikey = "aS3uw8tWrnagNUqFY0QYeAkFe9psTdE3"
    private let forHTTPHeaderField = "apikey"

    var components: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.apilayer.com"
        return components
    }()
    
    enum DetailOptions: String {
        case teams = "teams"
        case schedule = "schedule"
    }

    func loadData(dataCollected: @escaping ([SportModel]) -> ()) {

        components.path = "/therundown/sports/"
        guard let url = components.url?.absoluteString else { return }
        
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
        request.addValue(apikey, forHTTPHeaderField: forHTTPHeaderField)
        
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
    
    func getTeam(sportId: Int, completion: @escaping ([TeamModel]) -> ()) {

        let teams = DetailOptions.teams.rawValue
        components.path = "/therundown/sports/" + String(sportId) + "/" + teams
        
        guard let url = components.url?.absoluteString else { return }
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.addValue(apikey, forHTTPHeaderField: forHTTPHeaderField)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                print("error")

            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let responseData = data {

                let teamData = try? JSONDecoder().decode(TeamsData.self, from: responseData)

                DispatchQueue.main.async {
                    completion(teamData?.teams ?? [])
                }
            }
        }
        task.resume()
    }
    
    func getSchedule(sportId: Int, from date: Date, limit: Int, completion: @escaping ([ScheduleModel]) -> ()) {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let schedule = DetailOptions.schedule.rawValue
        components.path = "/therundown/sports/" + String(sportId) + "/" + schedule
        let queryItemFrom = URLQueryItem(name: "from", value: dateFormatter.string(from: date))
        let queryItemLimit = URLQueryItem(name: "limit", value: String(limit))
        components.queryItems = [queryItemFrom, queryItemLimit]
        
        guard let url = components.url?.absoluteString else { return }
        
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.addValue(apikey, forHTTPHeaderField: forHTTPHeaderField)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print("error")
                
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200 ,
                      let responseData = data {
                
                let scheduleData = try? JSONDecoder().decode(SchedulesData.self, from: responseData)
                
                DispatchQueue.main.async {
                    completion(scheduleData?.schedules ?? [])
                }
            }
        }
        task.resume()
    }
}
