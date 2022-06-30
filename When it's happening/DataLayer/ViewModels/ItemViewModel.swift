//
//  ItemViewModel.swift
//  When it's happening
//
//  Created by Simran Preet Singh Narang on 2022-06-29.
//

import Foundation

class ItemViewModel: ObservableObject, Identifiable {
  
  private var item: Item
  
  init(item: Item) {
    self.item = item
  }
  
  init() {
    item = Item()
  }
  
  var id: String {
    item.id?.uuidString ?? "N/A"
  }
  
  var title: String {
    item.title ?? "N/A"
  }
  
  var date: Date {
    item.date ?? Date()
  }
  
  var formattedDate: String {
    item.date?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
  }
}
