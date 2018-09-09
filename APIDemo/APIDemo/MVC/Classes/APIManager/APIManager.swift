//
//  APIManager.swift
//  APIDemo
//
//  Created by brockk on 8/25/18.
//  Copyright © 2018 yoyo. All rights reserved.
//

import Foundation

typealias CompletionBlock = ([[String: AnyObject]], Error?) -> Void

class APIManager: NSObject {
    
    static let shared = APIManager()


    
    
    func callAPI(flag: Int, completion: @escaping CompletionBlock) {
        let url: URL = URL(string: baseURL)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error:\(error?.localizedDescription ?? "no error")")
                completion([["result": "Fail" as AnyObject]], error)
            } else {
                guard let dataResponse = data else {
                    print("error in response")
                    return
                }
                do {
                    guard let jsonDict = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [[String: AnyObject]] else {
                        print("error in response")
                        return
                    }
                    print("jsonDict:\(jsonDict)")
                    completion(jsonDict, nil)
                } catch {
                    print("\(error.localizedDescription)")
                    completion([["result": "Fail" as AnyObject]], error)
                }
            }
        }
        
        task.resume()
    }
    
    
    func callAPIUsinCodable(flag: Int, completion: @escaping CompletionBlock) {
        let url: URL = URL(string: baseURL)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "Get"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("error:\(error?.localizedDescription ?? "no error")")
                completion([["result": "Fail" as AnyObject]], error)
            } else {
                guard let dataResponse = data else {
                    print("error in response")
                    return
                }
                do {
                    guard let jsonDict = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [[String: AnyObject]] else {
                        print("error in response")
                        return
                    }
                    
                    var arrUser = [User]()
                    for dict in jsonDict {
                        let user = User(dict: dict)
                        arrUser.append(user)
                    }
                    let user = arrUser[0]
                    let userCodable = UserCodable(userId: user.userId, id: user.id, title: user.title, completed: user.isCompleted)
                    let encode = JSONEncoder()
                    let dataCodable = try encode.encode(userCodable)
                    
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UserCodable.self, from: dataCodable)
                    
                    
                    print("response:\(response.userId)")
                    completion(jsonDict, nil)
                } catch {
                    print("\(error.localizedDescription)")
                    completion([["result": "Fail" as AnyObject]], error)
                }
            }
        }
        task.resume()
    }
    
    
    func callAPI_POST(params : Dictionary<String, String>, completion: @escaping CompletionBlock)
    {
        let url: URL = URL(string: baseURL)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "Post"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return
        }
        urlRequest.httpBody = httpBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("error:\(error?.localizedDescription ?? "no error")")
                completion([["result": "Fail" as AnyObject]], error)
            } else {
                guard let dataResponse = data else {
                    print("error in response")
                    return
                }
                do {
                    guard let jsonDict = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [[String: AnyObject]] else {
                        print("error in response")
                        return
                    }
                    
                    //                    var arrUser = [User]()
                    //                    for dict in jsonDict {
                    //                        let user = User(dict: dict)
                    //                        arrUser.append(user)
                    //                    }
                    //                    let user = arrUser[0]
                    //                    let userCodable = UserCodable(userId: user.userId, id: user.id, title: user.title, completed: user.isCompleted)
                    //                    let encode = JSONEncoder()
                    //                    let dataCodable = try encode.encode(userCodable)
                    //
                    //                    let decoder = JSONDecoder()
                    //                    let response = try decoder.decode(UserCodable.self, from: dataCodable)
                    //
                    //
                    //                    print("response:\(response.userId)")
                    completion(jsonDict, nil)
                } catch {
                    print("\(error.localizedDescription)")
                    completion([["result": "Fail" as AnyObject]], error)
                }
            }
        }
        task.resume()
    }
    
}


