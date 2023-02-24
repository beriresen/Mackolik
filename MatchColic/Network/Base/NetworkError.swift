//
//  NetworkError.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
