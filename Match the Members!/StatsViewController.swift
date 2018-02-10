//
//  StatsViewController.swift
//  Match the Members!
//
//  Created by Natasha Wong on 2/8/18.
//  Copyright © 2018 Natasha Wong. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var resumeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    
//    @objc func resumeAction() {
//        performSegue(withIdentifier: "resumeMatching", sender: self)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
