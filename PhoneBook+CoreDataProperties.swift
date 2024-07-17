//
//  PhoneBook+CoreDataProperties.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/11/24.
//
//

import Foundation
import CoreData


extension PhoneBook {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
    return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
  }
  
  @NSManaged public var phoneNumber: String?
  @NSManaged public var name: String?
  @NSManaged public var profileImage: Data?
  
}

extension PhoneBook : Identifiable {
  
}

