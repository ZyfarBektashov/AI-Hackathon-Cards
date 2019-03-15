//
//  DataManager.swift
//  AI-Hackathon-Cards
//
//  Created by Z on 14.03.2019.
//  Copyright © 2019 Beta. All rights reserved.
//

import Foundation

class DataManager {
    
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    
    private let numberOfRecords = "numberOfRecords"
    
    func setNumberOfRecords(num: Int) {
        UserDefaults.standard.set(num, forKey: numberOfRecords)
    }
    
    func getNumberOfRecords() -> Int {
        return UserDefaults.standard.integer(forKey: numberOfRecords)
    }
}
