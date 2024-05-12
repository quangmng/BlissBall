//
//  TaskView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import SwiftUI

struct TaskView: View {
  @Environment(\.dismiss) var dismiss
  
  @ObservedObject var taskListViewModel: TaskListViewModel
  
  @State var taskTitle: String = ""
  @State var taskContent: String = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack(alignment: .leading) {
          Text("Title")
            .font(.title2)
            .fontWeight(.semibold)
          TextField("Write Title", text: $taskTitle)
            .padding(.bottom, 30)
        }
        
        VStack(alignment: .leading) {
          Text("Content")
            .font(.title2)
            .fontWeight(.semibold)
          TextField("Write Task Content", text: $taskContent)
        }
        .padding(.bottom, 30)
        
        Button {
          taskListViewModel.addTask(.init(title: taskTitle, content: taskContent))
          dismiss()
        } label: {
          Text("Create")
        }

        
        Spacer()
      }
      .padding()
      .navigationTitle("Add Task")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  TaskView(taskListViewModel: TaskListViewModel())
}
