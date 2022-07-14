//
//  AddInterests.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 01/06/22.
//

import Foundation
import UIKit
enum Functionalities {
    case cycling
    case run
    case walk
}
class AddInterests {
    var setLabelInterests: String?
    var settype: Functionalities
    var setImageIcon: String?
    var isSelect: Bool = false
    var isSelected: Bool = false
    init(strInterests: String, strtype: Functionalities, image: String ) {
        self.setLabelInterests = strInterests
        self.settype = strtype
        self.setImageIcon = image
    }
}
