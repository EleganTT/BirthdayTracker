//
//  Wish+CoreDataClass.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/7/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


@objc(Wish)
public class Wish: NSManagedObject {
    class func newWish(name: String, birthday: Birthday?) -> Wish {
            let newWish = Wish(context: CoreDataManager.sharedInstance.managedObjecContext)
            
            newWish.name = name
        
            newWish.birthday = birthday
        
            return newWish
        }
}
