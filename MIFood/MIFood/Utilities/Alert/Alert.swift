//
//  Alert.swift
//  MIFood
//
//  Created by Илья Морозов on 13.03.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData = AlertItem(
                                    title: Text("Server Error"),
                                    message: Text("The data received from the server was invalid. Please contact support."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let invalidResponse =  AlertItem(
                                    title: Text("Server Error"),
                                    message: Text("Invalid response from server. Please try again later or contact support."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let invalidURL =       AlertItem(
                                    title: Text("Server Error"),
                                    message: Text("There was an issue connecting to server. If this persits, please contact support."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let unableToComplete = AlertItem(
                                    title: Text("Server Error"),
                                    message: Text("Unable to complete the request. Please check your internet connection."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    
    //MARK: - Account Alerts
    static let invalidForm =      AlertItem(
                                    title: Text("Invalid Form"),
                                    message: Text("Please ensure all fields in the form have been filled out."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let invalidEmail = AlertItem(
                                    title: Text("Invalid Email"),
                                    message: Text("Please ensure your email is correct."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let userSaveSuccess = AlertItem(
                                    title: Text("Profile Saved"),
                                    message: Text("Your profile information was successfully saved."),
                                    dismissButton: .default(Text("ОK"))
    )
    
    static let invalidUserData = AlertItem(
                                    title: Text("Profile Error"),
                                    message: Text("There was an error saving or retrieving your profile information."),
                                    dismissButton: .default(Text("ОK"))
    )
}
