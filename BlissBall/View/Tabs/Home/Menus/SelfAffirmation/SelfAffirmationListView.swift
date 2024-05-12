//
//  SelfAffirmationView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct SelfAffirmationListView: View {
  @StateObject var viewModel = SelfAffiramtionListViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(viewModel.searchResults, id: \.self) { affirmation in
            Text(affirmation.title)
          }
          .onDelete(perform: viewModel.delete)
        }
        
        HStack {
          NavigationLink {
            SelfAffirmationView(viewModel: viewModel)
          } label: {
            HStack {
              HStack {
                Image(systemName:"plus.circle.fill")
                
                Text("Add motivation")
              }
              .padding(.leading, 30)
              
              Spacer()
            }
            .padding(.bottom, 30)
          }
          .font(.system(size: 18))
        }
      }
      .toolbar {
        EditButton()
      }
      .navigationTitle("Let's get motivated!")
      .searchable(text: $viewModel.searchEntry)
    }
  }
}


#Preview {
  SelfAffirmationListView()
}
