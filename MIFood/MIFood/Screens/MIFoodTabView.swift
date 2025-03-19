//
//  ContentView.swift
//  MIFood
//
//  Created by Илья Морозов on 11.03.2025.
//

import SwiftUI

struct MIFoodTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person.fill") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag.fill") }
                .badge(order.items.count)
            
        }
    }
}

#Preview {
    MIFoodTabView()
}
