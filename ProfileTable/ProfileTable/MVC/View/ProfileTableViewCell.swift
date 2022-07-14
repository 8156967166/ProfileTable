//
//  ProfileTableViewCell.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 25/05/22.
//

import UIKit

protocol PassDataToViewControllerDelegate {
    func passData(str: String, passModel: Profile)
    func passCode(strCode: String)
    func buttonAction()
}
class ProfileTableViewCell: UITableViewCell, UITextFieldDelegate {
    var model: Profile!
  
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var txtfield: UITextField?
    @IBOutlet weak var viewPhone: UIView?
    @IBOutlet weak var textcode: UITextField?
    @IBOutlet weak var buttonUpdate: UIButton?
    var delegate: PassDataToViewControllerDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func prepareForReuse() {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setModel(setProfileModel: Profile) {
        self.labelTitle?.text = setProfileModel.title
        txtfield?.text = setProfileModel.enteredtext
        txtfield?.delegate = self
        textcode?.delegate = self
        model = setProfileModel
        setPlaceholderKeyboardtype()
        setStyle()
    }
    func setPlaceholderKeyboardtype() {
        if model.type == .name {
            txtfield?.placeholder = "name"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .email {
            txtfield?.placeholder = "email"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .phoneNumber {
            txtfield?.placeholder = "PhoneNumber"
            txtfield?.keyboardType = .phonePad
            addDoneButtonOnKeyboard()
        } else if model.type == .nationality {
            txtfield?.placeholder = "Nationality"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .activity {
            txtfield?.placeholder = "Activity Level"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .height {
            txtfield?.placeholder = "height"
            txtfield?.keyboardType = .numberPad
            addDoneButtonOnKeyboard()
        } else if model.type == .weight {
            txtfield?.placeholder = "weight"
            txtfield?.keyboardType = .numberPad
            addDoneButtonOnKeyboard()
        } else if model.type == .bmi {
            txtfield?.placeholder = "Bmi Value"
            txtfield?.keyboardType = .numberPad
            addDoneButtonOnKeyboard()
        }
    }
    func setStyle() {
        viewPhone?.layer.borderWidth = 1
        viewPhone?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        viewPhone?.layer.cornerRadius = 6
        buttonUpdate?.layer.borderWidth = 1
        buttonUpdate?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        buttonUpdate?.layer.cornerRadius = 6
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("text entered: \(txtfield?.text ?? "")")
        delegate?.passData(str: txtfield?.text ?? "", passModel: model)
       
        if textField == textcode {
            delegate?.passCode(strCode: textcode?.text ?? "")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.endEditing(true)
        return true;
    }
    @IBAction func buttonActionUpdate(sender: UIButton) {
        delegate?.buttonAction()
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            txtfield?.inputAccessoryView = doneToolbar
    }
        @objc func doneButtonAction(){
            txtfield?.resignFirstResponder()
        }
}
