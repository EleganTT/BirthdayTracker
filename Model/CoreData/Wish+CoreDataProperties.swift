//
//  Wish+CoreDataProperties.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/7/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//
//

import Foundation
import CoreData


extension Wish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wish> {
        return NSFetchRequest<Wish>(entityName: "Wish")
    }

    @NSManaged public var name: String?
    @NSManaged public var birthday: Birthday?

}
