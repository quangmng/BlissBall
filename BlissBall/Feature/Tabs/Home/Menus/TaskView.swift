//
//  TaskView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct TaskView: View {
    //Declare array/write to file to store tasks as a list
    @State var tasks: [String] = []
    @State private var searchEntry = ""
    
    var body: some View {
        NavigationStack{
            
            List{
                Section{
                ForEach(searchResults, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: delete)
            }
            
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
            
            .toolbar{
                EditButton()
            }
            
            .navigationTitle("Your Tasks")
            
        }
        .searchable(text: $searchEntry)

    }

    
    //Add func for adding item into the taskList
    
    var searchResults: [String] {
        if searchEntry.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.contains(searchEntry) }
        }
    }
    func delete(at offsets: IndexSet) {
            tasks.remove(atOffsets: offsets)
        }
}


#Preview {
    TaskView()
}
