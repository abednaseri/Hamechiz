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
    
    var sets = ["1","2","3","4","5"]
    var reps = ["8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    var all_arrays:[[String]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        all_arrays = [sets,reps]
        
        pickerView.dataSource = self
        pickerView.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        //dvdv
    }

}
