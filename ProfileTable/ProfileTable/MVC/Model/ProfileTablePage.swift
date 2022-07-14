//
//  ProfileTablePage.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 25/05/22.
//

import Foundation
enum Functionality {
    case name
    case email
    case phoneNumber
    case nationality
    case activity
    case height
    case weight
    case bmi
    case buttonupdate
}
class Profile {
    var title: String?
    var type: Functionality?
    var identifier: String = ""
    var enteredtext: String = ""
    var enteredCode: String = ""
    init(strtitle: String, functionality: Functionality) {
        self.title = strtitle
        self.type = functionality
        switch type {
        case .name:
            identifier = "table.text"
        case .email:
            identifier = "table.text"
        case .phoneNumber:
            identifier = "table.view"
        case .nationality:
            identifier = "table.text"
        case .activity:
            identifier = "table.text"
        case .height:
            identifier = "table.text"
        case .weight:
            identifier = "table.text"
        case .bmi:
            identifier = "table.text"
        case .buttonupdate:
            identifier = "table.button"
        case .none:
            print("None")
        }
    }
}

