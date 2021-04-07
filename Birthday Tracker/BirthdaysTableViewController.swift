//
//  BirthdaysTableViewController.swift
//  Birthday Tracker
//
//  Created by Dmitriy Lee on 7/16/20.
//  Copyright © 2020 LEES Entertainment. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class BirthdaysTableViewController: UITableViewController {
    
    var birthdays = [Birthday]()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "background.jpg")
            let imageView = UIImageView(image: image)
            tableView.backgroundView = imageView
            imageView.alpha = 0.05

        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 6)
    
    }

   override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear (true)
    
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if segue.identifier == "goToWishList" {
           let selectedBirthday = birthdays[tableView.indexPathForSelectedRow!.row]
           (segue.destination as! WishListController).birthday = selectedBirthday
        }
           guard let navigationController = segue.destination as? UINavigationController else {
               return
           }

           guard let addBirthdayVC = navigationController.viewControllers.first as? AddBirthdayViewController else {
               return
           }

           addBirthdayVC.saveCompletion = {
               self.loadData()
           }
       }

    
    func loadData() {
        let context = CoreDataManager.sharedInstance.persistentContainer.viewContext
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        let sortDescriptor1 = NSSortDescriptor (key: "daysLeft", ascending: false)
        let sortDescriptor2 = NSSortDescriptor (key: "lastName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]

        do {
            birthdays = try context.fetch (fetchRequest)
        } catch let error {
            print ("There is error: \(error)")
        }

        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for: indexPath) as! BirthdayCell
        
        let birthday = birthdays[indexPath.row]
        cell.initCell(birthday: birthday)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if birthdays.count > indexPath.row {
            
            let birthday = birthdays[indexPath.row]
            
            // Remove notification
            if let identifier = birthday.birthdayId {
                let center = UNUserNotificationCenter.current()
                center.removePendingNotificationRequests(withIdentifiers: [identifier])
            }

            let context = CoreDataManager.sharedInstance.persistentContainer.viewContext
            
            context.delete(birthday)
            birthdays.remove(at: indexPath.row)
            
            do {
                try context.save()
            } catch let error {
                print("Could not save \(error).")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
