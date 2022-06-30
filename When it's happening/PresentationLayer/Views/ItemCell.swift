//
//  ItemCell.swift
//  When it's happening
//
//  Created by Simran Preet Singh Narang on 2022-06-29.
//

import SwiftUI

struct ItemCell: View {
  
  var item: ItemViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(item.title)
          .font(.title3)
        Text("\(item.formattedDate)")
          .font(.caption)
      }
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.gray.opacity(0.1))
    .cornerRadius(10)
  }
}

struct ItemCell_Previews: PreviewProvider {
  static var previews: some View {
    ItemCell(item: ItemViewModel())
  }
}
