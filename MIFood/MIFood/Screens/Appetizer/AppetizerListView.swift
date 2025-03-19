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
        
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.visible, edges: .bottom)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.brandPrimary)
                    .scaleEffect(1.5)
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
        
        
    }
}

#Preview {
    AppetizerListView()
}
