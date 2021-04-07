//
//  Birthday+CoreDataProperties.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 11/13/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//
//

import Foundation
import CoreData


extension Birthday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Birthday> {
        return NSFetchRequest<Birthday>(entityName: "Birthday")
    }

    @NSManaged public var birthdate: Date?
    @NSManaged public var birthdayId: String?
    @NSManaged public var daysLeft: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var wishes: NSSet?

}

// MARK: Generated accessors for wishes
extension Birthday {

    @objc(addWishesObject:)
    @NSManaged public func addToWishes(_ value: Wish)

    @objc(removeWishesObject:)
    @NSManaged public func removeFromWishes(_ value: Wish)

    @objc(addWishes:)
    @NSManaged public func addToWishes(_ values: NSSet)

    @objc(removeWishes:)
    @NSManaged public func removeFromWishes(_ values: NSSet)

}

extension Birthday : Identifiable {

}
