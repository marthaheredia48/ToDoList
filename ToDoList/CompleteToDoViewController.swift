//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Martha Andrade Aparicio on 01/08/22.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    
    
    
   
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //change title todo to the correct name in marked as complete
        
        titleLabel.text = selectedToDo?.name
        
        
    }
    //delete when mark complete
    @IBAction func completeTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        if let theToDo = selectedToDo {
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
        }
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
