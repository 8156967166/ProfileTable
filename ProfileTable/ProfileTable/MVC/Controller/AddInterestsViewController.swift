//
//  AddInterestsViewController.swift
//  ProfileTable
//
//  Created by Bimal@AppStation on 01/06/22.
//

import UIKit

class AddInterestsViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var buttonSubmit: UIButton!
//    var getintestModel: AddInterests!
    var selectedImageIndex: Int?
    var addInterestsArray = [AddInterests]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setModelAddInterests()
        setStylesInterests()
    }
    func setModelAddInterests() {
        let cyclingModel = AddInterests(strInterests: "Cycling", strtype: .cycling, image: "cycle")
        let walkModel = AddInterests(strInterests: "Walk", strtype: .run, image: "walkrunimg")
        let runModel = AddInterests(strInterests: "Run", strtype: .walk, image: "walkrunimg")
        addInterestsArray = [cyclingModel, walkModel, runModel]
//        DispatchQueue.main.async {
//            self.tableview.reloadData()
//        }
    }
    func setStylesInterests() {
        buttonSubmit.layer.borderWidth = 1
        buttonSubmit.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        buttonSubmit.layer.cornerRadius = 6
    }
}
extension AddInterestsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addInterestsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = addInterestsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "table.addInterests", for: indexPath) as! AddInterestsTableViewCell
        cell.setInterestsModel(setAddInterests: cellModel)
        if cellModel.isSelect == true {
            cell.imageViewSelected?.isHidden = false
        } else {
            cell.imageViewSelected?.isHidden = true
        }
        if cellModel.isSelected == true {
            cell.imageViewPerson?.isHidden = false
        } else {
            cell.imageViewPerson?.isHidden = true
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cellModel = addInterestsArray[indexPath.row]
        if cellModel.isSelect == true {
            cellModel.isSelect = false
        } else {
            cellModel.isSelect = true
        }
        
        for model in addInterestsArray {
            model.isSelected = false
        }
        cellModel.isSelected = true
        
        tableView.reloadData()
    }
    
    
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = addInterestsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "table.addInterests", for: indexPath) as! AddInterestsTableViewCell
        cell.setInterestsModel(setAddInterests: cellModel)
        if cellModel.isSelect == true {
            cell.imageViewSelected?.isHidden = false
        } else {
            cell.imageViewSelected?.isHidden = true
        }
        if cellModel.isSelected == true {
                    cell.imageViewPerson?.isHidden = false
            for model in addInterestsArray {
                model.isSelected = false
            }
//                    cellModel.isSelected = false
            }
            else if cellModel.isSelected == false {
                cell.imageViewPerson?.isHidden = true
            }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cellModel = addInterestsArray[indexPath.row]
        if cellModel.isSelect == true {
            cellModel.isSelect = false
        } else {
            cellModel.isSelect = true
        }
        if cellModel.isSelected == true {
            cellModel.isSelected = false
        }
        else {
            cellModel.isSelected = true
        }
//        selectedImageIndex = indexPath.row
        tableView.reloadData()
    }
     */
}


//if selectedImageIndex == indexPath.row {
//            }
//             else {
//                 cell.imageViewPerson?.isHidden = true
//             }



//guard let selectedAnswer = getQuizResultModel[indexPath.row].selectedAnswer else {  }
//if getQuizResultModel[indexPath.row].selectedAnswer == nil {
//    cell.labelSelectedAnswers.text = ""
//}else {
//
//    print(" *** ===> \(getQuizResultModel[indexPath.row].selectedAnswer ?? -1)")
//}
//if let selectedAnswer = getQuizResultModel[indexPath.row].selectedAnswer {
//    cell.labelSelectedAnswers.text = "\(getQuizResultModel[indexPath.row].selectedAnswer ?? -1)"
//}
