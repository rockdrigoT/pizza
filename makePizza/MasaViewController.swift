//
//  MasaViewController.swift
//  makePizza
//
//  Created by Rodrigo Torres González on 25/06/17.
//  Copyright © 2017 Rodrigo Torres González. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var pizzaSize: String!
    
    let masaType = ["Delgada", "Crujiente", "Gruesa", "Queso en orilla"]
    var lastSelectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        print("Pizza size \(pizzaSize)")
        self.title = pizzaSize
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Table view delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = masaType[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masaType.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        if((lastSelectedIndexPath) != nil) {
            
            let lastCell = tableView.cellForRow(at: lastSelectedIndexPath)
            lastCell?.accessoryType = .none
        }
        
        let currentCell = tableView.cellForRow(at: indexPath)
        currentCell?.accessoryType =  .checkmark
        
        lastSelectedIndexPath = indexPath;
        
        
        
    }
    
    // MARK: Actions
    
    @IBAction func nextAction(_ sender:AnyObject){
        self.performSegue(withIdentifier: "chooseQueso", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseQueso"{
            let destinationVC = segue.destination as! QuesoViewController
            destinationVC.masaType = masaType[lastSelectedIndexPath.row]
            destinationVC.pizzaSize = self.pizzaSize
        }
    }
    
    
}
