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
    
    
    
    var body: some View {
        
        
        if !todo.isCompleted {
            
            NavigationLink {
                TodoDetailView (todo: $todo)//what do i put here
            } label: {
                HStack {
                    Image (systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    
                    HStack{
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
                        
                        let daysLeft = Calendar.current.dateComponents([.day], from: Date(), to: todo.selectedDate).day!
                        
                        VStack (alignment: .trailing){
                            Text("Due Date in \(daysLeft) days ")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            if todo.priorityOption == 0 {
                                Text ("Priority: High")
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            } else if todo.priorityOption == 1 {
                                Text ("Priority: Medium")
                                    .font(.footnote)
                                    .foregroundColor(.yellow)
                            } else {
                                Text ("Priority: Low")
                                    .font(.footnote)
                                    .foregroundColor(.green)
                            }
                            
                        }
                        .offset(x: 90)
                    }
                }
            }
            
        }
        
    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRowView(todo: .constant(Todo(title: "Sample Todo", subTitle: "Sample Subtitle", isCompleted: false)), priorities: .constant(["High", "Medium", "Low"]))
    }
}
