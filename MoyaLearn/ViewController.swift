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
    }

    @IBAction func onTapPrimeRequestBtn(_ sender: UIButton) {
        print("Prime Request")
        PrimeRequester.shared.request(with: "http://localhost:8888/")
    }
    
    @IBAction func onTapAlamofireRequestBtn(_ sender: UIButton) {
        print("Alamofire Request")
    }
    
    @IBAction func onTapMoyaButton(_ sender: UIButton) {
        print("Moya Request")
    }
    
}

