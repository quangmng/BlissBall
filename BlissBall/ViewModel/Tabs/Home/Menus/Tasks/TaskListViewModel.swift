//
//  TaskListViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

class TaskListViewModel: ObservableObject {
  @Published var tasks: [Task]
  @Published var removeTasks: [Task]
  @Published var searchEntry: String
  @Published var newTask: String
  
  init(
    tasks: [Task] = [],
    removeTasks: [Task] = [],
    searchEntry: String = "",
    newTask: String = ""
  ) {
    self.tasks = tasks
    self.removeTasks = removeTasks
    self.searchEntry = searchEntry
    self.newTask = newTask
  }
  
  // Add func for adding item into the taskList
  var searchResults: [Task] {
    guard !searchEntry.isEmpty else { return tasks }
    return tasks.filter { task in
      task.title.lowercased().contains(searchEntry.lowercased())
    }
  }
  
  func delete(at offsets: IndexSet) {
    tasks.remove(atOffsets: offsets)
  }
  
  func addTask(_ task: Task) {
    tasks.append(task)
  }
}
