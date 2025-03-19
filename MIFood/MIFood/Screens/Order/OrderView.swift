//
//  OrderView.swift
//  MIFood
//
//  Created by Илья Морозов on 11.03.2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order crated")
                        order.clear()
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Holder")
                    }
                    .modifier(StandartButtonStyle())
                    .padding(.bottom, 25)
                    
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Your order is empty.\n Please add an appetizer")
                }
            }
            .navigationTitle("🗒️ Order")
        }
    }
}

#Preview {
    OrderView()
}
