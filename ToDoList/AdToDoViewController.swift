//
//  AdToDoViewController.swift
//  ToDoList
//
//  Created by Martha Andrade Aparicio on 01/08/22.
//

import UIKit
import CoreData

class AdToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController ()
    
    @IBOutlet weak var titletextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //below is a func in which we can see the ToDos in the core data
    
    @IBAction func addTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as?
                AppDelegate else {
                    return
                }
        
        //new core data to do object to save in data base, context and appdelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let toDo = ToDoCD(context: context)
        
        toDo.name = titletextField.text
        toDo.important = importantSwitch.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
