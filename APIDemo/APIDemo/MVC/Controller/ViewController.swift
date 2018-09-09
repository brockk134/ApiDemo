//
//  ViewController.swift
//  APIDemo
//
//  Created by brockk on 8/25/18.
//  Copyright © 2018 yoyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        APIManager1.shared.makePostCall()
        
        
        
        
//        APIManager1.shared.callAPI_Post(inputPara: 1) { (responseDict, error) in
//            if (error != nil) {
//                let alert = UIAlertController(title: "Success", message: "Got Success", preferredStyle: .alert)
//                self.present(alert, animated: true, completion: nil)
//            }
//            else
//            {
//                let alert = UIAlertController(title: "Failure", message: "No Suceess", preferredStyle: .alert)
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
        
        
//        APIManager1.shared.callAPI_POST(params: <#T##Dictionary<String, String>#>) { (responseDoct, error) in
//            
//        }
        
        
//        APIManager.shared.callAPIUsinCodable(flag: 1) { (response, error) in
//            if error != nil {
//
//            } else {
//                sharedUserObj = User(dict: response[0])
//
//            }
//        }
//
        
//        APIManager.shared.callAPI(flag: 1) { (response, error) in
//            if error != nil {
//                
//            }
//            else
//            {
//                print(response)
//                var arrUser = [User]()
//                for dict in response {
//                    let user = User(dict: dict)
//                    arrUser.append(user)
//                }
//                
//                arrUser = response.compactMap { (dict) in
//                        return User(dict: dict)
//                }
//                print("\(arrUser.count)")
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

