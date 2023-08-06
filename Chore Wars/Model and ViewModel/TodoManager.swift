//
//  TodoManager.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 05/08/2023.
//

import Foundation
import SwiftUI

//did not look much into how this code works, all we did was replace "Text" with "Todo" and "item" with "todo"
class TodoManager: ObservableObject {
    //"ObservableObject" this Object will alert people when it changes its contents
    @Published var todos: [Todo] = [] {
        didSet {
        // what "didSet" does is that when todos is changed-- it saves the changes
            save()
        }
    }
    
    var numTodosDone: Int {
        todos.filter {$0.isCompleted}.count
    }
    var numTodosNotDone: Int {
        todos.filter {!$0.isCompleted}.count
    }
        
    init() {
        load()
    }
    
    func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
