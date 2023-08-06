//
//  Todo.swift
//  Chore Wars
//
//  Created by Saaz Shaikh on 27/07/2023.
//

import Foundation

struct Todo: Identifiable, Codable {
    //codable just means the stuff in the view is encodable and decodable, this also means that the stuff in this view exits int the device's memory. allows things to be written to disk and being read from disk
    
    var id = UUID()
    var title: String
    var subTitle: String
    var isCompleted = false
    var selectedDate = Date()
    var priorityOption = 0
}
