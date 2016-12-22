//
//  LicenseViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit
import JSSAlertView

class LicenseViewController: UIViewController {

    @IBOutlet weak var btn18Years: UIButton!
    @IBOutlet weak var btnAgreeTerms: UIButton!
    
    var isAgeConfirmed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        btn18Years.tag = 0
        btn18Years.setImage(UIImage(named: "ic_uncheck")!, forState: UIControlState.Normal)
        
        btnAgreeTerms.tag = 0
        btnAgreeTerms.setImage(UIImage(named: "ic_uncheck")!, forState: UIControlState.Normal)
    }

    @IBAction func onCheckboxTapped(sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setImage(UIImage(named: "ic_check")!, forState: UIControlState.Normal)
        } else {
            sender.tag = 0
            sender.setImage(UIImage(named: "ic_uncheck")!, forState: UIControlState.Normal)
        }
    }
    
    @IBAction func continueButton(sender: AnyObject)
    {
        if btn18Years.tag == 0 {
            //if isAgeConfirmed == false {
                //isAgeConfirmed = true
                //"You must be older than 18 years to use this application. \nIf you are? Then select checkbox to continue. Thank you!"
                JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Call", buttonAction: {
                    print("Call..")
                }, cancelButtonText: "Okay", delay: nil)
                //JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Call", cancelButtonText: "Okay", delay: nil)
                //JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Okay")
                return
//            } else {
//                NSUserDefaults.standardUserDefaults().setObject("0", forKey: "isOlderThen18Years")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
        } else {
            NSUserDefaults.standardUserDefaults().setObject("1", forKey: "isOlderThen18Years")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        if btnAgreeTerms.tag == 0 {
            JSSAlertView().info(self, title: "Message", text: "You must be agree to our terms and conditions. Thank you!", buttonText: "Okay")
            return
        }
        
        //Save Flag value
        NSUserDefaults.standardUserDefaults().setObject("1", forKey: "isEligibleToUseOurApp")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("LandingViewController") as! LandingViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
}
