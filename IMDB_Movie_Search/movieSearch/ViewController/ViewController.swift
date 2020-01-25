//
//  ViewController.swift
//  movieSearch
//
//  Created by labuser on 10/19/18.
//  Copyright © 2018 bb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    
//    var favorites = ["a","b","c"]
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 7
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let thetableCell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        thetableCell.textLabel?.text = favorites[indexPath.row]
//        return thetableCell
//    }
    
    
    
    
    
    var theAPIData:APIResults?
    var targetSearch = "superman"    
    var theMovieData:[Movie] = []
    var theImageCache:[UIImage] = []

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var theSearchBar: UISearchBar!
    var isWriting = false
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    
//
//    func setUpCollectionView(){
//        theCollectionView.dataSource = self
//        theCollectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "cell")
//    }
//
    
    
    
    //network stuff
    func fetchDataforCollectionView(){
        print("search")
        //
//        spinner.isHidden = false
//        spinner.startAnimating()
        let url = URL(string:"https://api.themoviedb.org/3/search/movie?api_key=5e8799d7872405f076bfcbe3d569b72d&language=en-////US&query=\(targetSearch)&page=1&include_adult=false")
        
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url!)
            self.theAPIData = try! JSONDecoder().decode(APIResults.self,from: data)
            self.theMovieData = (self.theAPIData?.results)!
            self.cacheImages()
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.theCollectionView.reloadData()
            }
        }
      
        
   
        
//        spinner.isHidden = true
//        spinner.stopAnimating()
        
    }
    
   
    func cacheImages(){
        theImageCache.removeAll()
        for item in theMovieData{
            
          
            //let url = URL(string: item.poster_path!)
            if let postah = item.poster_path{
                let target = "https://image.tmdb.org/t/p/w185\(postah)"
                let url = URL(string: target)
                let data = try? Data(contentsOf: url!)
                if let image = UIImage(data: data!){
                    theImageCache.append(image)
                } else {
                    let image =  #imageLiteral(resourceName: "default2")
                    theImageCache.append(image)
                }
                   
    
            } else {
                let image =  #imageLiteral(resourceName: "default2")
                theImageCache.append(image)
            }

    }
    }
    
    //the end of network stuff
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theMovieData.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! theCell
        
        cell.image?.image = theImageCache[indexPath.row]
        cell.movieLabel.textColor = UIColor.white
        cell.movieLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        cell.movieLabel.text = theMovieData[indexPath.row].title
        
        
        
//        if(indexPath.section % 2 == 1 ){
//            cell.backgroundColor = UIColor.blue
//        } else{
//            cell.backgroundColor = UIColor.red
//        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //push things to the cell
        let detailedVC = DetailedViewController()
        detailedVC.name = theMovieData[indexPath.row].title
        detailedVC.image = theImageCache[indexPath.row]
        detailedVC.releaseYear = theMovieData[indexPath.row].release_date
        detailedVC.score = String(theMovieData[indexPath.row].vote_average)
        detailedVC.voteCount = String(theMovieData[indexPath.row].vote_count)
        detailedVC.title = theMovieData[indexPath.row].title
        navigationController?.pushViewController(detailedVC, animated: true)

    }
    
   
    
    
  
    
    //........................ END OF COLLECTION VIEW SECTION ......................//
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theSearchBar.placeholder = "                       Enter a Movie"
        
        theSearchBar.delegate = self
        
        theCollectionView.delegate = self
        theCollectionView.dataSource = self
        
     
        
        theCollectionView.dataSource = self
        spinner.isHidden = true
        

        fetchDataforCollectionView()

        storedata()
        
        
        print("reading to load...")
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        spinner.startAnimating()
        
        
        targetSearch = beautify(result: theSearchBar.text!)
        //networkstuff
      

        fetchDataforCollectionView()//network, should be in the background
        
        
        

    }
    
    
    
    

    
    func storedata(){
        
        let defaultMachine = UserDefaults.standard
        let nullcase: [String] = []
        let nameFavoriteList = defaultMachine.array(forKey: "movieName")
        if (nameFavoriteList == nil){
            defaultMachine.set(nullcase, forKey:"movieName")
        }
        
    }
    
//    
    func beautify(result: String) -> String{
        let newString = result.replacingOccurrences(of: " ", with: "+")
        return newString
        
    }
   

}

