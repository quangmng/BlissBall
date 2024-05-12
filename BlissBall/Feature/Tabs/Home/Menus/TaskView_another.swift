import SwiftUI

struct TaskView_another: View {
    @State var tasks: [String] = []
    @State private var searchEntry = ""
    @State private var newTask = ""
    @FocusState private var showingNewTaskEntry: Bool // State to toggle new task entry visibility
    
    var body: some View {
        NavigationStack {
            List {
                if showingNewTaskEntry {
                    TextField("New Task", text: $newTask, prompt: Text("Enter a new task"))
                        .autocapitalization(.sentences)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            addTask() // Adds the task when user hits return
                        }
                        .focused($showingNewTaskEntry) // Focus the text field when showingNewTaskEntry is true
                }
                
                Section(header: Text("Tasks")) {
                    ForEach(searchResults, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: delete)
                }
            }
            .safeAreaInset(edge: .bottom, alignment: .leading) {
                Button(action: {
                    withAnimation {
                        showingNewTaskEntry = true // Always set to true when button is tapped
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
            tasks.append(newTask)
            newTask = "" // Clear the new task input field after adding to the list
            showingNewTaskEntry = false // Hide the text field after the task is added
        }
    }
    
    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
