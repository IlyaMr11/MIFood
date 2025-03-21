//
//  Appetizer.swift
//  MIFood
//
//  Created by Илья Морозов on 12.03.2025.
//

import Foundation

struct Appetizer: Codable, Identifiable  {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Name",
                                           description: "Some Mock Description. It's tasty!",
                                           price: 9.99, imageURL: "", calories: 122, protein: 99, carbs: 99)
    
    static let appetizers      = [Appetizer](repeating:  sampleAppetizer, count: 10)
    
    
    static let orderItemOne   =    Appetizer(id: 0001,
                                              name: "Test Appetizer one",
                                              description: "Some Mock Description. It's tasty!",
                                              price: 9.99, imageURL: "", calories: 122, protein: 99, carbs: 99)
    
    static let orderItemTwo    = Appetizer(id: 0002,
                                           name: "Test Appetizer two",
                                           description: "Some Mock Description. It's tasty!",
                                           price: 9.99, imageURL: "", calories: 122, protein: 99, carbs: 99)
    
    static let orderItemThree  = Appetizer(id: 0003,
                                           name: "Test Appetizer three",
                                           description: "Some Mock Description. It's tasty!",
                                           price: 9.99, imageURL: "", calories: 122, protein: 99, carbs: 99)
    
    static let orderItems      = [orderItemOne, orderItemTwo, orderItemThree]
    
}

