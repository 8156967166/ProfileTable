//
//  AddInterestsTableViewCell.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 01/06/22.
//

import UIKit

class AddInterestsTableViewCell: UITableViewCell {
    @IBOutlet weak var labelAddinterests: UILabel?
    @IBOutlet weak var imageviewIcon: UIImageView?
    @IBOutlet weak var imageViewSelected: UIImageView?
    @IBOutlet weak var imageViewPerson: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setInterestsModel(setAddInterests: AddInterests) {
        self.labelAddinterests?.text = setAddInterests.setLabelInterests
        self.imageviewIcon?.image = UIImage(named: setAddInterests.setImageIcon!)  
    }
   
}
