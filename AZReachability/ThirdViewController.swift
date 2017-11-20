//
//  ThirdViewController.swift
//  AZReachability
//
//  Created by Muhammad Afroz on 8/10/17.
//  Copyright © 2017 AfrozZaheer. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Third Controller"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismiss(_:)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @objc func dismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
