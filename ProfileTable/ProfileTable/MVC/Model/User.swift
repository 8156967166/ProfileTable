//
//  User.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 31/05/22.
//

import Foundation

class User {
    var setName: String?
    var setEmail: String?
    var setWeight: String?
    var setHeight: String?
    var setActivity: String?
    var setBmi: String?
    
    init()
    {
        
    }
    init(strName: String, strEmail: String, strWeight: String, strHeight: String, strActivity: String, strBmi: String) {
        self.setName = strName
        self.setEmail = strEmail
        self.setWeight = strWeight
        self.setHeight = strHeight
        self.setActivity = strActivity
        self.setBmi = strBmi
    }
}
