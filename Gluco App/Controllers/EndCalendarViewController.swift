//
//  EndCalendarViewController.swift
//  Gluco App
//
//  Created by Anjali on 26/6/21.
//

import UIKit
import FSCalendar
protocol enddateSelect {
    func selectedDate1(date:String)
}
class EndCalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    var delegate:enddateSelect?
    @IBOutlet var calendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendarView = calendar

    }
    

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let string = formatter.string(from: date)
        print("string \(string)")
        delegate?.selectedDate1(date: string)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ok(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
