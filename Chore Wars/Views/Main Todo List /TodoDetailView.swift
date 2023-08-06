//
//  TodoDetailView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 27/07/2023.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    @Binding var priorities: [String]
    
    
    var body: some View {
        
        if !todo.isCompleted { //reminder: isCompleted is originally false 
            List {
                TextField ("Title", text: $todo.title)
                TextField ("Subtitle", text: $todo.subTitle)
                Toggle ("Completed?", isOn: $todo.isCompleted)//do somethig which shows the value of todo.isCompleted at this point in the code
                
                DatePicker("Due Date:", selection: $todo.selectedDate, displayedComponents: .date)
                Picker ("Priority", selection: $todo.priorityOption) {
                    ForEach (0..<priorities.count) { index in //error here: Cannot convert value of type 'Binding<Subject>' to expected argument type 'Int', and Value of type 'Binding<NewToDoView>' has no dynamic member 'count' using key path from root type 'NewToDoView'
                        Text(priorities[index]).tag(index)// error here: Referencing subscript 'subscript(_:)' on 'Binding' requires that 'NewToDoView' conform to 'MutableCollection'
                    }
                }
            }
            .navigationTitle("Todo Detail:")
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(
            todo: .constant(Todo(title: "Some title", subTitle: "some subtitle")),
            priorities: .constant(["High", "Medium", "Low"]) // Example priorities array
        )
    }
}
