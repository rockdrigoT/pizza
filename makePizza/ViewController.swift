//
//  ViewController.swift
//  makePizza
//
//  Created by Rodrigo Torres González on 25/06/17.
//  Copyright © 2017 Rodrigo Torres González. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    let pizzaSize = ["Personal", "Chica", "Mediana", "Grande", "Extragande"]
    var lastSelectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
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
        
        cell.textLabel?.text = pizzaSize[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaSize.count
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
        self.performSegue(withIdentifier: "chooseMasa", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseMasa"{
            let destinationVC = segue.destination as! MasaViewController
            destinationVC.pizzaSize = pizzaSize[lastSelectedIndexPath.row]
        }
        
    }
}
