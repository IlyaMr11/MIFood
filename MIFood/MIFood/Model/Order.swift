//
//  Order.swift
//  MIFood
//
//  Created by Илья Морозов on 18.03.2025.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
        print("hi")
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
}

