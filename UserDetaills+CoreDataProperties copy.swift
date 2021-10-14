//
//  UserDetaills+CoreDataProperties.swift
//  
//
//  Created by Anjali on 14/6/21.
//
//

import Foundation
import CoreData


extension UserDetaills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetaills> {
        return NSFetchRequest<UserDetaills>(entityName: "UserDetaills")
    }

    @NSManaged public var mobile: String?
    @NSManaged public var email: String?
    @NSManaged public var height: String?
    @NSManaged public var weight: String?
    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var b_group: String?
    @NSManaged public var gender: String?
    @NSManaged public var dob: String?
    @NSManaged public var region: String?
    @NSManaged public var token: String?
    @NSManaged public var refreshToken: String?
    @NSManaged public var uid: String?
    @NSManaged public var password: String?


}
