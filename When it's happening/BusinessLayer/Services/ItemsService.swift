//
//  DataManager.swift
//  When it's happening
//
//  Created by Simran Preet Narang on 2022-06-29.
//

import Foundation
import UIKit
import CoreData

class ItemsService {
  
  private var context: NSManagedObjectContext
  
  static let shared = ItemsService(dataManager: CoreDataManager.shared)
  
  private init(dataManager: CoreDataManager) {
    
    self.context = dataManager.dataManager
  }
  
  func get() -> [Item] {
    
    var items = [Item]()
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    
    do {
      
      items = try self.context.fetch(request)
    } catch {
      
      print(error)
    }
    
    return items
  }
  
  func save(title: String, date: Date) -> Bool {
    
    let model = Item(context: context)
    model.id = UUID()
    model.title = title
    model.date = date
    
    do {
      
      try context.save()
    } catch {
      
      print(error)
      return false
    }
    
    return true
  }
  
  func remove(id: UUID) {
    
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    request.predicate = NSPredicate(format: "id=%@", id.uuidString)
    
    do {
      
      let items = try self.context.fetch(request)
      for item in items {
        context.delete(item)
      }
      try context.save()
    }
    catch {
      
      print(error)
    }
  }
  
  func update(id: UUID, title: String, date: Date) {
    
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    request.predicate = NSPredicate(format: "id=%@", id.uuidString)
    
    do {
      
      let items = try self.context.fetch(request)
      let itemToUpdate = items.first{ $0.id == id }
      
      itemToUpdate?.title = title
      itemToUpdate?.date = date
      try context.save()
    }
    catch {
      
      print(error)
    }
  }
}
