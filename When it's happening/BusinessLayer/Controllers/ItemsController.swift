//
//  ItemsController.swift
//  When it's happening
//
//  Created by Simran Preet Singh Narang on 2022-06-29.
//

import Foundation

class ItemsController: ObservableObject {
  
  @Published var items = [ItemViewModel]()
  
  @Published var itemTitle = ""
  @Published var itemDate = Date()
  
  private var itemsService: ItemsService
  
  init(itemsService: ItemsService = ItemsService.shared) {
    self.itemsService = itemsService
    getItems()
  }
  
  func getItems() {
    
    items = itemsService.get().map{ .init(item: $0) }
    print("😀", items.count)
  }
  
  func saveItem() {
    
    if itemTitle.isEmpty {
      print("❌", "Item title cannot be empty")
      return
    }
    
    if !itemsService.save(title: itemTitle, date: itemDate) {
      print("❌", "Failed to save item.")
      return
    }
    
    getItems()
  }
}
