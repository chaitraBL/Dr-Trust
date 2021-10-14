//
//  ReadingType+CoreDataProperties.swift
//  
//
//  Created by Anjali on 15/6/21.
//
//

import Foundation
import CoreData


extension ReadingType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReadingType> {
        return NSFetchRequest<ReadingType>(entityName: "ReadingType")
    }

    @NSManaged public var id: Int16
    @NSManaged public var ed_max: Int16
    @NSManaged public var ed_min: Int16
    @NSManaged public var diabetic: Int16
    @NSManaged public var name: String?
    @NSManaged public var normal_max: Int16
    @NSManaged public var normal_min: Int16

}
