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
}

func createNewModel() -> [GeneralSportModel] {
    
    var generalSportModel = [GeneralSportModel]()
    
    
    
    return generalSportModel
}

struct GeneralSportModel {
    let sportID: Int
    let sportName: String
    let sportImage: UIImage
}
