//
//  Person+CoreDataProperties.swift
//  SavingUserData
//
//  Created by Aisse Melissa Torres Torres on 7/24/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
