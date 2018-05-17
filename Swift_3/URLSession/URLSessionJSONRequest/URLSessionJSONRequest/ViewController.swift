//
//  ViewController.swift
//  URLSessionJSONRequest
//
//  Created by Gabriella França on 30/07/17.
//  Copyright © 2017 Miguel Rocha Jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onGetTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print (data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print (error)
                }
            }
        }.resume()
    }
    
    @IBAction func onPostTapped(_ sender: Any) {
        
        let param = ["username": "@miguelrochajr", "tweet": "Hello World!"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return}
        //to use the POST method you must to use the request 
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print (response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print (json)
                } catch {
                    print (error)
                }
            }
        }.resume()
        
        
    }
    



}

