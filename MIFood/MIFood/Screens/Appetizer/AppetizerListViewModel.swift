//
//  AppetizerListViewModel.swift
//  MIFood
//
//  Created by Илья Морозов on 13.03.2025.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alert: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self?.appetizers = appetizers
//                    
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        self?.alert = AlertContext.invalidURL
//                        
//                    case .invalidResponse:
//                        self?.alert = AlertContext.invalidResponse
//                        
//                    case .invalidData:
//                        self?.alert = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        self?.alert = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers()  {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alert = AlertContext.invalidURL
                    case .invalidResponse:
                        alert = AlertContext.invalidResponse
                    case .invalidData:
                        alert = AlertContext.invalidData
                    case .unableToComplete:
                        alert = AlertContext.unableToComplete
                    }
                } else {
                    alert = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
