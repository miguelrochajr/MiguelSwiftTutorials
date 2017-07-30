//
//  ViewController.swift
//  youtube
//
//  Created by Brian Voong on 6/1/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
       var kanyeChanel = Channel()
        kanyeChanel.name = "Kanye West VEVO"
        kanyeChanel.profileImageName = "kanye_profile"
        
       var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChanel
        blankSpaceVideo.numberOfViews = 1237891237
        
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kanye Lamar"
        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
        badBloodVideo.channel = kanyeChanel
        badBloodVideo.numberOfViews = 781381323
        
        return [blankSpaceVideo, badBloodVideo]
    }()
    
//    func fetchVideos(){
//        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
//        URLSession.shared.dataTaskWithURL(
//            URLSession.sharedSession.dataTaskWithURL(url: NSURL, completionHandler: (NSData?, URLResponse?, NSError?)->Void)
//    }
    
    func fetchVideos(){
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) -> Void in
            
            if error != nil {
                print (error)
                return
            } else  {
                print ("success!!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchVideos()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        setupMenuBar()
        setupNavbarButtons()
        
        
    }
    
    func setupNavbarButtons(){
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [ moreButton, searchBarButtonItem]
        
  
    }
    
    func handleMore(){
        print("More button pressed!")
    }
    
    func handleSearch() {
        print("Search button pressed!")
    }
    
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 2*16)*(9/16)
        return CGSize(width: view.frame.width, height: (height+16+88))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}










