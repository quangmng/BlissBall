//
//  SelfAffirmationView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct SelfAffirmationView: View {
    @StateObject var saViewModel = SelfAffirmationViewModel()
    @State private var showingNewAffirmationEntry = false
    @State private var newAffirmationEntry = ""
    @State private var isFetchingQuote = false // State variable for fetching
    @State private var remainingUses = 5 // Number of uses remaining in the current period
    @State private var countdown = 30 // Countdown timer for the cooldown period
    @State private var isCooldownActive = false // State variable to track cooldown

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if showingNewAffirmationEntry {
                        TextField("Say Something Motivating", text: $newAffirmationEntry)
                            .autocapitalization(.sentences)
                            .textFieldStyle(.plain)
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                            .onSubmit {
                                let newAffirmation = Affirmation(title: newAffirmationEntry)
                                saViewModel.addAffirmation(newAffirmation)
                                newAffirmationEntry = ""
                                showingNewAffirmationEntry = false
                            }
                    }
                    ForEach(saViewModel.searchResults) { affirmation in
                        Text(affirmation.title)
                            .transition(.move(edge: .top)) // Adds a moving transition for each item
                    }
                    .onDelete(perform: saViewModel.delete)
                }
                .animation(.spring(), value: saViewModel.affirmations) // Apply spring animation to the list
                VStack {
                    Button {
                        withAnimation {
                            showingNewAffirmationEntry = true // Toggle the text field's visibility with animation
                        }
                    } label: {
                        HStack {
                            HStack(alignment: .center){
                                Image(systemName: "plus.circle.fill")
                                Text("Say something motivating")
                            }
                            .padding(.leading, 30)

                            Spacer()
                        }
                        .font(.system(size: 20))
                        .padding(8)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    Text("OR")
                    Button {
                        isFetchingQuote = true // Disable the button
                        Task {
                            await saViewModel.fetchData()
                            if let fetchedQuote = saViewModel.quoteData?.quote {
                                let newAffirmation = Affirmation(title: fetchedQuote)
                                saViewModel.addAffirmation(newAffirmation)
                                newAffirmationEntry = fetchedQuote
                            }
                            isFetchingQuote = false // Re-enable the button
                            remainingUses -= 1
                            if remainingUses == 0 {
                                startCooldown()
                            }
                        }
                    } label: {
                        Text(isCooldownActive ? "Please wait \(countdown)s to generate new quotes" : "Generate a random inspirational quote")
                    }
                    
                    .padding(.top, 2)
                    .buttonStyle(.borderedProminent)
                    .disabled(isFetchingQuote || isCooldownActive || remainingUses <= 0) // Disable the button if a quote is being fetched or cooldown is active
                }
                .toolbar {
                    EditButton()
                }
                .navigationTitle("Let's get motivated!")
                .searchable(text: $saViewModel.searchEntry)
            }
        }
    }

    // Start cooldown timer
    private func startCooldown() {
        isCooldownActive = true
        countdown = 30

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            countdown -= 1
            if countdown <= 0 {
                timer.invalidate()
                isCooldownActive = false
                remainingUses = 5
            }
        }
    }
}


#Preview {
    SelfAffirmationView()
}
