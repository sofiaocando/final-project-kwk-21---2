//
//  ToDoTableTableViewController.swift
//  Bubble
//
//  Created by Scholar on 8/2/21.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    var listOfToDo : [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createToDos() -> [ToDo] {

      let swift = ToDo()
      swift.name = "Add segues"
      swift.important = true

      let dog = ToDo()
      dog.name = "insert videos"
      // important is set to false by default

      return [swift, dog]
    }

    func getToDos() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
              listOfToDo = dataFromCoreData
              tableView.reloadData()
              }
         }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important {
          cell.textLabel?.text = "⭐️" + toDo.name
        } else {
          cell.textLabel?.text = toDo.name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
          if let toDo = sender as? ToDoCD {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
          }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }

}
