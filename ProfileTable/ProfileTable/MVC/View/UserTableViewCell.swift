//
//  UserTableViewCell.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 31/05/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var viewHealthData: UIView?
    @IBOutlet weak var viewProfileEdit: UIView?
    @IBOutlet weak var buttonEdit: UIButton?
    @IBOutlet weak var labelName: UILabel?
    @IBOutlet weak var labelEmailTitle: UILabel?
    @IBOutlet weak var labelWeightTitle: UILabel?
    @IBOutlet weak var labelHeightTitle: UILabel?
    @IBOutlet weak var labelActivity: UILabel?
    @IBOutlet weak var labelBmiTitle: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func nameSet(setModelName: User) {
        self.labelName?.text = setModelName.setName
        setStyles()
    }
    func setModels(setUserModels: User) {
        self.labelEmailTitle?.text = setUserModels.setEmail
        self.labelWeightTitle?.text = setUserModels.setWeight
        self.labelHeightTitle?.text = setUserModels.setHeight
        self.labelActivity?.text = setUserModels.setActivity
        self.labelBmiTitle?.text = setUserModels.setBmi
        setStyles()
    }
    func setStyles() {
        viewHealthData?.layer.borderWidth = 1
        viewHealthData?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        viewHealthData?.layer.cornerRadius = 10
        buttonEdit?.layer.borderWidth = 1
        buttonEdit?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        buttonEdit?.layer.cornerRadius = 17
        viewProfileEdit?.layer.borderWidth = 1
        viewProfileEdit?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        viewProfileEdit?.layer.cornerRadius = 14
    }
}
