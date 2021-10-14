//
//  HomeViewController.swift
//  Gluco App
//
//  Created by Anjali on 4/6/21.
//http://cocoadocs.org/docsets/MBCircularProgressBar/0.3/


import UIKit
import UserNotifications
import Highcharts
import MBCircularProgressBar

class HomeViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, HIChartViewDelegate {
    
    func chartViewDidLoad(_ chart: HIChartView!) {
        print("chart view \(chart!)")
    }
   
    
//   
    
    
    
    var progress1: HalfCircleIndicator!
    var progress2: HalfCircleIndicator!
    var chartView: HIChartView!
    var val1:[Double] = [0.10,0.10,0.10,0.10,0.10,0.10]
    var val2:[Double] = [0.1,0.1,0.11,0.1,0.1,0.11]
    var chart:[HIChartView]!
    @IBOutlet var sliderCollectionView: UICollectionView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
//    @IBOutlet var slideScrollView: UIScrollView!
    var selectName:String?
    @IBOutlet var name: UILabel!
    var email:String?
    var userid:String?
    var latestReadingData:[latestAvgReading] = []
    var logReading:[readingData] = []
//    var username:String?
    
//    func chartViewDidLoad(_ chart: HIChartView!) {
//        <#code#>
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("latest reading \(latestReadingData.count)")
       var count = 0
  
        switch section {
        case 0:
            count = latestReadingData.count
//            return latestReadingData.count
        case 1:
            count = 1
//        return 1
        case 2:
            count = 1
//        return 1
        default:
//            count = 0
            break
        }
        print("count in number of row \(count)")
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("coming...")
        var cell1 = UICollectionViewCell()
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Progress", for: indexPath) as! ProgressCollectionViewCell
           
                        cell.latestResult.text = String(latestReadingData[indexPath.row].value) + " mg/dL"
                        cell.weeklyAvg.text = String(latestReadingData[indexPath.row].avgValue) + " mg/dL"
            
            cell.progressView.value = CGFloat(latestReadingData[indexPath.row].value)
//                    self.progressBar.emptyLineWidth = 20
            cell.progressView.emptyLineWidth = 15
            cell.progressView.progressLineWidth = 15
            cell.progressView.backgroundColor = .white
            cell.progressView.emptyLineColor = .systemGray5
            cell.progressView.emptyLineStrokeColor = .systemGray5

            cell.progressView.progressStrokeColor = UIColor(hexString: "#091a46")
            cell.progressView.progressColor = UIColor(hexString: "#091a46")

            cell.progressView1.value = CGFloat(latestReadingData[indexPath.row].avgValue)
//                    self.progressBar.emptyLineWidth = 20
            cell.progressView1.emptyLineWidth = 15
            cell.progressView1.progressLineWidth = 15
            cell.progressView.backgroundColor = .white
            cell.progressView1.emptyLineColor = .systemGray5
            cell.progressView1.emptyLineStrokeColor = .systemGray5

            cell.progressView1.progressStrokeColor = UIColor(hexString: "#ff9900")
            cell.progressView1.progressColor = UIColor(hexString: "#ff9900")

                        cell1 = cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionalImage1", for: indexPath) as! PromotionalImage1CollectionViewCell
                       cell.promotionalImg.image = UIImage(named: "App-Icon-2")
                       cell1 = cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionalImage2", for: indexPath) as! PromotionalImage2CollectionViewCell
                        cell.PromotionalImg.image = UIImage(named: "App-Icon-2")
                        cell1 = cell
        default:
            break
        }

        return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 294)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        if Reachability.isConnectedToNetwork(){
//            print("name \(userName)")
            name.text = "Welcome " + userName!
            print("home token \(newRefreshToken)")
//        Networking().refreshToken(refreshToken: newRefreshToken!) { (data, error) in
//                print("dataa \(data)")
//            if let obj = data as? NSDictionary
//            {
//                newToken = obj["data"] as? String ?? ""
//                print("new token \(newToken)")
                        Networking().viewRemainder(token: newRefreshToken!) { (data, error) in
                            if let obj = data as? NSDictionary
                            {
                                let labelName = obj["label_name"] as? String ?? ""
                                DispatchQueue.main.async {
                                    let content = UNMutableNotificationContent()
                                    content.title = NSString.localizedUserNotificationString(forKey: "Dr.Trust", arguments: nil)
                                    content.body = NSString.localizedUserNotificationString(forKey: labelName, arguments: nil)
                                    content.sound = UNNotificationSound.default
                                    content.categoryIdentifier = "notify-test"
                                    content.badge = NSNumber(value: obj.count)
                                    let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
                                    let request = UNNotificationRequest.init(identifier: "notify-test", content: content, trigger: trigger)
                
                                    let center = UNUserNotificationCenter.current()
                                    center.add(request)
                                }
                            }
                        }
                Networking().readingList(token: newRefreshToken!) { (data, error) in
                    self.logReading = (data as? [readingData])!
                    if self.logReading.count > 0
                    {
                        self.logData(token: newRefreshToken!, latestReading: self.logReading)
//                        self.sliderCollectionView.reloadData()
                    }
                }
            
            Networking().getProfilePic(token: newToken!) { (data, error) in
                if let mydata = data as? NSDictionary
                {
                    let image = mydata["profile_pic"] as? String ?? ""
                    let convertedImage = self.convertBase64ToImage(imageString: image)
                    print("imagr \(convertedImage)")
                    self.profileImg.image = convertedImage
                }
            }
                
                }
                
