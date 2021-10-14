//
//  ViewReminderViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit

class ViewReminderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var titleLabel: UILabel!
    
    var indexVal = 0
    var remainderArray:[remainderDetails] = []
    var remainferObj:[readingData] = []
    var nameArray:[String] = []
    var time:[Double] = []
    var sunArray:[Int] = []
    var monArray:[Int] = []
    var tueArray:[Int] = []
    var wedArray:[Int] = []
    var thuArray:[Int] = []
    var friArray:[Int] = []
    var satArray:[Int] = []
    var id:[Int] = []
    @IBOutlet var remainderTb: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remainferObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "remainderCell", for: indexPath) as! remainderTableViewCell
        cell.medicine.text = remainferObj[indexPath.row].name
//            remainderArray[indexPath.row].name
//        let date = Date(timeIntervalSince1970: Double(remainferObj[indexPath.row].time) / 1000.0)
////            Date(timeIntervalSince1970: Double(remainferObj[indexPath.row].time) / 1000.0)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
////            "E, d MMM yyyy HH:mm:ss"
//        print(dateFormatter.string(from: date))
//        time.append(dateFormatter.string(from: date))
//        var milliseconds = Double(remainferObj[indexPath.row].time ?? String "")
//        milliseconds =  floor((milliseconds?)!/1000)
//        let seconds : double_t = fmod(milliseconds!, 60)
//        let minutes  : double_t = fmod((milliseconds! / 60) , 60)
//        let hours  : double_t = fmod((milliseconds! / (60*60)), 60)

//        time.append(hours)
//       let time = convertTime(miliseconds: Int(remainferObj[indexPath.row].time))
//        let time = stringFromTimeInterval(interval: Double(remainferObj[indexPath.row].time))
//            stringFromTime(interval: Double(remainferObj[indexPath.row].time))
//         let time = remainferObj[indexPath.row].time
        let time1 = convertTime(miliseconds: remainferObj[indexPath.row].time1!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let date = dateFormatter.date(from: time1)
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: date!)
        print("12 hour formatted Date:",Date12)

//        print("time \(time1 )")
        cell.timeLab.text = Date12
//            String(remainderArray[indexPath.row].time!)
        
        if remainferObj[indexPath.row].sun == 1
        {
            cell.sunBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].mon == 1
        {
            cell.monBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].tue == 1
        {
            cell.tueBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].wed == 1
        {
            cell.wedBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].thur == 1
        {
            cell.thurBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].fri == 1
        {
            cell.friBtn.backgroundColor = .orange
        }
        if remainferObj[indexPath.row].sat == 1
        {
            cell.satBtn.backgroundColor = .orange
        }
        cell.deleteBtn.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
        cell.deleteBtn.tag = indexPath.row
