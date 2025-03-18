//
//  MIFoodApp.swift
//  MIFood
//
//  Created by Илья Морозов on 11.03.2025.
//

import SwiftUI

@main
struct MIFoodApp: App {
    
    var order = Order()
    
    
    var body: some Scene {
        WindowGroup {
            MIFoodTabView().environmentObject(order)
        }
    }
}
