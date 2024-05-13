//
//  TaskView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//	 Modified a little bit by Wende Zhou on 10/5/2024

import SwiftUI

struct TaskView: View {
    //Declare array/write to file to store tasks as a list
    @State var tasks: [String] = []
    @State private var searchEntry = ""
	@State private var newTask = ""
    @EnvironmentObject var tabVM: TabViewModel
    var body: some View {
		NavigationView{
            List{
        Section {
                            TextField("New Task", text: $newTask, prompt: Text("Enter a new task"))
                        }
                ForEach(searchResults, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: delete)
        }
            
            .safeAreaInset(edge: .bottom, alignment: .leading) {
                
                
                
				Button(action: {
                    if !newTask.isEmpty {
                        tasks.append(newTask)
                        newTask = ""
                    }
				}, label:{
					HStack{
						Image(systemName: "plus.circle.fill")
						Text("Add task")
                        
						Spacer()
                            .frame(maxWidth: 2)
					}
                    .font(.system(size: 20))
                    .padding(8)
				})
                .padding()
				
                .buttonStyle(.borderedProminent)
                

			}
            .toolbar{
                EditButton()
            }
            
            .navigationTitle("Your Tasks")
            
        }
        .searchable(text: $searchEntry)
        // Whenever TaskView appears, hide the TabView
            .onAppear {
                tabVM.isTabViewVisible = false
            }
            // When TaskView disappears, show the TabView
            .onDisappear {
                tabVM.isTabViewVisible = true
            }
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
    struct TaskView_Previews: PreviewProvider {
        static var previews: some View {
            // Create an instance of the TabViewModel
            let tabViewModel = TabViewModel()

            TaskView()
                // Provide the instance to the TaskView environment
                .environmentObject(tabViewModel)
        }
    }
}







