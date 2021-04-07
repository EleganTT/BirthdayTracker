//
//  Birthday+CoreDataClass.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/7/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Birthday)
public class Birthday: NSManagedObject {
    
    var wishesSorted: [Wish] {
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        return self.wishes?.sortedArray(using: [sortDescriptor]) as! [Wish]
    }
    
    var birthdateString: String {
        let df = DateFormatter()
        df.dateStyle = .long
        df.timeStyle = .none
        
        return df.string(from: self.birthdate!)
    }
    
    var dayLeft: String {
        
        let cal = Calendar.current
        let today = cal.startOfDay(for: Date())
        let dayAndMonth = cal.dateComponents([.day, .month], from: birthdate!)
        let nextBirthDay = cal.nextDate(after: today, matching: dayAndMonth,
                                        matchingPolicy: .nextTimePreservingSmallerComponents)!
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day]
        formatter.unitsStyle = .full
        
        let daysCount = formatter.string(from: today, to: nextBirthDay)
        
        return daysCount!
    }
}
