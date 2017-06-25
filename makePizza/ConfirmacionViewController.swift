//
//  ConfirmacionViewController.swift
//  makePizza
//
//  Created by Rodrigo Torres González on 25/06/17.
//  Copyright © 2017 Rodrigo Torres González. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController{
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var masaTypeLabel: UILabel!
    @IBOutlet weak var quesoTypeLabel: UILabel!
    @IBOutlet weak var ingredientesLabel: UITextView!
    
    var ingredients: [String] = []
    var quesoType: String!
    var masaType: String!
    var pizzaSize: String!
    
    var lastSelectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Confirmar orden..."
        
        updateOrderLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: General funtions
    
    func updateOrderLabels(){
        
        let string = ingredients.joined(separator: "\u{0085}")
        self.ingredientesLabel.text = string
        
        self.sizeLabel.text = pizzaSize
        self.masaTypeLabel.text = masaType
        self.quesoTypeLabel.text = quesoType
    }
    
    
    // MARK: Actions
    
    @IBAction func nextAction(_ sender:AnyObject){
        print("Confirmar orden!")
        self.performSegue(withIdentifier: "pizzaSegue", sender: self)
        let alert = UIAlertController(title: "Correcto", message: "Tu pizza ha sido enviada para preparación!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "pizzaSegue"{
            
            
        }
    }
    
}