//                Networking().getProfilePic(token: newToken!) { (data, error) in
//                    if let mydata = data as? NSDictionary
//                    {
//                        let image = mydata["profile_pic"] as? String ?? ""
//                        let convertedImage = self.convertBase64ToImage(imageString: image)
//                        print("imagr \(convertedImage)")
//                        self.profileImg.image = convertedImage
//                    }
//                }
//        }
//
//
//        }
//        }
        else
        {
            name.text = "Welcome " + userName!
        }
        navigationController?.isNavigationBarHidden = true

    }
    

    func logData(token:String,latestReading:[readingData])
    {
        
        Networking().latestReading(token: token) { (data, error) in
            var dateArray = ["2021-05-01","2021-05-02","2021-05-03","2021-05-04","2021-05-05","2021-05-06","2021-05-07"]
            var value1:[Int] = []
            var average:Int?
            if let obj = data as? NSDictionary
            {
                //                self.latestReadingData.append(value)
                if self.logReading.count > 0 {
                    for i in self.logReading
                    {
                        let last7Days = Date.getDates(forLastNDays: 7)
//                        debugPrint(last7Days)
//                        for j in last7Days
                        for j in dateArray
                        {
                            if i.date == j
                            {
//                                var value1:[Int]
                                value1.append(i.value!)
                                average = self.addValue(a: value1)

                            }
                        }

                        }
                    let value = obj["value"] as? Int ?? 0
                    print("value \(value)")
                    let obj1 = latestAvgReading(myVal: value, myAvgVal: average!)
                    self.latestReadingData.append(obj1)
                    self.sliderCollectionView.reloadData()
                    
                                        //                    print("average \(average)")
//
//                    self.chartView = HIChartView(frame: CGRect(x: self.sliderCollectionView.bounds.origin.x,
//                                                               y: self.sliderCollectionView.bounds.origin.y + 20,
//                                                               width: self.sliderCollectionView.bounds.size.width,
//                                                              height: 200))
//                    self.chartView.backgroundColor = UIColor.systemGray5
//                    self.chartView.delegate = self
//                    let options = HIOptions()
//
//                        let chart = HIChart()
//                        chart.type = "pie"
//                        chart.plotShadow = HICSSObject()
//                        chart.plotShadow.width = 0
//                        options.chart = chart
//
////                        let title = HITitle()
////                        title.text = "Browser market shares in January, 2018"
////                        options.title = title
//
//                        let tooltip = HITooltip()
//                        tooltip.pointFormat = "{series.name}: <b>{point.percentage:.1f}%</b>"
//                        options.tooltip = tooltip
//
//                        let accessibility = HIAccessibility()
//                        accessibility.point = HIPoint()
//                        // accessibility.point.valueSuffix = "%"
//                        options.accessibility = accessibility
//
//                        let plotOptions = HIPlotOptions()
//                        plotOptions.pie = HIPie()
//                        plotOptions.pie.allowPointSelect = true
//                        plotOptions.pie.cursor = "pointer"
//                        let dataLabels = HIDataLabels()
//                        dataLabels.enabled = true
//                        dataLabels.format = "<b>{point.name}</b>: {point.percentage:.1f} %"
//                        plotOptions.pie.dataLabels = [dataLabels]
//                        options.plotOptions = plotOptions
//
//                        let brands = HIPie()
//                        brands.name = "Latest Result"
//                        // brands.colorByPoint = true
//
//                        let data1 = HIData()
//                        data1.name = "Latest Result"
//                    data1.y = NSNumber(value: value)
//                        data1.sliced = true
//                        data1.selected = true
//
//                        let data2 = HIData()
//                        data2.name = "Weekly Avg"
//                    data2.y =  average as NSNumber?
//
//
//
//                        brands.data = [data1, data2]
//
//                        options.series = [brands]
//
//                    self.chartView.options = options
//
//                    self.view.addSubview(self.chartView)
                      }

//
//                    self.chart.append(self.chartView)
//                    self.progress1 = HalfCircleIndicator(frame: CGRect(x: 30, y: 20, width: 350, height: 700), isInnerCircleExist: true)
//                    self.progress2 = HalfCircleIndicator(frame: CGRect(x: 50, y: 250, width: 200, height: 500))
//                    self.sliderCollectionView.addSubview(self.progress1)
//                    self.sliderCollectionView.addSubview(self.progress2)
//
//
//
//                    for i in self.latestReadingData
//                    {
//                        self.progress1.updateProgress(percent: self.progress1.value + CGFloat(i.value))
//                        self.progress2.updateProgress(percent: self.progress1.value + CGFloat(i.avgValue))
//                    }
                    
//                    self.view.addSubview(progress1)
//                    self.view.addSubview(progress2)
                    
//                    for (a,b) in zip(val1, val2)
//                    {
//                        progress1.updateProgress(percent: progress1.value + CGFloat(a))
//                        progress2.updateProgress(percent: progress1.value + CGFloat(b))
//                    }
                    }
                }
            }
    
    
    func addValue(a: [Int]) -> Int
    {
        print("a \(a)")
        var sum = 0
        var avg:Int?
        for i in a
        {
            sum = sum + i
            avg = sum/a.count
//            print("avg \(avg))")

        }
        print("avg \(avg))")
        return avg!
    }
    
     
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func convertBase64ToImage(imageString: String) -> UIImage {
            let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
            return UIImage(data: imageData)!
        }

    @IBAction func menu(_ sender: UIButton) {
        performSegue(withIdentifier: "toSidemenu", sender: self)
    }
    

}

extension Date {
    static func getDates(forLastNDays nDays: Int) -> [String] {
        let cal = NSCalendar.current
        // start with today
        var date = cal.startOfDay(for: Date())

        var arrDates = [String]()

        for _ in 1 ... nDays {
            // move back in time by one day:
            date = cal.date(byAdding: Calendar.Component.day, value: -1, to: date)!

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: date)
            arrDates.append(dateString)
        }
//        print(arrDates)
        return arrDates
    }
}
