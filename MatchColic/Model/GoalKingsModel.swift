//
//  GoalKingsModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation

struct GoalKingsModel: Codable {
    var success: Bool?
    var result: [GoalKingsList]?
    
    
    enum CodingKeys :String,CodingKey {
        case result = "result"
        case success = "success"
    }    
    
}

// MARK: - Result
struct  GoalKingsList: Codable {
    var name, goals: String?
}
