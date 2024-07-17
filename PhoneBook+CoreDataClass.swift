//
//  PhoneBook+CoreDataClass.swift
//  pokemonBook_CoreData_240711
//
//  Created by 김솔비 on 7/11/24.
//
//

import Foundation
import CoreData

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
  public static let className = "PhoneBook"
  public enum Key {
    static let name = "name"
    static let phoneNumber = "phoneNumber"
    static let profileImage = "profileImage"
  }
}
