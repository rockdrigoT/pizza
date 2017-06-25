//
//  QuesoViewController.swift
//  makePizza
//
//  Created by Rodrigo Torres González on 25/06/17.
//  Copyright © 2017 Rodrigo Torres González. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var masaType: String!
    var pizzaSize: String!
    
    let quesoType = ["Mozarela", "Cheddar", "Parmesano", "Sin Queso"]
    
    var lastSelectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        print("Masa type: \(masaType)")
        self.title = masaType
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
        
        cell.textLabel?.text = quesoType[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quesoType.count
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
        self.performSegue(withIdentifier: "chooseIngredientes", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "chooseIngredientes"{
            let destinationVC = segue.destination as! IngredientesViewController
            destinationVC.quesoType = quesoType[lastSelectedIndexPath.row]
            destinationVC.pizzaSize = self.pizzaSize
            destinationVC.masaType = self.masaType
            
        }
    }
    
    
}
