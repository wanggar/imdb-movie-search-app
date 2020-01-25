//
//  DetailedViewController.swift
//  movieSearch
//
//  Created by labuser on 10/20/18.
//  Copyright © 2018 bb. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    //instancevariales
    var image: UIImage!
    var name: String!
    var releaseYear: String!
    var score: String!
    var voteCount: String!
    let tableVC = TableViewController()
    var favoriteMovie:[String] = []
    var isOn = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = UIColor.white
//        
//        //title
//        let theTitleTextFrame = CGRect(x:0,y:80, width:view.frame.width,height:30)
//        let textView0 = UILabel(frame: theTitleTextFrame)
//        textView0.text = "Title: " + name
//        textView0.textAlignment = .center
        
        
        
        
        //image
        let theImageFrame = CGRect(x:view.frame.midX - image.size.width/2,y:120,width:image.size.width,height:image.size.height)
        let imageView = UIImageView(frame:theImageFrame)
        imageView.image = image
        
        //release year
        let theReleaseTextFrame = CGRect(x:0,y:image.size.height + 140, width:view.frame.width,height:30)
        let textView1 = UILabel(frame: theReleaseTextFrame)
        textView1.text = "Release Date: " + releaseYear
        textView1.textAlignment = .center
        
        //score
        let theScoreTextFrame = CGRect(x:0,y:image.size.height + 180, width:view.frame.width,height:30)
        let textView2 = UILabel(frame: theScoreTextFrame)
        textView2.text = "Score: " + score
        textView2.textAlignment = .center
        
        //rating
        let theRatingTextFrame = CGRect(x:0,y:image.size.height + 220, width:view.frame.width,height:30)
        let textView3 = UILabel(frame: theRatingTextFrame)
        textView3.text = "Vote Count: " + voteCount
        textView3.textAlignment = .center
        
        //addFavorite button
        let theButtonFrame = CGRect(x:view.frame.midX - image.size.width/2+15,y:image.size.height + 260, width:view.frame.width/2.5,height:30)
        let button = UIButton(frame: theButtonFrame)
        button.backgroundColor = UIColor.init(red: 0.2, green: 0.24, blue: 0.42, alpha: 0.43)
        button.setTitle("Add to Favorite", for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        view.addSubview(imageView)
        //view.addSubview(textView0)
        view.addSubview(textView1)
        view.addSubview(textView2)
        view.addSubview(textView3)
        
//        if(isOn==false){
//            button.setTitle("Add to Favorite", for: .normal)
//        }
//        if(isOn==true)
//        {
//            button.setTitle("Added", for: .normal)
//        }
        view.addSubview(button)
        
    
        
        // Do any additional setup after loading the view.
    }
    
    
   @objc func addToFavorite(sender: UIButton!){
        print("let's go")
    
    
        let myDefaultList = UserDefaults.standard
        var names: [String] = myDefaultList.array(forKey: "movieName") as![String]
        names.append(name)
        myDefaultList.set(names,forKey:"movieName")
        
        
    
    
    }
//
//    @objc func buttonPressed(sender: UIButton!){
//
//        isOn = !isOn
//        print("yeah")
//        print(isOn)
//
//    }
////
//    func activateButton(bool: Bool){
//        isOn = bool
//        let theButtonFrame = CGRect(x:view.frame.midX - image.size.width/2+15,y:image.size.height + 260, width:view.frame.width/2.5,height:30)
//        let button = UIButton(frame: theButtonFrame)
//        button.backgroundColor = UIColor.init(red: 0.2, green: 0.24, blue: 0.42, alpha: 0.43)
//        button.layer.cornerRadius = 6
//        let logo = bool ? "Added" : "Added to Favorite"
//
//        button.setTitle(logo, for: .normal)
//        view.addSubview(button)
//
////        if(bool==false){
////
////            button.setTitle("Add to Favorite", for: .normal)
////
////            view.addSubview(button)
////
////
////        }else{
////
////            button.setTitle("Added", for: .normal)
////
////            view.addSubview(button)
////
////        }
    //}
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
