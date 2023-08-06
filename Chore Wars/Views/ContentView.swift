//
//  ContentView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    var badgeCount: Int {
            todoManager.numTodosNotDone
        }
    
    var body: some View {
        TabView {
            MainTodoListView (todoManager: todoManager)
                .tabItem {
                    Label ("Todos", systemImage: "checkmark.circle.fill")
                }
            
            HowManyMoreView(todoManager: todoManager)
                .tabItem {
                    Label("Number of todos", systemImage: "number.circle.fill")
                }
                .badge(badgeCount > 0 ? "\(badgeCount)" : nil)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
