//
//  webViewController.swift
//  movieSearch
//
//  Created by labuser on 10/22/18.
//  Copyright © 2018 bb. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {

   
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:"https://www.themoviedb.org")!
        let myURLRequest = URLRequest(url: url)
        webView.load(myURLRequest)
        // Do any additional setup after loading the view.
    }
    
    
    func openPage(action: UIAlertAction!){
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url:url))
        
    }
    
    
    @IBAction func openOtherPages(_ sender: Any) {
        
        let ac = UIAlertController(title: "Open", message: nil, preferredStyle: .actionSheet)
         ac.addAction(UIAlertAction(title: "rottentomatoes.com", style: .default, handler: openPage))
         ac.addAction(UIAlertAction(title: "oscars.org", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "themoviedb.org", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title:"Cancel",style: .cancel, handler:nil))
        present(ac,animated: true,completion: nil)
    }
    
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
