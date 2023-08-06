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
    @Binding var isCompleted: Bool
    
    var body: some View {
        
        if !todo.isCompleted { //reminder: isCompleted is originally false
            List {
                TextField ("Title", text: $todo.title)
                TextField ("Subtitle", text: $todo.subTitle)
                Toggle ("Completed?", isOn: $todo.isCompleted)//why does the toggle not move???
                DatePicker("Due Date:", selection: $todo.selectedDate, displayedComponents: .date)
                Picker ("Priority", selection: $todo.priorityOption) {
                    ForEach (0..<priorities.count, id: \.self) { index in
                        Text(priorities[index]).tag(index)
                    }
                }
            }
            .navigationTitle("Todo Detail:")
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let todo = Todo(title: "Some title", subTitle: "some subtitle")
        let priorities = ["High", "Medium", "Low"]
        let isCompleted = false // or true depending on your case
        
        return TodoDetailView(
            todo: .constant(todo),
            priorities: .constant(priorities),
            isCompleted: .constant(isCompleted)
        )
    }
}
