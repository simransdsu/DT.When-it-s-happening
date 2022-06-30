//
//  ContentView.swift
//  When it's happening
//
//  Created by Simran Preet Narang on 2022-06-29.
//

import SwiftUI

struct ItemsListScreen: View {
  
  @StateObject var controller = ItemsController()
  @State private var showAddItemView = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach($controller.items) { item in
          ItemCell(item: item.wrappedValue)
        }
        .listRowSeparator(.hidden)
      }
      .navigationTitle(Text("What's happening"))
      .listStyle(.plain)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Image(systemName: "plus.circle.fill")
            .onTapGesture {
              showAddItemView.toggle()
            }
        }
      }
      .sheet(isPresented: $showAddItemView) {
        AddItemScreen()
          .environmentObject(controller)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsListScreen()
  }
}
