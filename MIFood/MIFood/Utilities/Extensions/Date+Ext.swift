//
//  Date+Ext.swift
//  MIFood
//
//  Created by Илья Морозов on 19.03.2025.
//

import Foundation

extension Date {
    var eightennYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
