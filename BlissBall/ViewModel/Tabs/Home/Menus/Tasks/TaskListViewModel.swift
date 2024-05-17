//
//  TaskListViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [BlissTask]
    @Published var removeTasks: [BlissTask]
    @Published var searchEntry: String
    @Published var newTask: String
    
    private var cancellables = Set<AnyCancellable>()
    private let userDefaultsKey = "tasks"
    
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
        saveTasks(tasks)
    }
    
    func addTask(_ task: BlissTask) {
        tasks.insert(task, at: 0) // Add task to the top of the list
        saveTasks(tasks)
    }
    
    private func saveTasks(_ tasks: [BlissTask]) {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedTasks = try? JSONDecoder().decode([BlissTask].self, from: data) {
            tasks = savedTasks
        }
    }
}
