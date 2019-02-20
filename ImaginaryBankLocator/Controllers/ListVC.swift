//
//  ListVC.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/16/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import UIKit

class ListVC: BaseVC, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var btnList: RoundedButton!
    @IBOutlet weak var btnLocation: RoundedButton!
    @IBOutlet weak var btnMyLocation: RoundedButton!
    @IBOutlet weak var tblListofATMsAndBranches: UITableView!
    @IBOutlet weak var searchtxt: UITextField!
    var currentList:[DataD]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchtxt()
       
        currentList = response.data
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Mobile Assignment"
        searchtxt.delegate = self
        
        //gradient color for buttons
        btnLocation.setGradientBackground(colorOne: UIColor(red: 177.0/255.0, green: 222.0/255.0, blue: 98.0/255.0, alpha: 1.0) , colorTwo: UIColor(red: 95.0/255.0, green: 152.0/255.0, blue: 57.0/255.0, alpha: 1.0))
        btnMyLocation.setGradientBackground(colorOne: UIColor(red: 177.0/255.0, green: 222.0/255.0, blue: 98.0/255.0, alpha: 1.0) , colorTwo: UIColor(red: 95.0/255.0, green: 152.0/255.0, blue: 57.0/255.0, alpha: 1.0))
        btnList.setGradientBackground(colorOne: UIColor(red: 43.0/255.0, green: 101.0/255.0, blue: 102.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 143.0/255.0, green: 149.0/255.0, blue: 149.0/255.0, alpha: 1.0))
        
    }
    //on search textview tap
    func setUpSearchtxt(){
        searchtxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    //on search textview change
    @objc func textFieldDidChange(_ textField: UITextField) {
        searchBar()
       tblListofATMsAndBranches.reloadData()
        
    }
    
    //navigate to mapVCN
    @IBAction func btnMyLocation(_ sender: Any) {
        self.navigateToView(name: "mapVCN")
    }
    
    //searchbar funcionality
    func searchBar() {
        guard !(searchtxt.text?.isEmpty)! else {
            currentList = response.data

            tblListofATMsAndBranches.reloadData()
            return
            
        }
        currentList = response.data!.filter({( list : DataD) -> Bool in
            return list.name!.lowercased().contains(searchtxt.text!.lowercased())
        })
        
        tblListofATMsAndBranches.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (currentList?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       

        let cell = tableView.dequeueReusableCell(withIdentifier: "listofBranchesATMsTVC",for: indexPath as IndexPath) as? ListofBranchesATMsTVC
        cell?.lblName.text = currentList?[indexPath.row].name
        cell?.lblLocation.text = currentList?[indexPath.row].address
        if(response.data?[indexPath.row].type == "branch"){
            cell?.img.image = UIImage(named: "ic_branch.png")
        }
        else{
            cell?.img.image = UIImage(named: "ic_atm.png")
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tappedListMember = currentList![indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mapVC") as? MapVC
        vc!.currentBank = tappedListMember
        self.navigationController?.pushViewController(vc!, animated: true)
        
        //go to details
//        let tappedListMember = currentList![indexPath.row]
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailsVC") as? DetailsVC
//        vc!.currentATMorBranch = tappedListMember
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
