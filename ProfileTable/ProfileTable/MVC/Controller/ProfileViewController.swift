//
//  ViewController.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 25/05/22.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate, PassDataToViewControllerDelegate {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var viewProfilecam: UIView!
    let userModel: User! = User()
    var validation = Validation()
    func passCode(strCode: String) {
        for model in editProfile {
            if model.type == .phoneNumber {
                print("code entered: \(strCode)")
                model.enteredCode = strCode
            }
        }
    }
    func passData(str: String, passModel: Profile) {
        for model in editProfile {
            if model.type == passModel.type {
                print("Entered text: \(str)")
                model.enteredtext = str
            }
        }
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    func showAlert(strTitle: String, strMessage: String) {
            let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
    }
    func buttonAction() {
        self.view.endEditing(true)
        for model in editProfile {
            print("loop executed")
            if model.type != .buttonupdate {
                if model.type == .name {
                    let isValidateName = self.validation.validateName(name: model.enteredtext)
                    if(isValidateName == false) {
                        showAlert(strTitle: "Invalid", strMessage: "Enter valid Name")
                    }
                }
                if model.type == .email {
                    let isValidateEmail = self.validation.validateEmailId(emailID: model.enteredtext)
                    if(isValidateEmail == false) {
                        showAlert(strTitle: "Invalid", strMessage: "Enter Valid Email")
                    }
                }
                if model.type == .phoneNumber  {
                    if model.enteredCode.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter the code")
                        return
                    }
                    let isValidatePhoneNumber = self.validation.validatePhoneNumber(phoneNumber: model.enteredtext)
                        if(isValidatePhoneNumber == false) {
                            showAlert(strTitle: "Invalid", strMessage: "Enter Valid PhoneNUmber")
                            return
                        }
                }
                if model.type == .nationality {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter Your Nationality")
                    }
                }
                if model.type == .activity {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter Activity Level")
                    }
                }
                if model.type == .height {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter Your Height")
                    }
                }
                if model.type == .weight {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter Your Weight")
                    }
                }
                if model.type == .bmi {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Empty", strMessage: "Enter BMI Value")
                    }
                }
            }
        }
        print("button clicked")
       
        for model in editProfile {
            if model.type == .name {
                userModel.setName = model.enteredtext
            } else if model.type == .email {
                userModel.setEmail = model.enteredtext
            } else if model.type == .weight {
                userModel.setWeight = model.enteredtext
            } else if model.type == .height {
                userModel.setHeight = model.enteredtext
            } else if model.type == .activity {
                userModel.setActivity = model.enteredtext
            } else if model.type == .bmi {
                userModel.setBmi = model.enteredtext
            }
        }
        self.performSegue(withIdentifier: "profileSegue", sender: self)
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
                if let userVC = segue.destination as? UserViewController {
                    userVC.getModel = userModel
                }
            }
        }
    
    var editProfile = [Profile]()
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        notificationKeyboard()
        setModelProfile()
        viewProfilecam.layer.borderColor = UIColor.white.cgColor
        viewProfilecam.layer.cornerRadius = 18
    }
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.tableview.contentInset
           contentInset.bottom = keyboardFrame.size.height + 20
           tableview.contentInset = contentInset
    }
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            tableview.contentInset = contentInset
    }
    func setModelProfile() {
        let nameModel = Profile(strtitle: "Name", functionality: .name)
        let emailModel = Profile(strtitle: "Email address", functionality: .email)
        let phoneModel = Profile(strtitle: "Mobile number", functionality: .phoneNumber)
        let nationalityModel = Profile(strtitle: "Nationality", functionality: .nationality)
        let activityModel = Profile(strtitle: "Activity level", functionality: .activity)
        let heightModel = Profile(strtitle: "Height", functionality: .height)
        let weightModel = Profile(strtitle: "Weight", functionality: .weight)
        let bmiModel = Profile(strtitle: "BMI Value", functionality: .bmi)
        let updateModel = Profile(strtitle: "", functionality: .buttonupdate)
        editProfile = [nameModel, emailModel, phoneModel, nationalityModel, activityModel, heightModel, weightModel, bmiModel, updateModel]
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editProfile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProfile = editProfile[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellProfile.identifier, for: indexPath) as! ProfileTableViewCell
        cell.setModel(setProfileModel: cellProfile)
        cell.delegate = self
        return cell
    }
}
