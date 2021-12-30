//
//  ViewController.swift
//  MoyaLearn
//
//  Created by whaley on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let urlString = "http://localhost:8888/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://localhost:8888/")
        if let url = url {
            print(url.absoluteString)
        } else {
            print("nil")
        }
        
        let subUrl = URL(string: "dev", relativeTo: url)
        if let subUrl = subUrl {
            print(subUrl.absoluteString)
        } else {
            print("nil")
        }
    }

    @IBAction func onTapPrimeRequestBtn(_ sender: UIButton) {
        print("Prime Request")
        YRequester.shared.primeRequest(with: urlString) { model in            
            print("message: \(model.data)")
        }
    }
    
    @IBAction func onTapAlamofireRequestBtn(_ sender: UIButton) {
        print("Alamofire Request")
        YRequester.shared.alamofireRequest(with: urlString) { model in
            print("message: \(model.data)")
        }
    }
    
    @IBAction func onTapMoyaButton(_ sender: UIButton) {
        print("Moya Request")
    }
    
}

