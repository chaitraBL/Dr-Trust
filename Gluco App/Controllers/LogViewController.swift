//
//  LogViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//

import UIKit
import CoreData

class LogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, dateSelect,enddateSelect{
        
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet var errorLabel: UILabel!
    var selectedDateArray:[String] = []
    var filteredArray:[filteredDate] = []
    var localReadingList:[ReadingList] = []
    @IBOutlet var startDate: UIButton!
    @IBOutlet var endDate: UIButton!
    var logdata:Int = 0
    var readingDetails:[readingData] = []
    var localReadingData:[readingList] = []
    @IBOutlet var logTB: UITableView!
    var selectedDate:String?
    var selectedEndDate:String?
    
    func selectedDate(date: String) {
        startDate.setTitle(date, for: .normal)
        selectedDate = startDate.currentTitle
        
//        endDate.setTitle(date, for: .normal)
//        selectedEndDate = endDate.currentTitle
//        dismiss(animated: true, completion: nil)
    }
    func selectedDate1(date: String) {
        endDate.setTitle(date, for: .normal)
        selectedEndDate = endDate.currentTitle
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
//        if readingDetails.count > 0
//        {
//            count = readingDetails.count
//        }
        if Reachability.isConnectedToNetwork()
        {
            if filteredArray.count > 0
           {
               count = filteredArray.count
           }
           else
           {
               count = readingDetails.count
           }
        }
         else
        {
            if localReadingData.count > 0
            {
                count = localReadingData.count
            }
            else
            {
                count = filteredArray.count
            }
        }
//        print("count \(readingDetails.count)")
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell1 = UITableViewCell()
        if Reachability.isConnectedToNetwork()
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell") as! LogsTableViewCell
        if filteredArray.count > 0
        {
//            print("controll is filtering")
//            cell.dateLabel.backgroundColor = UIColor(red: 118, green: 214, blue: 255, alpha: 1)
            let originalDateFormatter = DateFormatter()
                originalDateFormatter.dateFormat = "yyyy-MM-dd"
            let newDateFormatter = DateFormatter()
                newDateFormatter.dateFormat = "d-MMM"
            if let date: Date = originalDateFormatter.date(from: filteredArray[indexPath.row].date!) {
                        let dateInNewStringFormat: String = newDateFormatter.string(from: date)
                        print("dateInNewStringFormat\(dateInNewStringFormat)")
            cell.dateLabel.text = dateInNewStringFormat
                
            }
            let value = filteredArray[indexPath.row].value
    //        print("value = \(value)")
    //        print("reading type \(readingDetails[indexPath.row].readingType)")

           if filteredArray[indexPath.row].status == "PRE-DIABETIC"
            {
            if filteredArray[indexPath.row].readingType == 1 {
                cell.fastingLabel.setTitle(String(value!), for: .normal)
                cell.fastingLabel.backgroundColor = .orange
                cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                cell.fastingLabel.tag = indexPath.row
            }
            else
            {
                cell.fastingLabel.setTitle("", for: .normal)
                cell.fastingLabel.backgroundColor = .systemGray6
            }
            if filteredArray[indexPath.row].readingType == 2 {
                cell.preMealLabel.setTitle(String(value!), for: .normal)
                cell.preMealLabel.backgroundColor = .orange
                cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                cell.preMealLabel.tag = indexPath.row
            }
            else
            {
                cell.preMealLabel.setTitle("", for: .normal)
                cell.preMealLabel.backgroundColor = .systemGray6
            }
            if filteredArray[indexPath.row].readingType == 3 {
                cell.postMealLabel.setTitle(String(value!), for: .normal)
                cell.postMealLabel.backgroundColor = .orange
                cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                cell.postMealLabel.tag = indexPath.row

            }
            else
            {
                cell.postMealLabel.setTitle("", for: .normal)
                cell.postMealLabel.backgroundColor = .systemGray6
            }
            if filteredArray[indexPath.row].readingType == 4 {
                cell.randomLabel.setTitle(String(value!), for: .normal)
                cell.randomLabel.backgroundColor = .orange
                cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                cell.randomLabel.tag = indexPath.row
            }
            else
            {
                cell.randomLabel.setTitle("", for: .normal)
                cell.randomLabel.backgroundColor = .systemGray6
            }
            }
            if filteredArray[indexPath.row].status == "NORMAL" || filteredArray[indexPath.row].status == "LOW"
            {
                if filteredArray[indexPath.row].readingType == 1 {
                    cell.fastingLabel.setTitle(String(value!), for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGreen
                    cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                    cell.fastingLabel.tag = indexPath.row
                }
                else
                {
                    cell.fastingLabel.setTitle("", for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGray6
                }
                if filteredArray[indexPath.row].readingType == 2 {
                    cell.preMealLabel.setTitle(String(value!), for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGreen
                    cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                    cell.preMealLabel.tag = indexPath.row
                }
                else
                {
                    cell.preMealLabel.setTitle("", for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGray6
                }
                if filteredArray[indexPath.row].readingType == 3 {
                    cell.postMealLabel.setTitle(String(value!), for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGreen
                    cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                    cell.postMealLabel.tag = indexPath.row

                }
                else
                {
                    cell.postMealLabel.setTitle("", for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGray6
                }
                if filteredArray[indexPath.row].readingType == 4 {
                    cell.randomLabel.setTitle(String(value!), for: .normal)
                    cell.randomLabel.backgroundColor = .systemGreen
                    cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                    cell.randomLabel.tag = indexPath.row
                }
                else
                {
                    cell.randomLabel.setTitle("", for: .normal)
                    cell.randomLabel.backgroundColor = .systemGray6
                }
            }

            if filteredArray[indexPath.row].status == "DIABETIC" || filteredArray[indexPath.row].status == "HIGH"
            {
                if filteredArray[indexPath.row].readingType == 1 {
                    cell.fastingLabel.setTitle(String(value!), for: .normal)
                    cell.fastingLabel.backgroundColor = .red
                    cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                    cell.fastingLabel.tag = indexPath.row
                }
                else
                {
                    cell.fastingLabel.setTitle("", for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGray6
                }
                if filteredArray[indexPath.row].readingType == 2 {
                    cell.preMealLabel.setTitle(String(value!), for: .normal)
                    cell.preMealLabel.backgroundColor = .red
                    cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                    cell.preMealLabel.tag = indexPath.row
                }
                else
                {
                    cell.preMealLabel.setTitle("", for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGray6
                }
                if filteredArray[indexPath.row].readingType == 3 {
                    cell.postMealLabel.setTitle(String(value!), for: .normal)
                    cell.postMealLabel.backgroundColor = .red
                    cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                    cell.postMealLabel.tag = indexPath.row

                }
                else
                {
                    cell.postMealLabel.setTitle("", for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 4 {
                    cell.randomLabel.setTitle(String(value!), for: .normal)
                    cell.randomLabel.backgroundColor = .red
                    cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                    cell.randomLabel.tag = indexPath.row
                }
                else
                {
                    cell.randomLabel.setTitle("", for: .normal)
                    cell.randomLabel.backgroundColor = .systemGray6
                }
            }
        }
        
        else{
//            print("controll is not filtering")
//            cell.dateLabel.backgroundColor = UIColor(red: 118, green: 214, blue: 255, alpha: 1)
            let originalDateFormatter = DateFormatter()
                originalDateFormatter.dateFormat = "yyyy-MM-dd"
            let newDateFormatter = DateFormatter()
                newDateFormatter.dateFormat = "d-MMM"
            if let date: Date = originalDateFormatter.date(from: readingDetails[indexPath.row].date!) {
                        let dateInNewStringFormat: String = newDateFormatter.string(from: date)
//                        print("dateInNewStringFormat\(dateInNewStringFormat)")
            cell.dateLabel.text = dateInNewStringFormat
//                cell.dateLabel.backgroundColor = UIColor(red: 118, green: 214, blue: 255, alpha: 1)
            }
            let value = readingDetails[indexPath.row].value
    //        print("value = \(value)")
    //        print("reading type \(readingDetails[indexPath.row].readingType)")

           if readingDetails[indexPath.row].status == "PRE-DIABETIC"
            {
            if readingDetails[indexPath.row].readingType == 1 {
                cell.fastingLabel.setTitle(String(value!), for: .normal)
                cell.fastingLabel.backgroundColor = .orange
                cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                cell.fastingLabel.tag = indexPath.row
            }
            else
            {
                cell.fastingLabel.setTitle("", for: .normal)
                cell.fastingLabel.backgroundColor = .systemGray6
            }
            if readingDetails[indexPath.row].readingType == 2 {
                cell.preMealLabel.setTitle(String(value!), for: .normal)
                cell.preMealLabel.backgroundColor = .orange
                cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                cell.preMealLabel.tag = indexPath.row
            }
            else
            {
                cell.preMealLabel.setTitle("", for: .normal)
                cell.preMealLabel.backgroundColor = .systemGray6
            }
            if readingDetails[indexPath.row].readingType == 3 {
                cell.postMealLabel.setTitle(String(value!), for: .normal)
                cell.postMealLabel.backgroundColor = .orange
                cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                cell.postMealLabel.tag = indexPath.row

            }
            else
            {
                cell.postMealLabel.setTitle("", for: .normal)
                cell.postMealLabel.backgroundColor = .systemGray6
            }
            if readingDetails[indexPath.row].readingType == 4 {
                cell.randomLabel.setTitle(String(value!), for: .normal)
                cell.randomLabel.backgroundColor = .orange
                cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                cell.randomLabel.tag = indexPath.row
            }
            else
            {
                cell.randomLabel.setTitle("", for: .normal)
                cell.randomLabel.backgroundColor = .systemGray6
            }
            }
            if readingDetails[indexPath.row].status == "NORMAL" || readingDetails[indexPath.row].status == "LOW"
            {
                if readingDetails[indexPath.row].readingType == 1 {
                    cell.fastingLabel.setTitle(String(value!), for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGreen
                    cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                    cell.fastingLabel.tag = indexPath.row
                }
                else
                {
                    cell.fastingLabel.setTitle("", for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 2 {
                    cell.preMealLabel.setTitle(String(value!), for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGreen
                    cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                    cell.preMealLabel.tag = indexPath.row
                }
                else
                {
                    cell.preMealLabel.setTitle("", for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 3 {
                    cell.postMealLabel.setTitle(String(value!), for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGreen
                    cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                    cell.postMealLabel.tag = indexPath.row

                }
                else
                {
                    cell.postMealLabel.setTitle("", for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 4 {
                    cell.randomLabel.setTitle(String(value!), for: .normal)
                    cell.randomLabel.backgroundColor = .systemGreen
                    cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                    cell.randomLabel.tag = indexPath.row
                }
                else
                {
                    cell.randomLabel.setTitle("", for: .normal)
                    cell.randomLabel.backgroundColor = .systemGray6
                }
            }

            if readingDetails[indexPath.row].status == "DIABETIC" || readingDetails[indexPath.row].status == "HIGH"
            {
                if readingDetails[indexPath.row].readingType == 1 {
                    cell.fastingLabel.setTitle(String(value!), for: .normal)
                    cell.fastingLabel.backgroundColor = .red
                    cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                    cell.fastingLabel.tag = indexPath.row
                }
                else
                {
                    cell.fastingLabel.setTitle("", for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 2 {
                    cell.preMealLabel.setTitle(String(value!), for: .normal)
                    cell.preMealLabel.backgroundColor = .red
                    cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                    cell.preMealLabel.tag = indexPath.row
                }
                else
                {
                    cell.preMealLabel.setTitle("", for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 3 {
                    cell.postMealLabel.setTitle(String(value!), for: .normal)
                    cell.postMealLabel.backgroundColor = .red
                    cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                    cell.postMealLabel.tag = indexPath.row
                    
                }
                else
                {
                    cell.postMealLabel.setTitle("", for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGray6
                }
                if readingDetails[indexPath.row].readingType == 4 {
                    cell.randomLabel.setTitle(String(value!), for: .normal)
                    cell.randomLabel.backgroundColor = .red
                    cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                    cell.randomLabel.tag = indexPath.row
                }
                else
                {
                    cell.randomLabel.setTitle("", for: .normal)
                    cell.randomLabel.backgroundColor = .systemGray6
                }
            }
//            cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
//            cell.fastingLabel.tag = indexPath.row
//            cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
//            cell.preMealLabel.tag = indexPath.row
//            cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
//            cell.postMealLabel.tag = indexPath.row
//            cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
//            cell.randomLabel.tag = indexPath.row

            
        }
            cell1 = cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "logCell") as! LogsTableViewCell
            if localReadingData.count > 0
            {
    //            print("controll is filtering")
    //            cell.dateLabel.backgroundColor = UIColor(red: 118, green: 214, blue: 255, alpha: 1)
                let originalDateFormatter = DateFormatter()
                    originalDateFormatter.dateFormat = "yyyy-MM-dd"
                let newDateFormatter = DateFormatter()
                    newDateFormatter.dateFormat = "d-MMM"
                if let date: Date = originalDateFormatter.date(from: localReadingData[indexPath.row].date!) {
                            let dateInNewStringFormat: String = newDateFormatter.string(from: date)
//                            print("dateInNewStringFormat\(dateInNewStringFormat)")
                cell.dateLabel.text = dateInNewStringFormat
                    
                }
                let value = localReadingData[indexPath.row].value
        //        print("value = \(value)")
        //        print("reading type \(readingDetails[indexPath.row].readingType)")

               if localReadingData[indexPath.row].status == "PRE-DIABETIC"
                {
                if localReadingData[indexPath.row].readingType == 1 {
                    cell.fastingLabel.setTitle(String(value!), for: .normal)
                    cell.fastingLabel.backgroundColor = .orange
                    cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                    cell.fastingLabel.tag = indexPath.row
                }
                else
                {
                    cell.fastingLabel.setTitle("", for: .normal)
                    cell.fastingLabel.backgroundColor = .systemGray6
                }
                if localReadingData[indexPath.row].readingType == 2 {
                    cell.preMealLabel.setTitle(String(value!), for: .normal)
                    cell.preMealLabel.backgroundColor = .orange
                    cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                    cell.preMealLabel.tag = indexPath.row
                }
                else
                {
                    cell.preMealLabel.setTitle("", for: .normal)
                    cell.preMealLabel.backgroundColor = .systemGray6
                }
                if localReadingData[indexPath.row].readingType == 3 {
                    cell.postMealLabel.setTitle(String(value!), for: .normal)
                    cell.postMealLabel.backgroundColor = .orange
                    cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                    cell.postMealLabel.tag = indexPath.row

                }
                else
                {
                    cell.postMealLabel.setTitle("", for: .normal)
                    cell.postMealLabel.backgroundColor = .systemGray6
                }
                if localReadingData[indexPath.row].readingType == 4 {
                    cell.randomLabel.setTitle(String(value!), for: .normal)
                    cell.randomLabel.backgroundColor = .orange
                    cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                    cell.randomLabel.tag = indexPath.row
                }
                else
                {
                    cell.randomLabel.setTitle("", for: .normal)
                    cell.randomLabel.backgroundColor = .systemGray6
                }
                }
                if localReadingData[indexPath.row].status == "NORMAL" || localReadingData[indexPath.row].status == "LOW"
                {
                    if localReadingData[indexPath.row].readingType == 1 {
                        cell.fastingLabel.setTitle(String(value!), for: .normal)
                        cell.fastingLabel.backgroundColor = .systemGreen
                        cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                        cell.fastingLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.fastingLabel.setTitle("", for: .normal)
                        cell.fastingLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 2 {
                        cell.preMealLabel.setTitle(String(value!), for: .normal)
                        cell.preMealLabel.backgroundColor = .systemGreen
                        cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                        cell.preMealLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.preMealLabel.setTitle("", for: .normal)
                        cell.preMealLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 3 {
                        cell.postMealLabel.setTitle(String(value!), for: .normal)
                        cell.postMealLabel.backgroundColor = .systemGreen
                        cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                        cell.postMealLabel.tag = indexPath.row

                    }
                    else
                    {
                        cell.postMealLabel.setTitle("", for: .normal)
                        cell.postMealLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 4 {
                        cell.randomLabel.setTitle(String(value!), for: .normal)
                        cell.randomLabel.backgroundColor = .systemGreen
                        cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                        cell.randomLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.randomLabel.setTitle("", for: .normal)
                        cell.randomLabel.backgroundColor = .systemGray6
                    }
                }

                if localReadingData[indexPath.row].status == "DIABETIC" || localReadingData[indexPath.row].status == "HIGH"
                {
                    if localReadingData[indexPath.row].readingType == 1 {
                        cell.fastingLabel.setTitle(String(value!), for: .normal)
                        cell.fastingLabel.backgroundColor = .red
                        cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                        cell.fastingLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.fastingLabel.setTitle("", for: .normal)
                        cell.fastingLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 2 {
                        cell.preMealLabel.setTitle(String(value!), for: .normal)
                        cell.preMealLabel.backgroundColor = .red
                        cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                        cell.preMealLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.preMealLabel.setTitle("", for: .normal)
                        cell.preMealLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 3 {
                        cell.postMealLabel.setTitle(String(value!), for: .normal)
                        cell.postMealLabel.backgroundColor = .red
                        cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                        cell.postMealLabel.tag = indexPath.row

                    }
                    else
                    {
                        cell.postMealLabel.setTitle("", for: .normal)
                        cell.postMealLabel.backgroundColor = .systemGray6
                    }
                    if localReadingData[indexPath.row].readingType == 4 {
                        cell.randomLabel.setTitle(String(value!), for: .normal)
                        cell.randomLabel.backgroundColor = .red
                        cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                        cell.randomLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.randomLabel.setTitle("", for: .normal)
                        cell.randomLabel.backgroundColor = .systemGray6
                    }
                }
//                cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
//                cell.fastingLabel.tag = indexPath.row
//                cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
//                cell.preMealLabel.tag = indexPath.row
//                cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
//                cell.postMealLabel.tag = indexPath.row
//                cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
//                cell.randomLabel.tag = indexPath.row
            }
            else{
//                if filteredArray.count > 0
//                {
        //            print("controll is filtering")
        //            cell.dateLabel.backgroundColor = UIColor(red: 118, green: 214, blue: 255, alpha: 1)
                    let originalDateFormatter = DateFormatter()
                        originalDateFormatter.dateFormat = "yyyy-MM-dd"
                    let newDateFormatter = DateFormatter()
                        newDateFormatter.dateFormat = "d-MMM"
                    if let date: Date = originalDateFormatter.date(from: filteredArray[indexPath.row].date!) {
                                let dateInNewStringFormat: String = newDateFormatter.string(from: date)
//                                print("dateInNewStringFormat\(dateInNewStringFormat)")
                    cell.dateLabel.text = dateInNewStringFormat
                        
                    }
                    let value = filteredArray[indexPath.row].value
            //        print("value = \(value)")
            //        print("reading type \(readingDetails[indexPath.row].readingType)")

                   if filteredArray[indexPath.row].status == "PRE-DIABETIC"
                    {
                    if filteredArray[indexPath.row].readingType == 1 {
                        cell.fastingLabel.setTitle(String(value!), for: .normal)
                        cell.fastingLabel.backgroundColor = .orange
                        cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                        cell.fastingLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.fastingLabel.setTitle("", for: .normal)
                        cell.fastingLabel.backgroundColor = .systemGray6
                    }
                    if filteredArray[indexPath.row].readingType == 2 {
                        cell.preMealLabel.setTitle(String(value!), for: .normal)
                        cell.preMealLabel.backgroundColor = .orange
                        cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                        cell.preMealLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.preMealLabel.setTitle("", for: .normal)
                        cell.preMealLabel.backgroundColor = .systemGray6
                    }
                    if filteredArray[indexPath.row].readingType == 3 {
                        cell.postMealLabel.setTitle(String(value!), for: .normal)
                        cell.postMealLabel.backgroundColor = .orange
                        cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                        cell.postMealLabel.tag = indexPath.row

                    }
                    else
                    {
                        cell.postMealLabel.setTitle("", for: .normal)
                        cell.postMealLabel.backgroundColor = .systemGray6
                    }
                    if filteredArray[indexPath.row].readingType == 4 {
                        cell.randomLabel.setTitle(String(value!), for: .normal)
                        cell.randomLabel.backgroundColor = .orange
                        cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                        cell.randomLabel.tag = indexPath.row
                    }
                    else
                    {
                        cell.randomLabel.setTitle("", for: .normal)
                        cell.randomLabel.backgroundColor = .systemGray6
                    }
                    }
                    if filteredArray[indexPath.row].status == "NORMAL" || filteredArray[indexPath.row].status == "LOW"
                    {
                        if filteredArray[indexPath.row].readingType == 1 {
                            cell.fastingLabel.setTitle(String(value!), for: .normal)
                            cell.fastingLabel.backgroundColor = .systemGreen
                            cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                            cell.fastingLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.fastingLabel.setTitle("", for: .normal)
                            cell.fastingLabel.backgroundColor = .systemGray6
                        }
                        if filteredArray[indexPath.row].readingType == 2 {
                            cell.preMealLabel.setTitle(String(value!), for: .normal)
                            cell.preMealLabel.backgroundColor = .systemGreen
                            cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                            cell.preMealLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.preMealLabel.setTitle("", for: .normal)
                            cell.preMealLabel.backgroundColor = .systemGray6
                        }
                        if filteredArray[indexPath.row].readingType == 3 {
                            cell.postMealLabel.setTitle(String(value!), for: .normal)
                            cell.postMealLabel.backgroundColor = .systemGreen
                            cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                            cell.postMealLabel.tag = indexPath.row

                        }
                        else
                        {
                            cell.postMealLabel.setTitle("", for: .normal)
                            cell.postMealLabel.backgroundColor = .systemGray6
                        }
                        if filteredArray[indexPath.row].readingType == 4 {
                            cell.randomLabel.setTitle(String(value!), for: .normal)
                            cell.randomLabel.backgroundColor = .systemGreen
                            cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                            cell.randomLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.randomLabel.setTitle("", for: .normal)
                            cell.randomLabel.backgroundColor = .systemGray6
                        }
                    }

                    if filteredArray[indexPath.row].status == "DIABETIC" || filteredArray[indexPath.row].status == "HIGH"
                    {
                        if filteredArray[indexPath.row].readingType == 1 {
                            cell.fastingLabel.setTitle(String(value!), for: .normal)
                            cell.fastingLabel.backgroundColor = .red
                            cell.fastingLabel.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
                            cell.fastingLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.fastingLabel.setTitle("", for: .normal)
                            cell.fastingLabel.backgroundColor = .systemGray6
                        }
                        if filteredArray[indexPath.row].readingType == 2 {
                            cell.preMealLabel.setTitle(String(value!), for: .normal)
                            cell.preMealLabel.backgroundColor = .red
                            cell.preMealLabel.addTarget(self, action: #selector(action1(sender:)), for: .touchUpInside)
                            cell.preMealLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.preMealLabel.setTitle("", for: .normal)
                            cell.preMealLabel.backgroundColor = .systemGray6
                        }
                        if filteredArray[indexPath.row].readingType == 3 {
                            cell.postMealLabel.setTitle(String(value!), for: .normal)
                            cell.postMealLabel.backgroundColor = .red
                            cell.postMealLabel.addTarget(self, action: #selector(action2(sender:)), for: .touchUpInside)
                            cell.postMealLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.postMealLabel.setTitle("", for: .normal)
                            cell.postMealLabel.backgroundColor = .systemGray6
                        }
                        if readingDetails[indexPath.row].readingType == 4 {
                            cell.randomLabel.setTitle(String(value!), for: .normal)
                            cell.randomLabel.backgroundColor = .red
                            cell.randomLabel.addTarget(self, action: #selector(action3(sender:)), for: .touchUpInside)
                            cell.randomLabel.tag = indexPath.row
                        }
                        else
                        {
                            cell.randomLabel.setTitle("", for: .normal)
                            cell.randomLabel.backgroundColor = .systemGray6
                        }
                    }
//                }
            }
            cell1 = cell
        }
        return cell1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func apply(_ sender: UIButton) {

                dateRange(strstartDate: selectedDate!, strendDate: selectedEndDate!)
                
    }
    
    
    //To Fetch Selected date
//    func dateSelecter(start:String, end:String, selectedArray:[readingData])
//    {
////        let selectedDateArray = Date.dates(from: start, to: end)
////        print("dateArray \(selectedDateArray)")
//
//        if selectedArray.count > 0
//        {
//            for i in selectedArray
//            {
////                print("start \(start)")
////                print("end \(end)")
////                print("selectedArray \(i.date)")
//                if start == i.date
//                {
////                    print("The filtered start date \(i.date)")
//                    let obj = filteredDate(mydate: i.date!)
////                        filteredDate(myType: i.type!, myValue: i.value!, myStatus: i.status!, myDate: i.date!, myTime: i.time!)
//                    filteredArray.append(obj)
////                    print("The filtered start count \(filteredArray.count)")
//                }
//                if end == i.date
//                {
////                    print("The filtered end date \(i.date)")
//                    let obj = filteredDate(mydate: i.date!)
////                        filteredDate(myType: i.type!, myValue: i.value!, myStatus: i.status!, myDate: i.date!, myTime: i.time!)
//
//                    filteredArray.append(obj)
////                    print("The filtered end count \(filteredArray.count)")
//                }
//            }
//        }
////        print("count = \(filteredArray.count)")
//        logTB.reloadData()
////        if start == selectedArray[
//    }
    
    func dateRange(strstartDate:String, strendDate:String)
    {
        var dateFrom =  Date() // First date
        var dateTo = Date() // End date
        let fmt = DateFormatter()
        fmt.dateFormat = "yyy-MM-dd"
        dateFrom = fmt.date(from: strstartDate)! // user selected start date
        dateTo = fmt.date(from: strendDate)! // user selected End date


        while dateFrom <= dateTo {
            selectedDateArray.append(fmt.string(from: dateFrom))
            dateFrom = Calendar.current.date(byAdding: .day, value: 1, to: dateFrom)!

        }
        if Reachability.isConnectedToNetwork(){
        if readingDetails.count > 0
        {
            for i in readingDetails
            {
                if selectedDateArray.count > 0
                {
                    for j in selectedDateArray
                    {
                        if i.date == j
                        {
//                            print("filtered dates \(i.date)")
////                            print("filtered uid \(i.uid)")
//                            print("filtered type \(i.readingType)")
//                            print("filtered value \(i.value)")
//                            print("filtered status \(i.status)")
//                            print("filtered time \(i.time)")
                            self.errorLabel.isHidden = true
                            self.logTB.isHidden = false
                            let obj = filteredDate(myType: i.readingType!, myValue: i.value!, myStatus: i.status!, myDate: i.date!, myTime: i.time!)
                            filteredArray.append(obj)
                            self.logTB.reloadData()
                        }
                        if i.date != j{
//                            self.logTB.isHidden = true
//                            self.errorLabel.isHidden = false
//                            self.errorLabel.text = "No Data Found"
//                            self.logTB.setEmptyMessage("No Data Found")
                            let alert = UIAlertController(title: "Alert!", message: "No Data Found", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            present(alert, animated: true, completion: nil)
                        }
                    }
                }
                else
                {
                    
                            self.logTB.isHidden = true
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = "No Data Found"
                            self.logTB.setEmptyMessage("No Data Found")
//                        let alert = UIAlertController(title: "Alert!", message: "No Data Found", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                        present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        else
        {
            filteredArray.removeAll()
            if localReadingData.count > 0
            {
                for i in localReadingData
                {
                    if selectedDateArray.count > 0
                    {
                        for j in selectedDateArray
                        {
                            if i.date == j
                            {
    //                            print("filtered dates \(i.date)")
    ////                            print("filtered uid \(i.uid)")
    //                            print("filtered type \(i.readingType)")
    //                            print("filtered value \(i.value)")
    //                            print("filtered status \(i.status)")
    //                            print("filtered time \(i.time)")
                                self.errorLabel.isHidden = true
                                self.logTB.isHidden = false
                                let obj = filteredDate(myType: i.readingType!, myValue: i.value!, myStatus: i.status!, myDate: i.date!, myTime: i.time!)
                                filteredArray.append(obj)
                                self.logTB.reloadData()
                            }
//                            if i.date != j{
//    //                            self.logTB.isHidden = true
//    //                            self.errorLabel.isHidden = false
//    //                            self.errorLabel.text = "No Data Found"
//    //                            self.logTB.setEmptyMessage("No Data Found")
//                                let alert = UIAlertController(title: "Alert!", message: "No Data Found", preferredStyle: .alert)
//                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                                present(alert, animated: true, completion: nil)
//                            }
                        }
                    }
                    else
                    {
                        
                                self.logTB.isHidden = true
                                self.errorLabel.isHidden = false
                                self.errorLabel.text = "No Data Found"
                                self.logTB.setEmptyMessage("No Data Found")
    //                        let alert = UIAlertController(title: "Alert!", message: "No Data Found", preferredStyle: .alert)
    //                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //                        present(alert, animated: true, completion: nil)
                        }
                    }
                }
        }
//        print(selectedDateArray)
    }
    


    @objc func action(sender: UIButton){
        let buttonTag = sender.tag
        
//        performSegue(withIdentifier: "toShare", sender: self)
//         logdata = sender.tag
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "hello") as! ViewDataReadingViewController
        if Reachability.isConnectedToNetwork(){
        vc.reading = readingDetails[buttonTag].value
        vc.status = readingDetails[buttonTag].status
        vc.date = readingDetails[buttonTag].date
        }
        else{
            vc.reading = localReadingData[buttonTag].value
            vc.status = localReadingData[buttonTag].status
            vc.date = localReadingData[buttonTag].date
        }
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        //vc.popoverPresentationController?.sourceRect = sender.buttonGroup
        self.present(vc, animated: true, completion: nil)
//

    }
    
    @objc func action1(sender: UIButton){
        let buttonTag = sender.tag
        
//        performSegue(withIdentifier: "toShare", sender: self)
//         logdata = sender.tag
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "hello") as! ViewDataReadingViewController
        if Reachability.isConnectedToNetwork(){
        vc.reading = readingDetails[buttonTag].value
        vc.status = readingDetails[buttonTag].status
        vc.date = readingDetails[buttonTag].date
        }
        else{
            vc.reading = localReadingData[buttonTag].value
            vc.status = localReadingData[buttonTag].status
            vc.date = localReadingData[buttonTag].date
        }

        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: -300, y: 200, width: 200, height: 200)
        //vc.popoverPresentationController?.sourceRect = sender.buttonGroup
        self.present(vc, animated: true, completion: nil)
//

    }
    
    @objc func action2(sender: UIButton){
        let buttonTag = sender.tag
        
//        performSegue(withIdentifier: "toShare", sender: self)
//         logdata = sender.tag
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "hello") as! ViewDataReadingViewController
        if Reachability.isConnectedToNetwork(){
        vc.reading = readingDetails[buttonTag].value
        vc.status = readingDetails[buttonTag].status
        vc.date = readingDetails[buttonTag].date
        }
        else{
            vc.reading = localReadingData[buttonTag].value
            vc.status = localReadingData[buttonTag].status
            vc.date = localReadingData[buttonTag].date
        }

        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: -300, y: 200, width: 200, height: 200)
        //vc.popoverPresentationController?.sourceRect = sender.buttonGroup
        self.present(vc, animated: true, completion: nil)
//

    }
    
    @objc func action3(sender: UIButton){
        let buttonTag = sender.tag
        
//        performSegue(withIdentifier: "toShare", sender: self)
//         logdata = sender.tag
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "hello") as! ViewDataReadingViewController
        if Reachability.isConnectedToNetwork(){
        vc.reading = readingDetails[buttonTag].value
        vc.status = readingDetails[buttonTag].status
        vc.date = readingDetails[buttonTag].date
        }
        else{
            vc.reading = localReadingData[buttonTag].value
            vc.status = localReadingData[buttonTag].status
            vc.date = localReadingData[buttonTag].date
        }

        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 400
//
//        vc.preferredContentSize.width = 300
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: -300, y: 200, width: 200, height: 200)
        //vc.popoverPresentationController?.sourceRect = sender.buttonGroup
        self.present(vc, animated: true, completion: nil)
//

    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        if Reachability.isConnectedToNetwork()
        {
            Networking().readingList(token: newRefreshToken!) { [self] (data, error) in
                self.readingDetails.removeAll()
                self.readingDetails = (data as? [readingData])!
//                print("the count is = \(self.readingDetails.count)")

                if self.readingDetails.count > 0
                {
    //                let stringB = self.formattedDateFromString(dateString: self.readingDetails[0].date!, withFormat: "dd-MMM")
    //                print("date \(stringB)")

//                    print("uid \(self.readingDetails[0].uid)")
                    self.logTB.reloadData()
                }
    //            self.readingDetails.removeAll()
                
            }
        }
        else
        {
            getData()
        }
        
       
    }
    
    func getData() {
        localReadingData.removeAll()
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            localReadingList = try context.fetch(ReadingList.fetchRequest())
//            let obj = readingData().readingList(data: (localReadingList as? [String : Any])!)
//            readingDetails.append(obj)
            if localReadingList.count > 0 {
            for i in localReadingList{
                let obj = readingList(myType: Int(i.reading_type), myValue: Int(i.value), myStatus: i.status!, myDate: i.created_at!, myTime: i.reading_time!)
                localReadingData.append(obj)
                self.logTB.reloadData()
            }

            }
        }
        catch {
            print("failed")
        }
        }
    
    @IBAction func startDate(_ sender: UIButton) {
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let popupVC = storyboard.instantiateViewController(withIdentifier: "calendarView") as! CalendarViewController
//                popupVC.modalPresentationStyle = .overCurrentContext
//        popupVC.modalTransitionStyle = .crossDissolve
//                popupVC.preferredContentSize = CGSize(width: 400, height: 300)
//                let pVC = popupVC.popoverPresentationController
//        pVC?.permittedArrowDirections = .any
//                pVC?.delegate = self
//        pVC?.sourceView = sender
//                pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//        present(popupVC, animated: true, completion: nil)

        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "calendarView") as! CalendarViewController
        
        vc.delegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 300
//
//        vc.preferredContentSize.width = 400
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: 230, y: 220, width: 300, height: 200)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func endDate(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "calendarView1") as! EndCalendarViewController
        
        vc.delegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = []
//        vc.preferredContentSize.height = 300
//
//        vc.preferredContentSize.width = 400
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = CGRect(x: 200, y: 220, width: 300, height: 200)
        self.present(vc, animated: true, completion: nil)

        
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toShare"
//        {
//            let vc = segue.destination as! ViewDataReadingViewController
//            vc.reading = readingDetails[logdata].value
//
//            vc.status = readingDetails[logdata].status
//            vc.date = readingDetails[logdata].date
//        }
//    }
    
}

extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
}

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
