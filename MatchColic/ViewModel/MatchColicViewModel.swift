//
//  MatchColicViewModel.swift
//  MatchColic
//
//  Created by Berire Şen Ayvaz on 13.02.2023.
//

import Foundation
import Alamofire

class MatchColicViewModel {
    var ligList = Observable<LigListModel>()
    var ligSira = Observable<LigSiraModel>()
    var maclar = Observable<MaclarModel>()
    var goalKings = Observable<GoalKingsModel> ()
    var isLoadingSlide = Observable<Bool>()
    var isLoading = Observable<Bool>()
    var alertItem = Observable<AlertItem>()
    
    func  getLigList(){
        isLoading.value = true

        NetworkManager.instance.fetch(endpoint: MatchcolicEndPoint.ligList, responseModel: LigListModel.self){ [self] result in
            
            DispatchQueue.main.async { [self] in
                isLoading.value = false
                
                switch result {
                case .success(let result):
                    self.ligList.value = result
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem.value = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem.value = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem.value = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem.value = AlertContext.unableToComplete
                    }
                }
            }
        }
    }

    
    func getLigSira(lig:String){
        isLoading.value = true

        NetworkManager.instance.fetch(endpoint: MatchcolicEndPoint.ligSira(lig: lig), responseModel: LigSiraModel.self){ [self] result in
            
            DispatchQueue.main.async { [self] in
                isLoading.value = false
                
                switch result {
                case .success(let result):
                    self.ligSira.value = result
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem.value = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem.value = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem.value = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem.value = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    func getMaclar(lig:String){
        isLoading.value = true

        NetworkManager.instance.fetch(endpoint: MatchcolicEndPoint.maclar(lig: lig), responseModel: MaclarModel.self){ [self] result in
            
            DispatchQueue.main.async { [self] in
                isLoading.value = false
                
                switch result {
                case .success(let result):
                    self.maclar.value = result
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem.value = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem.value = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem.value = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem.value = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    func getGoalKings(lig:String){
        isLoading.value = true

        NetworkManager.instance.fetch(endpoint: MatchcolicEndPoint.goalKings(lig: lig), responseModel: GoalKingsModel.self){ [self] result in
            
            DispatchQueue.main.async { [self] in
                isLoading.value = false
                
                switch result {
                case .success(let result):
                    self.goalKings.value = result
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem.value = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem.value = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem.value = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem.value = AlertContext.unableToComplete
                    }
                }
            }
        }
    }

}
