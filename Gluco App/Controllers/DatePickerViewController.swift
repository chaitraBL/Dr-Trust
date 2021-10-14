//
//  DatePickerViewController.swift
//  Gluco App
//
//  Created by Anjali on 29/6/21.
//

import UIKit
protocol dateSelected {
    func selectedDate(selected:String)
}

class DatePickerViewController: UIViewController {
    var newTime:String?
    var delegate:dateSelected?
    @IBOutlet var datePick: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 13.4, *) {
            datePick.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
    }
    

    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()

            dateFormatter.dateStyle = DateFormatter.Style.short
//            dateFormatter.timeStyle = DateFormatter.Style.short
//        dateFormatter.timeZone = TimeZone.current
        

//        datePick.datePickerStyle = UIDatePickerStyle.compact
        let strDate = dateFormatter.string(from: datePick.date)
        let stringCurrent = dateFormatter.date(from: strDate)
        
         newTime = strDate
//            Int(stringCurrent!.timeIntervalSince1970)
//            dateLabel.text = strDate
        print("time1 \(strDate)")

    }
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ok(_ sender: UIButton) {
        delegate?.selectedDate(selected: newTime!)
        dismiss(animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toEditPersonal"
//        {
//            let vc = segue.destination as? EditPersonalViewController
//            vc!.date1 = newTime
//        }
//    }
}
