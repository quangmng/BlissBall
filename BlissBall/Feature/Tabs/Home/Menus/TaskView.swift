//
//  TaskView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct TaskView: View {
    //Declare array/write to file to store tasks as a list
    @State var tasks: [String] = [""]
    @State private var searchEntry = ""
    
    var body: some View {
        NavigationStack{
            
            List {
                ForEach(searchResults, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: delete)
            }
            
            .safeAreaInset(edge: .bottom, alignment: .trailing){
                HStack{
                    Button(action: {},
                           label: {
                        Image(systemName:"plus.circle.fill")
                        Text("Add task")
                        
                    })
                    .font(.system(size: 18))
                    .padding(.top, 10)
                }
                Spacer().frame(height: 20)
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
