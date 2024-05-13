//
//  TaskListViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

class TaskListViewModel: ObservableObject {
  @Published var tasks: [BlissTask]
  @Published var removeTasks: [BlissTask]
  @Published var searchEntry: String
  @Published var newTask: String
  
  init(
    tasks: [BlissTask] = [],
    removeTasks: [BlissTask] = [],
    searchEntry: String = "",
    newTask: String = ""
  ) {
    self.tasks = tasks
    self.removeTasks = removeTasks
    self.searchEntry = searchEntry
    self.newTask = newTask
  }
  
  // Add func for adding item into the taskList
  var searchResults: [BlissTask] {
    guard !searchEntry.isEmpty else { return tasks }
    return tasks.filter { task in
      task.title.lowercased().contains(searchEntry.lowercased())
    }
  }
  
  func delete(at offsets: IndexSet) {
    tasks.remove(atOffsets: offsets)
  }
  
  func addTask(_ task: BlissTask) {
    tasks.append(task)
  }
}
