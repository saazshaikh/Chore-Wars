//
//  NewToDoView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 31/07/2023.
//

import SwiftUI

struct NewToDoView: View {
    
    @State private var newTitle = ""
    @State private var newSubTitle = ""
    @State private var showAlert = false
    @State private var selectedDate = Date()
    @State private var priorityOption = 0
    
    let priorities = ["low", "medium", "high"]
    
    @Binding var sourceTodos: [Todo]
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section ("Info") {
                
                TextField("Enter Title", text: $newTitle)
                TextField("Enter Subtitle", text: $newSubTitle)
                DatePicker("Due Date:", selection: $selectedDate, displayedComponents: .date)
                Picker ("Priority", selection: $priorityOption) {
                    ForEach (0..<priorities.count) { index in
                        Text(priorities[index]).tag(index)
                    }
                }
                
            }
            
            Section ("Action") {
                
                Button("Save"){
                    
                    if newTitle != "" {
                        let newTodo = Todo(title: newTitle, subTitle: newSubTitle)
                        sourceTodos.append(newTodo)
                        dismiss ()
                    } else {
                        showAlert = true
                    }
                    
                }
                
                Button ("Cancel", role: .destructive) {
                    
                    dismiss ()
                    
                }
            }
            
        }
        .alert (isPresented: $showAlert) {
            Alert(
                title: Text("Looks like you forgot something--"),
                message: Text("You must have a title for the new to-do ;)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(sourceTodos: .constant([]))
    }
}
