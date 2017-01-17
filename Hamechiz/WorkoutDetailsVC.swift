//
//  WorkoutDetailsVC.swift
//  Hamechiz
//
//  Created by Abed on 13/01/2017.
//  Copyright © 2017 Webiaturist. All rights reserved.
//

import UIKit
import CoreData

class WorkoutDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var activityTypeImage: UIImageView!
    
    var sets = ["1","2","3","4","5"]
    var reps = ["8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    var exercise_type = ["Biceps","Chest","Triceps","Lats","Traps","Shoulder","Abs","Forearm","Quads"]
    var all_arrays:[[String]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        all_arrays = [exercise_type,sets,reps]
        
        pickerView.dataSource = self
        pickerView.delegate = self

    }

    
    
    //Save a new activity
    func saveNewActivity(){
        
        let activity = Activity(context: context)
        
        activity.date = NSDate()
        activity.type = exercise_type[pickerView.selectedRow(inComponent: 0)]
        activity.sets = sets[pickerView.selectedRow(inComponent: 1)]
        activity.reps = reps[pickerView.selectedRow(inComponent: 2)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)

        
    }
    
    
    
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return all_arrays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return all_arrays[component].count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return all_arrays[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activityTypeImage.image = UIImage(named: exercise_type[pickerView.selectedRow(inComponent: 0)])
        
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        saveNewActivity()
    }

}
