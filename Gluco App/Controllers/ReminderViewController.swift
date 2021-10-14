//
//  ReminderViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit


class ReminderViewController: UIViewController {

    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePick: UIDatePicker!
    @IBOutlet var chkBtn: UIButton!
    @IBOutlet var monBtn: UIButton!
    @IBOutlet var thurBtn: UIButton!
    var selectedIndex = 0
    @IBOutlet var satBtn: UIButton!
    @IBOutlet var friBtn: UIButton!
    @IBOutlet var wedBtn: UIButton!
    @IBOutlet var tueBtn: UIButton!
    @IBOutlet var sunBtn: UIButton!
    @IBOutlet var medicineLabel: UITextField!
    var newTime = 0
    var selectedSun = 0
    var selectedMon = 0
    var selectedTue = 0
    var selectedWed = 0
    var selectedThur = 0
    var selectedFri = 0
    var selectedSat = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.4, *) {
            datePick.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()

//            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.timeZone = TimeZone.current

//        datePick.datePickerStyle = UIDatePickerStyle.compact
        let strDate = dateFormatter.string(from: datePick.date)
        let stringCurrent = dateFormatter.date(from: strDate)
        
         newTime = Int(stringCurrent!.timeIntervalSince1970)
            dateLabel.text = strDate
//        print("time1 \(newTime)")
        

    }
    

    
    @IBAction func repeatTime(_ sender: UIButton) {
        if chkBtn.isSelected {
            chkBtn.setBackgroundImage(UIImage(named: "uncheck"), for:.normal)
            sunBtn.backgroundColor = .clear
            monBtn.backgroundColor = .clear
            tueBtn.backgroundColor = .clear
            wedBtn.backgroundColor = .clear
            thurBtn.backgroundColor = .clear
            friBtn.backgroundColor = .clear
            satBtn.backgroundColor = .clear
            sunBtn.setTitleColor(.black, for: .normal)
            monBtn.setTitleColor(.black, for: .normal)
            tueBtn.setTitleColor(.black, for: .normal)
            wedBtn.setTitleColor(.black, for: .normal)
            thurBtn.setTitleColor(.black, for: .normal)
            friBtn.setTitleColor(.black, for: .normal)
            satBtn.setTitleColor(.black, for: .normal)
        } else {
            
            chkBtn.setBackgroundImage(UIImage(named: "check"), for: .normal)
            sunBtn.backgroundColor = .orange
            monBtn.backgroundColor = .orange
            tueBtn.backgroundColor = .orange
            wedBtn.backgroundColor = .orange
            thurBtn.backgroundColor = .orange
            friBtn.backgroundColor = .orange
            satBtn.backgroundColor = .orange
            sunBtn.setTitleColor(.purple, for: .normal)
            monBtn.setTitleColor(.purple, for: .normal)
            tueBtn.setTitleColor(.purple, for: .normal)
            wedBtn.setTitleColor(.purple, for: .normal)
            thurBtn.setTitleColor(.purple, for: .normal)
            friBtn.setTitleColor(.purple, for: .normal)
            satBtn.setTitleColor(.purple, for: .normal)
            sunBtn.isEnabled = false
            monBtn.isEnabled = false
            tueBtn.isEnabled = false
            wedBtn.isEnabled = false
            thurBtn.isEnabled = false
            friBtn.isEnabled = false
            satBtn.isEnabled = false
            sunBtn.tag = 1
            monBtn.tag = 1
            tueBtn.tag = 1
            wedBtn.tag = 1
            thurBtn.tag = 1
            friBtn.tag = 1
            satBtn.tag = 1

        }
        chkBtn.isSelected = !chkBtn.isSelected
        
    }
    
    @IBAction func sunday(_ sender: UIButton) {
        if sunBtn.backgroundColor == UIColor.orange
        {
            sunBtn.backgroundColor = .clear
            sunBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedSun = sender.tag
            
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            sunBtn.backgroundColor = .orange
            sunBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedSun = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func monday(_ sender: UIButton) {
        if monBtn.backgroundColor == UIColor.orange
        {
            monBtn.backgroundColor = .clear
            monBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedMon = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            monBtn.backgroundColor = .orange
            monBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedMon = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func tuesday(_ sender: UIButton) {
        if tueBtn.backgroundColor == UIColor.orange
        {
            tueBtn.backgroundColor = .clear
            tueBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedTue = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            tueBtn.backgroundColor = .orange
            tueBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedTue = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func wednesday(_ sender: UIButton) {
        if wedBtn.backgroundColor == UIColor.orange
        {
            wedBtn.backgroundColor = .clear
            wedBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedWed = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            wedBtn.backgroundColor = .orange
            wedBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedWed = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func thursday(_ sender: UIButton) {
        if thurBtn.backgroundColor == UIColor.orange
        {
            thurBtn.backgroundColor = .clear
            thurBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedThur = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            thurBtn.backgroundColor = .orange
            thurBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedThur = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func friday(_ sender: UIButton) {
        if friBtn.backgroundColor == UIColor.orange
        {
            friBtn.backgroundColor = .clear
            friBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedFri = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            friBtn.backgroundColor = .orange
            friBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedFri = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    @IBAction func saturday(_ sender: UIButton) {
        if satBtn.backgroundColor == UIColor.orange
        {
            satBtn.backgroundColor = .clear
            satBtn.setTitleColor(.black, for: .normal)
            sender.tag = 0
            selectedSat = sender.tag
//            print("unselected \(selectedSun)")
            
        }
        else
        {
            satBtn.backgroundColor = .orange
            satBtn.setTitleColor(.purple, for: .normal)
            sender.tag = 1
            selectedSat = sender.tag
//            print("selected \(selectedSun)")
        }
    }
    
    func convertToMilli(timeIntervalSince1970: TimeInterval) -> Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }

    
    @IBAction func Save(_ sender: UIButton) {
        if selectedIndex == 6 {
        Networking().addRemainder(token: newToken!, name: medicineLabel.text!, time: newTime, mon: selectedMon, tue: selectedTue, wed: selectedWed, thu: selectedThur, fri: selectedFri, sat: selectedSat, sun: selectedSun, type: 1) { (data, error) in
            if let obj = data as? NSDictionary
            {
                print("inserted")
            }
        }
        }
        else if selectedIndex == 7 {
        Networking().addRemainder(token: newToken!, name: medicineLabel.text!, time: newTime, mon: selectedMon, tue: selectedTue, wed: selectedWed, thu: selectedThur, fri: selectedFri, sat: selectedSat, sun: selectedSun, type: 2) { (data, error) in
            if let obj = data as? NSDictionary
            {
                print("inserted")
            }
        }
        }
    }
    

}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}


