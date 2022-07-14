//
//  UserViewController.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 31/05/22.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var getModel: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonActionarrow(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonActionEditProfile(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table.editProfile", for: indexPath) as! UserTableViewCell
        cell.nameSet(setModelName: getModel)
      
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "table.healthdata", for: indexPath) as! UserTableViewCell
        cell2.setModels(setUserModels: getModel)
        if indexPath.row == 0 {
            return cell
        }
        return cell2
    }
}

