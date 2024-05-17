//
//  TaskView.swift
//  BlissBall
//
//  Created by JungWoo Choi on 3/5/2024.
//	Modified a bit by Wende Zhou on 10/5/2024.
//  Modified a lot by QM on 11/5/2024.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var taskListViewModel: TaskListViewModel
    @State private var showingNewTaskEntry = false // State to toggle new task entry visibility
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationStack {
            List {
                if showingNewTaskEntry {
                    TextField("Enter a new task", text: $newTaskTitle)
                        .autocapitalization(.sentences)
                        .textFieldStyle(.plain)
                        //.padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .onSubmit {
                            let newTask = BlissTask(title: newTaskTitle)
                            taskListViewModel.addTask(newTask)
                            newTaskTitle = ""
                            showingNewTaskEntry = false
                        }
                }

                ForEach(taskListViewModel.searchResults) { task in
                    Text(task.title)
                        .transition(.move(edge: .top)) // Adds a moving transition for each item
                }
                .onDelete(perform: taskListViewModel.delete)
            }
            .animation(.spring(), value: taskListViewModel.tasks) // Apply spring animation to the list
            .safeAreaInset(edge: .bottom, alignment: .leading) {
                Button(action: {
                    withAnimation {
                        showingNewTaskEntry = true // Toggle the text field's visibility with animation
                    }
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Task")
                        Spacer()
                    }
                    .font(.system(size: 20))
                    .padding(8)
                    .frame(width: 136)
                })
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Your Tasks")
            .searchable(text: $taskListViewModel.searchEntry)
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskListViewModel: TaskListViewModel())
    }
}
