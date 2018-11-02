//
//  DataServices.swift
//  StudyCat
//
//  Created by Youmna Shafiq on 10/24/18.
//  Copyright © 2018 Kit. All rights reserved.
//

import Foundation
import Firebase         //import Firebase

//Create constant to allow access to our data base
let DB_BASE = Database.database().reference()

class DataServices {
    //accessable to any other class
    static let instance = DataServices()              // creating an instance of view controller class inside itself
    
    private var _REF_BASE = DB_BASE                    // hold the value of DB_Base
    private var _REF_USERS = DB_BASE.child("users")    // save users account in firebase
    
    // create public variables to set the value
    // public variables that are accessing the private one
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    //create a function that is going to allow the user to push a user into the user field
    //Each user account information will be save in the firebase
    func createDBUser(uid: String, userData: Dictionary<String,Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}






