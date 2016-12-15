//
//  LicenseViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func continueButton(sender: AnyObject) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("LandingViewController") as! LandingViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
}
