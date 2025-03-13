//
//  FoodListView.swift
//  MIFood
//
//  Created by Илья Морозов on 11.03.2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.brandPrimary)
                        .scaleEffect(1.5)
                }
                
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.visible, edges: .bottom)
                    
                }
                .navigationTitle("🍟 Appetizers")
            }
          
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
        
        
    }
}

#Preview {
    AppetizerListView()
}
