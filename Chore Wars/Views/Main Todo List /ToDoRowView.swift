//
//  ToDoRowView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 31/07/2023.
//

import SwiftUI

struct ToDoRowView: View {
    
    @Binding var todo: Todo
    @Binding var priorities: [String]
    @Binding var isCompleted: Bool
    
    var body: some View {
        
        if !todo.isCompleted {
            
            NavigationLink {
                TodoDetailView (todo: $todo, priorities: $priorities, isCompleted: $isCompleted)//what do i put here
            } label: {
                HStack {
                    Image (systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    
                    VStack (alignment: .leading){
                        Text(todo.title)
                            .strikethrough(todo.isCompleted)
                        
                        if  !todo.subTitle.isEmpty {
                            Text (todo.subTitle)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .strikethrough(todo.isCompleted)
                        }
                    }
                }
            }
            
        }
        
    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRowView(todo: .constant(Todo(title: "Sample Todo", subTitle: "Sample Subtitle", isCompleted: false)), priorities: .constant(["High", "Medium", "Low"]), isCompleted: .constant(true))
    }
}
