//
//  CalendarViewController.swift
//  Gluco App
//
//  Created by Anjali on 23/6/21.
//

import UIKit
import FSCalendar

protocol dateSelect {
    func selectedDate(date:String)
}

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    @IBOutlet var yearLabel: UILabel!
    var delegate:dateSelect?
    @IBOutlet var calendarView: FSCalendar!
    
    @IBOutlet var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendarView = calendar
        
    }
    
//    func maximumDate(for calendar: FSCalendar) -> Date {
//          let dateFormatter = DateFormatter()
//        let components = DateComponents()
//          dateFormatter.dateFormat = "MM,dd"
//        let maxCurrent = components.date
////        yearLabel.text = String(components.year!)
//        let format = dateFormatter.string(from: maxCurrent!)
//        return dateFormatter.date(from: format) ?? Date()
//    }
    
//    fileprivate lazy var dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }()
        
//    func minimumDate(for calendar: FSCalendar) -> Date {
//        return self.dateFormatter.date(from: "2018-01-01")!
//    }
        
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        let components = DateComponents()
//        return maximumDate(for: calendar)
////        return self.dateFormatter.date(from: components.date)!
//    }

    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let string = formatter.string(from: date)
        print("string \(string)")
        delegate?.selectedDate(date: string)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ok(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
