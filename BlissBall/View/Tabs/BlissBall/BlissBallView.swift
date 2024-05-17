//
//  BlissBallView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct BlissBallView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  @StateObject var viewModel = BlissBallViewModel()
  @State private var interactBall = false
  @State private var showingTask = false
  @State private var showingAffirmation = false
  @State private var showSuccess = false
  
  var body: some View {
      NavigationStack {
          VStack {
              if showingTask {
                  VStack {
                      Text("Task: \(viewModel.currentTask?.title ?? "No task available")")
                          .font(.system(size: 24))
                          .fontWeight(.semibold)
                          .padding(.horizontal, 25)
                      Button("More Motivation Please") {
                          viewModel.displayRandomAffirmation()
                          showingAffirmation = true
                          showingTask = false
                      }
                      .padding()
                      .buttonStyle(.borderedProminent)
                      HStack {
                          Button("Another Task...") {
                              viewModel.displayRandomTask()
                          }
                          .padding()
                          .buttonStyle(.borderedProminent)
                          .tint(.yellow)
                          Button("Not Now :(") {
                              showingTask = false
                          }
                          .padding()
                          .buttonStyle(.borderedProminent)
                          .tint(.purple)
                      }
                  }
              } else if showingAffirmation {
                  VStack {
                      Text(viewModel.currentAffirmation?.title ?? "No affirmation available")
                          .font(.system(size: 24))
                          .fontWeight(.semibold)
                          .padding(.horizontal, 25)
                      Button("More Motivation Please") {
                          viewModel.displayRandomAffirmation()
                      }
                      .padding()
                      .buttonStyle(.borderedProminent)
                      HStack {
                          Button("Not Now :(") {
                              showingAffirmation = false
                          }
                          .padding()
                          .buttonStyle(.borderedProminent)
                          .tint(.purple)
                          Button("Complete") {
                              viewModel.deleteCompletedTask()
                              showSuccess = true
                              showingAffirmation = false
                          }
                          .padding()
                          .buttonStyle(.borderedProminent)
                          .tint(.green)
                      }
                  }
              } else if showSuccess {
                  Text("Congrats! You did it!")
                      .font(.system(size: 24))
                      .fontWeight(.semibold)
                      .padding(.horizontal, 25)
                  Button("Let's get things done!") {
                      showSuccess = false
                    
                  }
                  .padding()
                  .buttonStyle(.borderedProminent)
              } else {
                  Button {
                      viewModel.displayRandomTask()
                      showingTask = true
                  } label: {
                      CustomBlissBallView()
                          .environmentObject(customBlissBallViewModel)
                  }
                  .padding(.bottom, 16)
                  
                  Text("Shake phone or tap the ball to activate!")
                      .font(.system(size: 24))
                      .fontWeight(.semibold)
                      .padding(.horizontal, 25)
              }
          }
          .navigationTitle("BlissBall")
          .navigationBarTitleDisplayMode(.large)
      }
      .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
          viewModel.displayRandomTask()
          showingTask = true
      }
  }
}

#Preview {
  BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
