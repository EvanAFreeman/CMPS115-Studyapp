//
//  todo_list.swift
//  StudyCat
//
//  Created by Camille Rogers on 11/26/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation

//Created to make the todo list stored globally
class todo_list{
    //initialize an empty string
    var list: [String] = [ ]
    //create a singleton class so there is only one instance of the timer
    static let shared = todo_list()
    init() {
    }

}
