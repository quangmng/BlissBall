//
//  TaskView_another.swift
//  BlissBubble
//
//  Created by Wende Zhou on 10/5/2024.
//

import SwiftUI

struct TaskView_another: View {
  //Declare array/write to file to store tasks as a list
  @State var tasks: [String] = []
  @State private var searchEntry = ""
  @State private var newTask = ""
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(searchResults, id: \.self) { task in
          Text(task)
        }
      }
    }
    
    VStack {
      
      Button {
        
      } label: {
        HStack{
          Image(systemName: "plus.circle.fill")
          Text("Add task")
          Spacer()
            .frame(width: 200)
        }
      }
    }
    .font(.system(size: 20))
    .foregroundColor(.blue)
  }
  
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
  TaskView_another()
}
