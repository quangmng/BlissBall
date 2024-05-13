//
//  TaskModel.swift
//  BlissBubble
//
//  Created by Quang Minh Nguyen on 12/5/2024.
//

import Foundation

struct TaskModel: Codable{
    var task: String
    var affirmation: String
}

struct TasksModel: Codable{
    var tasks: [TaskModel]
}
