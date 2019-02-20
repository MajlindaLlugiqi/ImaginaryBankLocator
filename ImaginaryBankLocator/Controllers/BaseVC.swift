//
//  BaseVC.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/16/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var response = DataResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //get json data from IBL_data.json
        do {
            if let file = Bundle.main.path(forResource: "IBL_data", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: file), options: .mappedIfSafe)
                response = try JSONDecoder().decode(DataResponse.self, from: data)
                print(response)
                
            }
        } catch {
            print(error.localizedDescription)
        }
        //set background gradient of navigation bar
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor(red: 10.0/255.0, green: 159.0/255.0, blue: 159.0/255.0, alpha: 1.0).cgColor,
            UIColor(red: 42.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
            ])
        //seting gradient for background
        setGradientBackground()
        

    }
    //navigate between two viewcontrollers
    func navigateToView(name: String){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: name)
        newViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //self.present(newViewController, animated: true, completion: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = newViewController
        self.dismiss(animated: false, completion: nil)
    }
    
    //for background view gradient
    func setGradientBackground() {
        let colorTop =  UIColor(red: 10.0/255.0, green: 159.0/255.0, blue: 159.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 42.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    

}
