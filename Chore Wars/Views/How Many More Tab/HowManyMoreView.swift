//
//  HowManyMoreView.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 05/08/2023.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager

    
    
    var body: some View {
        ZStack{
            Text("You have: ")
                .font(.largeTitle)
                .offset(y: -150)
            Text("\(todoManager.numTodosNotDone)")
                .font(.system(size: 170))
                .foregroundColor(.blue)
            if todoManager.numTodosNotDone == 1 {
                Text("todo left")
                    .font(.title2)
                    .offset(y: 150)
            } else {
                Text("todos left")
                    .font(.title2)
                    .offset(y: 150)
            }
            
            Text("you completed \(todoManager.numTodosDone)... well done!")
                .offset(y: 200)
                .foregroundColor(.gray)
                
        }
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
