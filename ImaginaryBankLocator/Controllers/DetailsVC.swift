//
//  DetailsVC.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/16/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import UIKit

class DetailsVC: BaseVC, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblBcg: UITableView!
    @IBOutlet weak var popupHeightConstr: NSLayoutConstraint!
    @IBOutlet weak var topAddressConstraint: NSLayoutConstraint!
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var contactImg: UIImageView!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var workHoursView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var websiteView: UIView!
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var tblWorkHours: UITableView!
    @IBOutlet weak var popUpWorkHours: UIView!
    
    let gradientLayer = CAGradientLayer()
    
    var currentATMorBranch: DataD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //popup
        popUpWorkHours.isHidden = true
        popUpWorkHours.layer.shadowColor = UIColor.black.cgColor
        popUpWorkHours.layer.shadowOpacity = 0.6
        popUpWorkHours.layer.shadowOffset = CGSize.zero
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        //setup data from json
        if(currentATMorBranch?.type == "branch"){
            popupHeightConstr.constant = CGFloat(((currentATMorBranch?.working_hours?.count)!)*72 + 120)
            pinImage.image = UIImage(named: "ic_pin_branch")
            let tapWorkHours = UITapGestureRecognizer(target: self, action: #selector(DetailsVC.tapWorkHours))
            workHoursView.addGestureRecognizer(tapWorkHours)
            workHoursView.isUserInteractionEnabled =  true
            lblContactNumber.text = currentATMorBranch?.phone
            if(checkIfOpen())
            {
                lblStatus.text = "Opened"
            }
            else{
                lblStatus.text = "Closed"
            }
        }
        else{
            pinImage.image = UIImage(named: "ic_pin_atm")
            contactView.removeFromSuperview()
            workHoursView.removeFromSuperview()
        }
        name.text = currentATMorBranch?.name
        address.text = currentATMorBranch?.address
        lblAddress.text = currentATMorBranch?.address
        lblEmail.text = currentATMorBranch?.email
        lblWebsite.text = currentATMorBranch?.website
      
        setGradientBackground()

    }

    @objc func tapWorkHours(recognizer: UITapGestureRecognizer) {
      popUpWorkHours.isHidden = false
      popUpWorkHours.alpha = 0.9
        
    }
    func checkIfOpen()->Bool{
       // var status = false
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let day = formatter.string(from: date)
        for i in 0..<(currentATMorBranch?.working_hours?.count)!{
            if(day == "Monday" && currentATMorBranch?.working_hours![i].day == 0){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
 
                if(now >= from && now <= to){
                    return true
                }
                
                
                
            }
            else if(day == "Tuesday" && currentATMorBranch?.working_hours![i].day == 1){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
                
            }
            else if(day == "Wednesday" && currentATMorBranch?.working_hours![i].day == 2){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
            }
            else if(day == "Thursday" && currentATMorBranch?.working_hours![i].day == 3){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
            }
            else if(day == "Friday" && currentATMorBranch?.working_hours![i].day == 4){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
            }
            else if(day == "Saturday" && currentATMorBranch?.working_hours![i].day == 5){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
            }
            else if(day == "Sunday" && currentATMorBranch?.working_hours![i].day == 6){
                let now = Date()
                let calendar = Calendar.current
                let from = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].start_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].start_minutes!)!,
                    second: 00,
                    of: now)!
                
                let to = calendar.date(
                    bySettingHour: (currentATMorBranch?.working_hours![i].end_hours!)!,
                    minute: (currentATMorBranch?.working_hours![i].end_minutes!)!,
                    second: 00,
                    of: now)!
                
                if(now >= from && now <= to){
                    return true
                }
            }
            
        }
       
        return false
    }
    @IBAction func btnClosePopUp(_ sender: Any) {
        popUpWorkHours.isHidden = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentATMorBranch?.type == "branch"{
            return (currentATMorBranch?.working_hours?.count)!
        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "popUpWorkHoursTVC",for: indexPath as IndexPath) as? PopUpWorkHoursTVC
        let intDay = currentATMorBranch?.working_hours![indexPath.row].day
        let startH = currentATMorBranch?.working_hours![indexPath.row].start_hours
        let startM = currentATMorBranch?.working_hours![indexPath.row].start_minutes
        let endH = currentATMorBranch?.working_hours![indexPath.row].end_hours
        let endM = currentATMorBranch?.working_hours![indexPath.row].end_minutes
        
       // set gradient
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.0 , 0.1, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        let colorTop =  UIColor(red: 10.0/255.0, green: 159.0/255.0, blue: 159.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 42.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: cell!.bcgView.frame.size.width, height: cell!.bcgView.frame.size.height)

//
//        cell!.bcgView.layer.insertSublayer(gradientLayer, at: 0)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
    
        cell?.day.text = getDayString(dayInt: intDay!)
        cell?.hours.text = "\(String(format: "%02d", startH!)):\(String(format: "%02d", startM!))-\(String(format: "%02d", endH!)):\(String(format: "%02d", endM!))"

        return cell!
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//         //set gradient
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.locations = [0.0 , 0.1, 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//
//        let colorTop =  UIColor(red: 10.0/255.0, green: 159.0/255.0, blue: 159.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 42.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: cell.frame.size.width, height: cell.frame.size.height)
//
//
//        cell.layer.insertSublayer(gradientLayer, at: 0)
//
//    }
//
    func getDayString(dayInt: Int)-> String{
        switch dayInt {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saterday"
        case 6:
            return "Sunday"
        default:
           return ""
        }
    }
    
    
    



}
