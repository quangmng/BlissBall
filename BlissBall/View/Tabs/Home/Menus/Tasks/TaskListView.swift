//
//  TaskView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//	 Modified a little bit by Wende Zhou on 10/5/2024

import SwiftUI

struct TaskListView: View {
  @StateObject var taskListViewModel = TaskListViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(taskListViewModel.searchResults, id: \.self) { task in
            Text(task.title)
          }
          .onDelete(perform: taskListViewModel.delete)
        }
        
        HStack {
          NavigationLink {
            TaskView(taskListViewModel: taskListViewModel)
          } label: {
            HStack {
              HStack {
                Image(systemName: "plus.circle.fill")
                
                Text("Add task")
              }
              .padding(.leading, 30)
              
              Spacer()
            }
            .padding(.bottom, 30)
          }
          .font(.system(size: 20))
        }
      }
      .toolbar{
        EditButton()
      }
      .navigationTitle("Your Tasks")
      .searchable(text: $taskListViewModel.searchEntry, prompt: "Search Task")
    }
  }
}


#Preview {
  TaskListView()
}

