//
//  ToDo.swift
//  ToDos
//
//  Created by Roberto Conte Rosito on 18/04/2020.
//  Copyright © 2020 Roberto Conte Rosito. All rights reserved.
//

import Foundation

struct ToDo : Identifiable, Hashable {
    var id = UUID()
    var title : String;
    var content : String;
    var modified : Date = Date()
    var priority : Bool = false    
    
    func shortDescription() -> String {
        if !content.isEmpty && content.count > 100 {
            return String(content.prefix(100))
        }
        return content
    }
}
