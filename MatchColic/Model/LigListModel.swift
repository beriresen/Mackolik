//
//  LigListModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation

struct LigListModel:Codable{
    var success: Bool?
    var result: [LigListResult]?
    
    enum CodingKeys :String,CodingKey {
        case result = "result"
        case success = "success"
    }
}

struct LigListResult: Codable {
    var league, key: String?
}
