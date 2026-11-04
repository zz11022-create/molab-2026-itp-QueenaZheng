//
// ContentView.swift
// MakeItSo
//
// Created by Peter Friese on 01.03.23.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import SwiftUI

struct RemindersListView: View {
  @StateObject
  private var viewModel = RemindersListViewModel()

  @State
  private var isAddReminderDialogPresented = false

  @State
  private var editableReminder: Reminder? = nil
    
@AppStorage("petName") var petName = "Mochi"

  private func presentAddReminderView() {
    isAddReminderDialogPresented.toggle()
  }

  var body: some View {
      
      VStack(spacing: 8) {
          
          if viewModel.reminders.isEmpty {
              Text("🐾 All pet care tasks are done!")
                  .foregroundColor(.gray)
          }
          
          Text("Taking care of \(petName) 🐾")
                  .font(.subheadline)
                  .foregroundColor(.gray)
          
          Text("Quick Add")
              .font(.headline)
          
          Text("\(viewModel.reminders.count) tasks")
              .font(.subheadline)
              .foregroundColor(.gray)

          HStack(spacing: 8) {
              Button("🍚 Feed") {
                  viewModel.addReminder(
                      Reminder(title: "Feed")
                  )
              }
              .buttonStyle(.bordered)

              Button("💧 Water") {
                  viewModel.addReminder(
                      Reminder(title: "Refill Water")
                  )
              }
              .buttonStyle(.bordered)

              Button("🐾 Walk") {
                  viewModel.addReminder(
                      Reminder(title: "Walk")
                  )
              }
              .buttonStyle(.bordered)
          }
      }
      .padding(.horizontal)
      
    List($viewModel.reminders) { $reminder in
      RemindersListRowView(reminder: $reminder)
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
          Button(role: .destructive, action: { viewModel.deleteReminder(reminder) }) {
            Image(systemName: "trash")
          }
          .tint(Color(UIColor.systemRed))
        }
        .onChange(of: reminder.isCompleted) { newValue in
          viewModel.setCompleted(reminder, isCompleted: newValue)
        }
        .onTapGesture {
          editableReminder = reminder
        }
    }
    .toolbar {
      ToolbarItemGroup(placement: .bottomBar) {
        Button(action: presentAddReminderView) {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("New Pet Task")
          }
        }
        Spacer()
      }
    }
    .sheet(isPresented: $isAddReminderDialogPresented) {
      EditReminderDetailsView { reminder in
        viewModel.addReminder(reminder)
      }
    }
    .sheet(item: $editableReminder) { reminder in
      EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
        viewModel.updateReminder(reminder)
      }
    }
    .tint(.pink)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      RemindersListView()
            .navigationTitle("Pet Care Tasks")
    }
  }
}
