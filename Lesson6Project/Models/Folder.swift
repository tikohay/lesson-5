//
//  Folder.swift
//  Lesson6Project
//
//  Created by Karahanyan Levon on 01.07.2021.
//

import Foundation

class Folder: Task {
    var name: String
    var tasks: [Folder] = []
    
    init(name: String) {
        self.name = name
    }
}
