//
//  GymVC.swift
//  Hamechiz
//
//  Created by Abed on 13/01/2017.
//  Copyright © 2017 Webiaturist. All rights reserved.
//

import UIKit
import CoreData

class GymVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate{

   
    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Activity>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        attemptFetch()

    }

    func configureCell(cell: ActivityCell, indexPath: NSIndexPath){
        let activity = controller.object(at: indexPath as IndexPath)
        cell.configureCell(activity: activity)
    }
    
    // TableView functions
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    

    

    
    // Fetching and Controller things
    func attemptFetch(){
        
        
        let fetchRequest: NSFetchRequest = Activity.fetchRequest()
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort]

        
        let abed_controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        abed_controller.delegate = self
        self.controller = abed_controller
        
        do{
            try abed_controller.performFetch()
        }
        catch{
            let error = error as NSError
            print("\(error)")
        }
        
        
    }
   
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type{
        case .insert:
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case .update:
            if let indexPath = indexPath{
                let cell = tableView.cellForRow(at: indexPath) as! ActivityCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
            
        case .move:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