//            String(remainderArray[indexPath.row].time!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

    
    @objc func action(sender: UIButton){
        let buttonTag = sender.tag
        let remainder = remainferObj[buttonTag]
        alert(msg: "Are you sure want to delete reminder", id: remainder.id! )
//        if buttonTag == 0
//        {
//            print(buttonTag,"buttonTag")
//            alert(msg: "Are you sure want to delete reminder")
//        }
//        else
//        {
//           print(buttonTag,"buttonTag")
//            alert(msg: "Nagavalliyavare Good night")
//        }

    }
    
    func convertTime(miliseconds: Int) -> String {

        var seconds: Int = 0
        var minutes: Int = 0
        var hours: Int = 0
        var days: Int = 0
        var secondsTemp: Int = 0
        var minutesTemp: Int = 0
        var hoursTemp: Int = 0

        if miliseconds < 1000 {
            return ""
        } else if miliseconds < 1000 * 60 {
            seconds = miliseconds / 1000
            return "\(seconds) seconds"
        } else if miliseconds < 1000 * 60 * 60 {
            secondsTemp = miliseconds / 1000
            minutes = secondsTemp / 60
            seconds = (miliseconds - minutes * 60 * 1000) / 1000
            return "\(minutes) minutes, \(seconds) seconds"
        } else if miliseconds < 1000 * 60 * 60 * 24 {
            minutesTemp = miliseconds / 1000 / 60
            hours = minutesTemp / 60
            minutes = (miliseconds - hours * 60 * 60 * 1000) / 1000 / 60
            seconds = (miliseconds - hours * 60 * 60 * 1000 - minutes * 60 * 1000) / 1000
            return "\(hours) hours, \(minutes) minutes, \(seconds) seconds"
        } else {
            hoursTemp = miliseconds / 1000 / 60 / 60
            days = hoursTemp / 24
            hours = (miliseconds - days * 24 * 60 * 60 * 1000) / 1000 / 60 / 60
            minutes = (miliseconds - days * 24 * 60 * 60 * 1000 - hours * 60 * 60 * 1000) / 1000 / 60
            seconds = (miliseconds - days * 24 * 60 * 60 * 1000 - hours * 60 * 60 * 1000 - minutes * 60 * 1000) / 1000
            return "\(hours):\(minutes)"
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        if indexVal == 6 {
            self.titleLabel.text = "View all your medicine reminders here"
        Networking().viewRemainder(token: newToken!) { (data, error) in
            self.remainferObj = (data as? [readingData])!
            if self.remainferObj.count > 0
            {
                for i in self.remainferObj
                {
                    if i.type == 1
                    {
                        self.remainderTb.reloadData()
                    }
                }
            }
//            if let obj = data as? NSDictionary
//            {
//                let name = obj["label_name"] as? String ?? ""
//                let time = obj["time"] as? Int ?? 0
////                let s = 45296789
//
//                let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
//                let formatter = DateFormatter()
//                formatter.timeStyle = DateFormatter.Style.short
//                formatter.timeZone = TimeZone.current
//
////                    NSTimeZone(name: "UTC") as TimeZone?
////                formatter.dateFormat = "HH mm"
//
////                print(formatter.string(from: date as Date))
//                let newTime = formatter.string(from: date as Date)
//
//                print("new time \(newTime)")
//                let sun = obj["sun"] as? Int ?? 0
//                let mon = obj["mon"] as? Int ?? 0
//                let tue = obj["tue"] as? Int ?? 0
//                let wed = obj["wed"] as? Int ?? 0
//                let thur = obj["thu"] as? Int ?? 0
//                let fri = obj["fri"] as? Int ?? 0
//                let sat = obj["sat"] as? Int ?? 0
//                let id = obj["id"] as? Int ?? 0
//                let uid = obj["uid"] as? String ?? ""
//                let type = obj["type"] as? Int ?? 0
//                if type == 1 {
//                    let remainderObj = remainderDetails(myName: name, myTime: time, mySun: sun, myMon: mon, myTue: tue, mywed: wed, myThu: thur, myFri: fri, mySat: sat, myid: id, uuid: uid, type1: type)
//                    self.remainderArray.append(remainderObj)
//                    self.nameArray.append(name)
//                    self.time.append(newTime)
//                    self.sunArray.append(sun)
//                    self.monArray.append(mon)
//                    self.tueArray.append(tue)
//                    self.wedArray.append(wed)
//                    self.thuArray.append(thur)
//                    self.friArray.append(fri)
//                    self.satArray.append(sat)
//                    self.id.append(id)
//                    self.remainderTb.reloadData()
//                }
//
//            }
        }
        }
        else if indexVal == 7
        {
            self.titleLabel.text = "View all your BG reminders here"
            Networking().viewRemainder(token: newToken!) { (data, error) in
                self.remainferObj = (data as? [readingData])!
                if self.remainferObj.count > 0
                {
                    for i in self.remainferObj
                    {
                        if i.type == 1
                        {
                            self.remainderTb.reloadData()
                        }
                    }
                }

//                if let obj = data as? NSDictionary
//                {
//                    let name = obj["label_name"] as? String ?? ""
//                    let time = obj["time"] as? Int ?? 0
//                    let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
//                    let formatter = DateFormatter()
//                    formatter.timeStyle = DateFormatter.Style.short
//                    formatter.timeZone = TimeZone.current
//
//    //                    NSTimeZone(name: "UTC") as TimeZone?
//    //                formatter.dateFormat = "HH mm"
//
//    //                print(formatter.string(from: date as Date))
//                    let newTime = formatter.string(from: date as Date)
//                    let sun = obj["sun"] as? Int ?? 0
//                    let mon = obj["mon"] as? Int ?? 0
//                    let tue = obj["tue"] as? Int ?? 0
//                    let wed = obj["wed"] as? Int ?? 0
//                    let thur = obj["thu"] as? Int ?? 0
//                    let fri = obj["fri"] as? Int ?? 0
//                    let sat = obj["sat"] as? Int ?? 0
//                    let id = obj["id"] as? Int ?? 0
//                    let uid = obj["uid"] as? String ?? ""
//                    let type = obj["type"] as? Int ?? 0
//                    if type == 2 {
//                        let remainderObj = remainderDetails(myName: name, myTime: time, mySun: sun, myMon: mon, myTue: tue, mywed: wed, myThu: thur, myFri: fri, mySat: sat, myid: id, uuid: uid, type1: type)
//                        self.remainderArray.append(remainderObj)
//                        self.nameArray.append(name)
//                        self.time.append(newTime)
//                        self.sunArray.append(sun)
//                        self.monArray.append(mon)
//                        self.tueArray.append(tue)
//                        self.wedArray.append(wed)
//                        self.thuArray.append(thur)
//                        self.friArray.append(fri)
//                        self.satArray.append(sat)
//                        self.id.append(id)
//                        self.remainderTb.reloadData()
//                    }
//
//                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if indexVal == 6 {
            self.titleLabel.text = "View all your medicine reminders here"
        Networking().viewRemainder(token: newToken!) { (data, error) in
            self.remainferObj = (data as? [readingData])!
            if self.remainferObj.count > 0
            {
                for i in self.remainferObj
                {
                    print("type \(i.type)")
                    if i.type == 1
                    {
                        
                        self.remainderTb.reloadData()
                    }
                }
            }

//            if let obj = data as? NSDictionary
//            {
//                let name = obj["label_name"] as? String ?? ""
//                let time = obj["time"] as? Int ?? 0
////                let s = 45296789
//
//                let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
//                let formatter = DateFormatter()
//                formatter.timeStyle = DateFormatter.Style.short
//                formatter.timeZone = TimeZone.current
//
////                    NSTimeZone(name: "UTC") as TimeZone?
////                formatter.dateFormat = "HH mm"
//
////                print(formatter.string(from: date as Date))
//                let newTime = formatter.string(from: date as Date)
//
//                print("new time \(newTime)")
//                let sun = obj["sun"] as? Int ?? 0
//                let mon = obj["mon"] as? Int ?? 0
//                let tue = obj["tue"] as? Int ?? 0
//                let wed = obj["wed"] as? Int ?? 0
//                let thur = obj["thu"] as? Int ?? 0
//                let fri = obj["fri"] as? Int ?? 0
//                let sat = obj["sat"] as? Int ?? 0
//                let id = obj["id"] as? Int ?? 0
//                let uid = obj["uid"] as? String ?? ""
//                let type = obj["type"] as? Int ?? 0
//                if type == 1 {
//                    let remainderObj = remainderDetails(myName: name, myTime: time, mySun: sun, myMon: mon, myTue: tue, mywed: wed, myThu: thur, myFri: fri, mySat: sat, myid: id, uuid: uid, type1: type)
//                    self.remainderArray.append(remainderObj)
//                    self.nameArray.append(name)
//                    self.time.append(newTime)
//                    self.sunArray.append(sun)
//                    self.monArray.append(mon)
//                    self.tueArray.append(tue)
//                    self.wedArray.append(wed)
//                    self.thuArray.append(thur)
//                    self.friArray.append(fri)
//                    self.satArray.append(sat)
//                    self.id.append(id)
//                    self.remainderTb.reloadData()
//                }
//
//            }
        }
        }
        else if indexVal == 7
        {
            self.titleLabel.text = "View all your BG reminders here"
            Networking().viewRemainder(token: newToken!) { (data, error) in
                self.remainferObj = (data as? [readingData])!
                if self.remainferObj.count > 0
                {
                    for i in self.remainferObj
                    {
                        if i.type == 1
                        {
                            self.remainderTb.reloadData()
                        }
                    }
                }

//                if let obj = data as? NSDictionary
//                {
//                    let name = obj["label_name"] as? String ?? ""
//                    let time = obj["time"] as? Int ?? 0
//                    let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
//                    let formatter = DateFormatter()
//                    formatter.timeStyle = DateFormatter.Style.short
//                    formatter.timeZone = TimeZone.current
//
//    //                    NSTimeZone(name: "UTC") as TimeZone?
//    //                formatter.dateFormat = "HH mm"
//
//    //                print(formatter.string(from: date as Date))
//                    let newTime = formatter.string(from: date as Date)
//                    let sun = obj["sun"] as? Int ?? 0
//                    let mon = obj["mon"] as? Int ?? 0
//                    let tue = obj["tue"] as? Int ?? 0
//                    let wed = obj["wed"] as? Int ?? 0
//                    let thur = obj["thu"] as? Int ?? 0
//                    let fri = obj["fri"] as? Int ?? 0
//                    let sat = obj["sat"] as? Int ?? 0
//                    let id = obj["id"] as? Int ?? 0
//                    let uid = obj["uid"] as? String ?? ""
//                    let type = obj["type"] as? Int ?? 0
//                    if type == 2 {
//                        let remainderObj = remainderDetails(myName: name, myTime: time, mySun: sun, myMon: mon, myTue: tue, mywed: wed, myThu: thur, myFri: fri, mySat: sat, myid: id, uuid: uid, type1: type)
//                        self.remainderArray.append(remainderObj)
//                        self.nameArray.append(name)
//                        self.time.append(newTime)
//                        self.sunArray.append(sun)
//                        self.monArray.append(mon)
//                        self.tueArray.append(tue)
//                        self.wedArray.append(wed)
//                        self.thuArray.append(thur)
//                        self.friArray.append(fri)
//                        self.satArray.append(sat)
//                        self.id.append(id)
//                        self.remainderTb.reloadData()
//                    }
//
//                }
            }
        }
        
    }
    
    func alert(msg:String, id: Int)
    {
        let alert = UIAlertController(title: "Alert!", message: msg, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Yes", style: .default) { (alert) in
            Networking().deleteRemainders(id: id, token: newToken!) { (data, error) in
                self.remainderTb.reloadData()
//                if let obj = data as? NSDictionary
//                {
//
//                }
            }
        }
        
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
            
        alert.addAction(okay)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
}

    @IBAction func toViewRemainder(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddRemainder", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddRemainder"
        {
            let dest = segue.destination as? ReminderViewController
            dest?.selectedIndex = indexVal
        }
    }
}

