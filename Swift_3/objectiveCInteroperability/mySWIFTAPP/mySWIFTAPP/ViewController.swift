//
//  ViewController.swift
//  mySWIFTAPP
//
//  Created by Miguel Silva da Rocha Junior on 7/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let objcObject = CRC()
        objcObject.run()
        
        
        // Test function withou parameters!
        
        let dict = CRC.returnNSDict() as! Dictionary<String, Int>
        
        print("The dictionary returned by the function WITHOUT PARAMETER is: \(dict)")
        print("The encryted data returned by the functions: \(String(describing: dict["EncryptedData"]!)) \n\n")
        
        var dataArray: [Int8] = [-94,0x00, 0x01, 0x64]
        print("My command Data: \(dataArray)")
        

        let dict2 = CRC.returnNSDictReceiveChar(&dataArray) as! Dictionary<String, Int>
        
        print("The dictoinary received from the function CRC_secondCheck: \(dict2)")
        
    }
    @IBAction func loadSecondVC(_ sender: Any) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

