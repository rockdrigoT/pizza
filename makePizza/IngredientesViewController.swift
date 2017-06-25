//
//  IngredientesViewController.swift
//  makePizza
//
//  Created by Rodrigo Torres González on 25/06/17.
//  Copyright © 2017 Rodrigo Torres González. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    var quesoType: String!
    var masaType: String!
    var pizzaSize: String!
    
    let ingredients = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoas"]
    var ingredientsSelected: [String] = []
    
    var lastSelectedIndexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        print("Queso type: \(quesoType)")
        self.title = quesoType
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
        
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextButton.isEnabled = true
        /*
         if((lastSelectedIndexPath) != nil) {
         
         let lastCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
         lastCell?.accessoryType = .None
         }
         
         let currentCell = tableView.cellForRowAtIndexPath(indexPath)
         currentCell?.accessoryType =  .Checkmark
         
         lastSelectedIndexPath = indexPath;
         */
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        let actualIngredient = (cell?.textLabel?.text)! as String
        //print("Actual: \(actualIngredient)")
        
        if ingredientsSelected.count > 0{
            if ingredientsSelected.count < 5{
                if ingredientsSelected.contains(actualIngredient){
                    //print("igual")
                    if ingredientsSelected.contains(actualIngredient){
                        let indexOf = ingredientsSelected.index(of: actualIngredient)
                        ingredientsSelected.remove(at: indexOf!)
                    }
                    cell?.accessoryType = .none
                }else{
                    ingredientsSelected.append(actualIngredient)
                }
            }else{
                //print("More than 5")
                if ingredientsSelected.contains(actualIngredient){
                    let indexOf = ingredientsSelected.index(of: actualIngredient)
                    ingredientsSelected.remove(at: indexOf!)
                }
                cell?.accessoryType = .none
            }
        }else{
            ingredientsSelected.append(actualIngredient)
        }
        //print("Tienes \(ingredientsSelected.count)")
        //print("Tus ingredientes \(ingredientsSelected)")
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: Actions
    
    @IBAction func nextAction(_ sender:AnyObject){
        self.performSegue(withIdentifier: "confirmationSegue", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "confirmationSegue"{
            let destinationVC = segue.destination as! ConfirmationViewController
            destinationVC.ingredients = ingredientsSelected
            destinationVC.masaType = self.masaType
            destinationVC.quesoType = self.quesoType
            destinationVC.pizzaSize = self.pizzaSize
        }
    }
}
