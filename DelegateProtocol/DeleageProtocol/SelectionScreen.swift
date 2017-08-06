//
//  SelectionScreen.swift
//  DeleageProtocol
//
//  Created by Miguel Silva da Rocha Junior on 8/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//


import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SelectionScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var intern: BaseScreen?
    var selectionDelegate: SideSelectionDelegate!
    
    @IBAction func imperialButtonChosen(_ sender: UIButton) {
        intern?.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: UIColor.red)        //        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: UIColor.red)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rebelButtonChosen(_ sender: UIButton) {
        intern?.didTapChoice(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: UIColor.cyan)
        //        selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: UIColor.cyan)
        dismiss(animated: true, completion: nil)
    }
    
}
