//
//  WishListController.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 9/7/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//

import UIKit


class WishListController: UITableViewController {

    
    var birthday: Birthday?

    
    @IBAction func pushAddAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Create new wish".localize(), message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (text) in
            text.placeholder = "New wish".localize()
        }

        let alertActionAdd = UIAlertAction(title: "Create".localize(), style: UIAlertAction.Style.default) { (alert) in
            let wishName = alertController.textFields?[0].text
            if wishName != "" {
                _ = Wish.newWish(name: wishName!.lowercased(), birthday: self.birthday)
                
                CoreDataManager.sharedInstance.saveContext()
                
                self.tableView.reloadData()
            
            }
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel".localize(), style: UIAlertAction.Style.default) { (alert) in
        }
        
        alertController.addAction(alertActionAdd)
        alertController.addAction(alertActionCancel)
        
        present(alertController, animated: true, completion: nil)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "background.jpg")
            let imageView = UIImageView(image: image)
            tableView.backgroundView = imageView
            imageView.alpha = 0.05
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (birthday?.wishesSorted.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishCell", for: indexPath)

        let wishInCell = birthday!.wishesSorted[indexPath.row]
    
        cell.textLabel?.text = wishInCell.name
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let wishInCell = birthday!.wishesSorted[indexPath.row]
            CoreDataManager.sharedInstance.managedObjecContext.delete(wishInCell)
            CoreDataManager.sharedInstance.saveContext()
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
}
