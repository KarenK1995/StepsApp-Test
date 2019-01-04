//
//  Records.swift
//  StepsApp-Test
//
//  Created by Karen Karapetyan on 1/4/19.
//  Copyright © 2019 Karen Karapetyan. All rights reserved.
//

import Foundation

class RecordsProvider {
    
    static let records = RecordsProvider.get()!
    
    fileprivate class func get() -> [StatsItem]? {
        if let path = Bundle.main.path(forResource: "Records", ofType: "plist") {
            do {
                let fileInfo = NSDictionary(contentsOfFile: path)!["records"]
                let data = try JSONSerialization.data(withJSONObject: fileInfo! as Any, options: [])
                let records = try JSONDecoder().decode([StatsItem].self, from: data)
                return records
            }
            catch {
                print("Cannot parse")
            }
        }
        return nil
    }
}
