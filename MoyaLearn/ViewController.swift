//
//  ViewController.swift
//  MoyaLearn
//
//  Created by whaley on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("View did load")
        PrimeRequester.shared.request(with: "https://www.google.com/")
    }


}

