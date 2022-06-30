//
//  AddItemScreen.swift
//  When it's happening
//
//  Created by Simran Preet Singh Narang on 2022-06-29.
//

import SwiftUI

struct AddItemScreen: View {
  
  @EnvironmentObject var controller: ItemsController
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Title", text: $controller.itemTitle)
        DatePicker("Select a date", selection: $controller.itemDate)
        
        Button("Save") {
          controller.saveItem()
          dismiss()
        }
      }
      
      .navigationTitle(Text("Add a item"))
    }
  }
}

struct AddItemScreen_Previews: PreviewProvider {
  static var previews: some View {
    AddItemScreen()
  }
}
