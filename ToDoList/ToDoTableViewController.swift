//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Martha Andrade Aparicio on 01/08/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos : [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToDos()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        
    }
    
    func getToDos() {
    //    go into CD and get all the toDos
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData() //this is an important line
                
            }
    //try to get those objects stored in Core Data (CD)
        }
        
        

    }
        
        
        //Here I am declaring that everyhting that is in the func createToDos will be stored in toDos which is asigned o the class of ToDo


        
        //this is a function that tell the difference from an important and not so important task. This are examples which will be dynamic later
        

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1 //so that 1 (something) will show in the table
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
        //we need to have the same number of arrows as the number of toDos objects the user typed. Number of elements in the array
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        let     toDo = toDos[indexPath.row]
        
        //if the todo is important
        //"toDo.name" + "!!!"
        //otherwise
        
        if let name = toDo.name {
        if toDo.important {
            cell.textLabel?.text = "‼️" + name
        
        } else {
            cell.textLabel?.text = "📌" + name
        
        }
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        //match row and name and mark to complete
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
        

    }
        

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller. Aqui va a saber el table lo que el usuario agregó recientemente
        
        if let addVC = segue.destination as? AdToDoViewController {
            addVC.previousVC = self;
            
        }
       //connect to views controllers menu and mark complete
        if let completeVC = segue.destination as?
            CompleteToDoViewController {
            if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
                
                
            }
        }
        
    }
    

}
