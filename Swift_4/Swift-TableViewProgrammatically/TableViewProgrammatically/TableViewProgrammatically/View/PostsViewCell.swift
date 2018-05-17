//
//  PostsViewCell.swift
//  TableViewProgrammatically
//
//  Created by Miguel Silva da Rocha Junior on 12/13/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let postImage: UIImageView = {
        let postImageView = UIImageView(image: #imageLiteral(resourceName: "brahma"))
        postImageView.frame = CGRect(x: 0, y: 0, width: 180, height: 160)
        postImageView.contentMode = .scaleToFill
        return postImageView
    }()
    
    let cardView: UIView = {
        let card = UIView()
        card.backgroundColor = UIColor.white
        card.layer.cornerRadius = 20
        
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOffset = CGSize(width: 4, height: 4)
        card.layer.shadowOpacity = 1.0
        card.layer.shadowRadius = 1.0
        card.layer.masksToBounds = true
        card.clipsToBounds = true
        
        return card
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "PRICE"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false // Use our manual constraints instead of the old one.
        return label
    }()
    
    func setCardDimensions(_ frame: CGRect){
        self.cardView.frame = frame
    }

    func setupViews() {
//        addSubview(nameLabel)
        addSubview(cardView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(postImage)
        
        cardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": postImage]))
        
        
//        cardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-130-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//        cardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))

    }

}


extension UIView{
    
    /* Please note that the  ... means that we are receiving an array as argument */
    func addConstraintsWihtFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]() //initializes a dictionary with String key and an UIIView value
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        } // at the end this for loop will poopulate the viewsDictionary so that it is used under the addConstraints function
        
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
