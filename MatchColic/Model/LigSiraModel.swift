//
//  LigSiraModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation

struct LigSiraModel: Codable {
    var result: [LigSiraList]?
    var success: Bool?
    
    enum CodingKeys :String,CodingKey {
        case result = "result"
        case success = "success"
    }
}

// MARK: - Result
struct LigSiraList: Codable {
    var rank, draw, lose, win: Int?
    var play, point, goalfor, goalagainst: Int?
    var goaldistance: Int?
    var team: String?
}
