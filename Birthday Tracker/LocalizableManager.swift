//
//  LocalizableManager.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/16/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
