//
//  TableViewController.swift
//  NoteApp
//
//  Created by Edgar Ruiz on 6/14/18.
//  Copyright © 2018 Edgar Ruiz. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    //var names : [String] = [];
    var categories : [Category] = [Category]();
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCats();
        tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)

        cell.textLabel?.text = categories[indexPath.row].name;
        
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController;
        vc.category = categories[(tableView.indexPathForSelectedRow!.row)];
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let uiAlert = UIAlertController(title: "Add a note title", message: "Test", preferredStyle: .alert);
        uiAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
           // self.names.append(uiAlert.textFields![0].text!);
            let cat = Category(context: self.context);
            cat.name = uiAlert.textFields![0].text!
            self.categories.append(cat);
            self.saveItems();
            self.tableView.reloadData();
            
        }));
        uiAlert.addTextField(configurationHandler: {textField in
            textField.placeholder = "Task Tile";
        })
        self.present(uiAlert, animated: true);

    }
    
    func saveItems(){
        
        do{
            try context.save()
            print("Cat Saved successfully");
        }catch{
            print(error);
        }
        
    }
    
    func loadCats(){
        print("loadedcats")
        let request : NSFetchRequest<Category> = Category.fetchRequest();
        
        do{
            categories = try context.fetch(request);
        }catch{
            print(error)
        }
        
    }
    
}
