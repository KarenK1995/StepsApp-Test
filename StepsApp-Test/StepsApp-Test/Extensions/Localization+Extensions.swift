//
//  Localization+Extensions.swift
//  StepsApp-Test
//
//  Created by Karen Karapetyan on 1/4/19.
//  Copyright © 2019 Karen Karapetyan. All rights reserved.
//

import UIKit

extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UILabel {
    
    private static var holder = [String: Bool]()
    
    @IBInspectable var isLocalized: Bool {
        get {
            return UILabel.holder[debugDescription]!
        }
        set(newValue) {
            if newValue {
                text = text?.localized()
            }
            UILabel.holder[debugDescription] = newValue
        }
    }
}
