//
//  MainTodoListView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 05/08/2023.
//

import SwiftUI

struct MainTodoListView: View {
    
    @ObservedObject var todoManager: TodoManager
    @State private var isNewSheetPresented = false
    @State private var showConfirmAlert = false
    
    @State private var priorities: [String] = ["High", "Medium", "Low"]
    
    var body: some View {
        NavigationStack {
            
            List ($todoManager.todos, editActions: [.all]) { $todo in
                //to enable both the rearrage and delete option, we have used 'editActions: [.all]'
                
                ToDoRowView(todo: $todo, priorities: $priorities)
                
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "clipboard")
                    }
                    
                    Button {
                        isNewSheetPresented = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $isNewSheetPresented) {
                NewToDoView (sourceTodos: $todoManager.todos)
                    .presentationDetents([.medium])
                // this makes the sheet medium sized
            }
            .alert(isPresented: $showConfirmAlert) {
                Alert(
                    title: Text("Load Sample Data?"),
                    message: Text("Warning: All existing data will be deleted"),
                    primaryButton: .destructive(Text("Replace")) {
                        todoManager.loadSampleData()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
