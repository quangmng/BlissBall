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
    @State var tasks: [String] = []
    @State private var searchEntry = ""
    @State private var newTask = ""
    @State private var showingNewTaskEntry = false// State to toggle new task entry visibility

    var body: some View {
        NavigationStack {
            List {
                if showingNewTaskEntry {
                    TextField("Enter a new task", text: $newTask)
                        .autocapitalization(.sentences)
                        .textFieldStyle(.plain)
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .onSubmit {
                            addTask()
                        }
                        //.focused($showingNewTaskEntry)
                }

                ForEach(searchResults, id: \.self) { task in
                    Text(task)
                        .transition(.move(edge: .top)) // Adds a moving transition for each item
                }
                .onDelete(perform: delete)
            }
            .animation(.spring(), value: tasks) // Apply spring animation to the list
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
                })
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Your Tasks")
        }
        .searchable(text: $searchEntry)
    }

    var searchResults: [String] {
        if searchEntry.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.contains(searchEntry) }
        }
    }

    func addTask() {
        if !newTask.isEmpty {
            withAnimation {
                tasks.insert(newTask, at: 0) // Insert new task at the top of the list
            }
            newTask = ""
            showingNewTaskEntry = false
        }
    }

    func delete(at offsets: IndexSet) {
        withAnimation {
            tasks.remove(atOffsets: offsets)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
