//
//  ViewController.swift
//  letsquizz
//
//  Created by Peitong Shi on 4/20/18.
//  Copyright © 2018 letsquizz. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "loginView"
        , sender: self)
    
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
    }
    
    
}

