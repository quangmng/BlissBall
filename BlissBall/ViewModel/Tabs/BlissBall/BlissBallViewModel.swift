//
//  BlissBallViewModel.swift
//  BlissBall
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation
import Combine

class BlissBallViewModel: ObservableObject {
    @Published var currentTask: BlissTask?
    @Published var currentAffirmation: Affirmation?
    
    @Published var tasks: [BlissTask] {
        didSet {
            saveTasks()
        }
    }
    
    @Published var affirmations: [Affirmation] {
        didSet {
            saveAffirmations()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.tasks = UserDefaults.standard.loadTasks() ?? []
        self.affirmations = UserDefaults.standard.loadAffirmations() ?? []
    }
    
    func displayRandomTask() {
        currentTask = tasks.randomElement()
    }
    
    func displayRandomAffirmation() {
        currentAffirmation = affirmations.randomElement()
    }
    
    func deleteCompletedTask() {
        currentTask = nil
    }
    
    private func saveTasks() {
        UserDefaults.standard.saveTasks(tasks)
    }
    
    private func saveAffirmations() {
        UserDefaults.standard.saveAffirmations(affirmations)
    }
}

extension UserDefaults {
    private enum Keys {
        static let tasks = "tasks"
        static let affirmations = "affirmations"
    }
    
    func loadTasks() -> [BlissTask]? {
        guard let data = data(forKey: Keys.tasks) else { return nil }
        return try? JSONDecoder().decode([BlissTask].self, from: data)
    }
    
    func saveTasks(_ tasks: [BlissTask]) {
        let data = try? JSONEncoder().encode(tasks)
        set(data, forKey: Keys.tasks)
    }
    
    func loadAffirmations() -> [Affirmation]? {
        guard let data = data(forKey: Keys.affirmations) else { return nil }
        return try? JSONDecoder().decode([Affirmation].self, from: data)
    }
    
    func saveAffirmations(_ affirmations: [Affirmation]) {
        let data = try? JSONEncoder().encode(affirmations)
        set(data, forKey: Keys.affirmations)
    }
}
