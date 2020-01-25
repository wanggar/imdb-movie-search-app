//
//  TableViewController.swift
//  movieSearch
//
//  Created by labuser on 10/20/18.
//  Copyright © 2018 bb. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    


    @IBOutlet weak var theTableView: UITableView!
    
    @IBOutlet weak var editB: UIBarButtonItem!
    
    @IBAction func editButton(_ sender: Any) {
        theTableView.isEditing = !theTableView.isEditing
        switch theTableView.isEditing{
            case true:
                editB.title = "Done"
                //editB.tintColor = UIColor.black
                print("true")
            case false:
                editB.title = "Rearrange"
                 //editB.tintColor = UIColor.red
                print("false")
        }
        
    }
    
    
//    var favorite = ["a", "b", "c","d","e","f","g","h"]
    var names = UserDefaults.standard.array(forKey: "movieName") as! [String]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names = UserDefaults.standard.array(forKey: "movieName") as! [String]
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let myCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let myCell = tableView.dequeueReusableCell(withIdentifier: "theCell")!as UITableViewCell
        var names = UserDefaults.standard.array(forKey: "movieName") as! [String]
        //myCell.textLabel!.text = favorite[indexPath.row]
        myCell.textLabel!.text = names[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }

    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let thing = names[sourceIndexPath.row]
        names.remove(at: sourceIndexPath.row)
        names.insert(thing, at:destinationIndexPath.row)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.register(UITableViewCell.self, forCellReuseIdentifier: "theCell")
        theTableView.dataSource = self
        theTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)  {
         names = UserDefaults.standard.array(forKey: "movieName") as! [String]
        //names = UserDefaults.standard.array(forKey: "movieName") as! [String]
        theTableView.reloadData()
        print(names)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            //names = UserDefaults.standard.array(forKey: "movieName") as! [String]
            print(names)
            names.remove(at: indexPath.row)
            UserDefaults.standard.set(names, forKey: "movieName")
            UserDefaults.standard.synchronize()
            print(names)
            tableView.reloadData()
            
        }
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
