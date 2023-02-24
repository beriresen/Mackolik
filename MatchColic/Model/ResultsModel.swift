//
//  ResultsModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation

// MARK: - Welcome
struct ResultsModel: Codable {
    var result: [ResultList]?
    var success: Bool?
    
    enum CodingKeys :String,CodingKey {
        case result = "result"
        case success = "success"
    }
}

// MARK: - Result
struct ResultList: Codable {
    var skor: String?
    var date: Date?
    var away, home: String?
}
