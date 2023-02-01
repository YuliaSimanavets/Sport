//
//  SportsData.swift
//  Sport
//
//  Created by Yuliya on 20/01/2023.
//

import UIKit

class SportsDataManager {
    
    private var typesOfSport = [MySportModel]()
    
    func loadData(dataCollected: @escaping ([MySportModel]?) -> ()) {

        let url = "https://api.apilayer.com/therundown/sports"
        var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
        request.addValue("aS3uw8tWrnagNUqFY0QYeAkFe9psTdE3", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if error != nil {
                print("error")
                
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let responseData = data {
                
                let sportData = try? JSONDecoder().decode([MySportModel].self, from: responseData)
               

                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
                    dataCollected(self?.typesOfSport)
                }
            }
        }
        
        task.resume()
    }
}

struct MySportModel: Codable {
    var sportId: Int
    var sportName: String
    var sportImage: Sport
}



//    [Sport] = [.ncaaFootball, .nfl, .mlb, .nba, .ncaaMensBasket, .nhl, .ufsMma, .wnba, .mls, .epl, .fra1, .ger1, .esp1, .ita1, .uefaChamp, .fifa]
