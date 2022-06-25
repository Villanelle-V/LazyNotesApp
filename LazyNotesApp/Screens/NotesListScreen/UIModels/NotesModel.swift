//
//  NotesModel.swift
//  LazyNotesApp
//
//  Created by Polina on 14.04.2022.
//

import Foundation

struct Note {
    var date: String {
        var day = String()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        day = formatter.string(from: date)
        
        return day
    }
    
    var time: String {
        var time = String()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        time = formatter.string(from: date)
        
        return time
    }
    
    var text: String
}
