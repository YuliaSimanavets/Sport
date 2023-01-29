//
//  SportsData.swift
//  Sport
//
//  Created by Yuliya on 20/01/2023.
//

import UIKit

class SportsDataManager {
    
    private let typesOfSport: [Sport] = [.ncaaFootball, .nfl, .mlb, .nba, .ncaaMensBasket, .nhl, .ufsMma, .wnba, .mls, .epl, .fra1, .ger1, .esp1, .ita1, .uefaChamp, .fifa]
    
    func loadData(dataCollected: @escaping ([Sport]?) -> ()) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            dataCollected(self?.typesOfSport)
        }
    }
}
