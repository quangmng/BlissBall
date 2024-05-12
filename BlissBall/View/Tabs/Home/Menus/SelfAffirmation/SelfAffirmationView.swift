//
//  SelfAffirmationView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import SwiftUI

struct SelfAffirmationView: View {
  @Environment(\.dismiss) var dismiss
  
  @ObservedObject var viewModel: SelfAffiramtionListViewModel
  
  @State var affirmationTitle: String = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack(alignment: .leading) {
          Text("Affirmation")
            .font(.title2)
            .fontWeight(.semibold)
          TextField("Write affirmation", text: $affirmationTitle)
        }
        .padding(.bottom, 30)
        
        Button {
          viewModel.addAffirmation(.init(title: affirmationTitle))
          dismiss()
        } label: {
          Text("Create")
        }
        
        
        Spacer()
      }
      .padding()
      .navigationTitle("Add Affirmation")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  SelfAffirmationView(viewModel: SelfAffiramtionListViewModel())
}
