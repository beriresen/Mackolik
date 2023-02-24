//
//  MaclarModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 21.02.2023.
//

import Foundation

struct MaclarModel: Codable {
    var result: [MaclarList]?
    var success: Bool?
    
    enum CodingKeys :String,CodingKey {
        case result = "result"
        case success = "success"
    }
}

// MARK: - Result
struct MaclarList: Codable {
    var skor: String?
    var date: String?
    var away, home: String?
}
