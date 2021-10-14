//
//  ReadingList+CoreDataProperties.swift
//  
//
//  Created by Anjali on 5/7/21.
//
//

import Foundation
import CoreData


extension ReadingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReadingList> {
        return NSFetchRequest<ReadingList>(entityName: "ReadingList")
    }

    @NSManaged public var created_at: String?
    @NSManaged public var reading_type: Int16
    @NSManaged public var value: Int16
    @NSManaged public var status: String?
    @NSManaged public var reading_time: String?
    @NSManaged public var uid: String?

}
