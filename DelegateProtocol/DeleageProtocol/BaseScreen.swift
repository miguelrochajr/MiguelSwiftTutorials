//
//  ViewController.swift
//  DeleageProtocol
//
//  Created by Miguel Silva da Rocha Junior on 8/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class BaseScreen: UIViewController {

    @IBOutlet weak var starWarsLogo: UIImageView!
    @IBOutlet weak var chooseSideButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        chooseSideButton.layer.cornerRadius = chooseSideButton.frame.size.height/2
        
    }
    
    @IBAction func chooseSideTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        selectionVC.selectionDelegate = self 
        present(selectionVC, animated: true, completion: nil)
    }
    
    
}

extension BaseScreen: SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        starWarsLogo.image = image
        nameLabel.text = name
        view.backgroundColor  = color
    }
}
