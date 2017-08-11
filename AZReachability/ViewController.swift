//
//  ViewController.swift
//  AZReachability
//
//  Created by Muhammad Afroz on 8/2/17.
//  Copyright © 2017 AfrozZaheer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentController(_ sender: UIBarButtonItem) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")
        let nav = UINavigationController(rootViewController: controller!)
        self.present(nav, animated: true, completion: nil)
    }
}

