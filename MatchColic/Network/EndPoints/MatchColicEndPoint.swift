//
//  MatchColicEndPoint.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Alamofire

enum MatchcolicEndPoint {
    case ligList
    case maclar(lig:String)
    case ligSira(lig:String)
    case goalKings(lig:String)
}

extension MatchcolicEndPoint: Endpoint {

    var path: String {
        switch self {
        case .ligList:
            return "/sport/leaguesList"
        case .maclar(let lig):
            return "/sport/results"
        case .ligSira(let lig):
            return "/sport/league"
        case .goalKings(let lig):
            return "/sport/goalKings"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .ligList, .maclar, .ligSira, .goalKings:
            return .get
        }
    }
    var param: [String : Any]? {
        switch self {
        case .ligList:
            return ["language":"tr-TR"]
        case .maclar(let lig):
            return ["data.league" : lig]
        case .ligSira(let lig):
            return ["data.league" : lig]
        case .goalKings(let lig):
            return ["data.league" : lig]
        }
    }
    

    var header: HTTPHeaders {
        switch self {
        case .ligList, .maclar, .ligSira, .goalKings:
            return [
                "Content-Type":"application/json",
                "Authorization":"apikey YOUR_ACCESS_TOKEN"
            ]
        }
    }
    var body: [String: String]? {
        switch self {
        case .ligList, .maclar, .ligSira, .goalKings:
            return nil
        }
    }
}
