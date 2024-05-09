//
//  SelfAffirmationView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct SelfAffirmationView: View {
    @State var affirmations: [String] = []
    @State private var searchEntry = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(searchResults, id: \.self) { affirmation in
                    Text(affirmation)
                }
                .onDelete(perform: delete)
                HStack{
                    Button(action: {
                      //Add another item into list
                    },label: {
                        HStack{
                            Image(systemName:"plus.circle.fill")
                            Text("Add task")
                        }
                    })
                    .font(.system(size: 18))
                    
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Let's get motivated!")
        }
        .searchable(text: $searchEntry)
    }
    
    //Add func for adding item into the affirmationsList
    
    var searchResults: [String] {
        if searchEntry.isEmpty {
            return affirmations
        } else {
            return affirmations.filter { $0.contains(searchEntry) }
        }
    }
    func delete(at offsets: IndexSet) {
            affirmations.remove(atOffsets: offsets)
        }
}
    

#Preview {
    SelfAffirmationView()
}
