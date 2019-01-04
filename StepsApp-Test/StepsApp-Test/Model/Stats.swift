//
//  StatsItem.swift
//  StepsApp-Test
//
//  Created by Karen Karapetyan on 1/4/19.
//  Copyright © 2019 Karen Karapetyan. All rights reserved.
//

import Foundation

struct StatsItem: Codable {
    let imageName: String
    let title: String
    let description: String
}

class StatsProvider {
    
    static let stats = StatsProvider.get()!
    
    fileprivate class func get() -> [StatsItem]? {
        if let path = Bundle.main.path(forResource: "Stats", ofType: "plist") {
            do {
                let fileInfo = NSDictionary(contentsOfFile: path)!["stats"]
                let data = try JSONSerialization.data(withJSONObject: fileInfo! as Any, options: [])
                let stats = try JSONDecoder().decode([StatsItem].self, from: data)
                return stats
            }
            catch {
                print("Cannot parse")
            }
        }
        return nil
    }
}

